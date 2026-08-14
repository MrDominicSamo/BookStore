const cds = require("@sap/cds");

module.exports = class BookStoreService extends cds.ApplicationService {
  init() {
    const { Books, Genre, Authors } = cds.entities;

    this.on("addDiscount", async () => {
      await UPDATE(Books).set({
        price: {
          func: "ROUND",
          args: [{ xpr: [{ ref: ["price"] }, "*", { val: 0.9 }] }, { val: 2 }],
        },
      });
    });

    this.on("addStock", "Books", async (req) => {
      const bookId = req.params[0].ID;

      await UPDATE(Books)
        .set({ stock: { "+=": 1 } })
        .where({ ID: bookId });
    });

    this.on("changePublishDate", "Books", async (req) => {
      const bookId = req.params[0].ID;
      const newDate = req.data.newDate;

      await UPDATE(Books).set({ publishedAt: newDate }).where({ ID: bookId });
    });

    this.on("changeStatus", "Books", async (req) => {
      const bookId = req.params[0].ID;
      const newStatus = req.data.newStatus;

      await UPDATE(Books).set({ status_code: newStatus }).where({ ID: bookId });
    });

    this.before("READ", "Books", async (req) => {
      console.log("Before READ Books");
    });

    this.on("READ", "Books", async (req, next) => {
      console.log("ON EVENT");
      return next();
    });

    this.after("READ", "Books", async (books, req) => {
      for (const book of books) {
        if (book.genre_code === Genre.Art) {
          book.price = book.price * 0.8;
        }
      }
      console.log("After READ Books");
    });

    this.after("READ", "Authors", async (authors) => {
      const ids = authors.map((author) => author.ID);

      console.log("Author IDs:", ids);

      const bookCounts = await SELECT.from(Books)
        .columns("author_ID", { func: "count" })
        .where({ author_ID: { in: ids } })
        .groupBy("author_ID");

      for (const author of authors) {
        const count = bookCounts.find((bc) => bc.author_ID === author.ID);
        author.bookCount = count ? count.count : 0;
      }

      console.log("Book Counts:", bookCounts);
    });

    return super.init();
  }
};
