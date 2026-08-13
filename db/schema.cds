namespace db.bookstore;

using {
    cuid,
    managed,
    sap.common.Currencies
} from '@sap/cds/common';

entity Books : cuid, managed {
    title       : String(255);
    author      : Association to Authors;
    genre       : Association to Genres;
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    currency    : Association to Currencies;
    stock       : Integer;
    status      : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity Genres {
    key code        : Genre;
        description : String;
}

type Genre : String enum {
    Fiction = 'Fiction';
    Science = 'Science';
    Cooking = 'Cooking';
    Fantasy = 'Fantasy';
    Hobby = 'Hobby';
    Adventure = 'Adventure';
    SelfHelp = 'Self-Help';
    NonFiction = 'Non-Fiction';
    Art = 'Art';
    Children = 'Children';
}

entity BookStatus {
    key code        : String(1) enum {
            Available = 'A';
            OutOfStock = 'O';
            LowStock = 'L'
        }
        criticality : Integer;
        displayText : String(20);
}

entity Authors : cuid, managed {
    name  : String(255);
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
    key book   : Association to Books;
        number : Integer;
        title  : String(255);
        pages  : Integer;
}
