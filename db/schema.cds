namespace db.bookstore;
using { cuid, managed } from '@sap/cds/common';

entity Books : cuid, managed {
        Title           : String(255);
        Author          : String(255);
        PublicationDate : Date;
        ISBN            : String(20);
}
