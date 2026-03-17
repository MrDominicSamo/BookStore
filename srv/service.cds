using { db.bookstore as db } from '../db/schema';

service BookStoreService {
    entity Books as projection on db.Books;
}