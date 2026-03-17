namespace db.bookstore;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Books : cuid, managed {
    title    : String(255);
    author   : Association to Authors;
    Chapters : Composition of many Chapters
                   on Chapters.book = $self;
}

entity Authors : cuid, managed {
    name  : String(255);
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
}
