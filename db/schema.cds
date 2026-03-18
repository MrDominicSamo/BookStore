namespace db.bookstore;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Books : cuid, managed {
    title       : String(255);
    author      : Association to Authors;
    genre       : String(255);
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    stock       : Integer;
    status      : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity BookStatus {
    key code        : String(1) enum {
            Available = 'A';
            OutOfStock = 'O';
            LowStock = 'L'
        }
        criticality : Integer;
        displayText: String(20);
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
