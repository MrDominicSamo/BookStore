using {db.bookstore as db} from '../db/schema';

service BookStoreService {
    entity Books      as projection on db.Books
        actions {
            @(Common.SideEffects: {TargetProperties: ['stock']})
            action addStock();
            action changePublishDate(newDate: Date);
            @(Common.SideEffects: {TargetProperties: ['status_code']})
            action changeStatus( @(Common: {
                                     ValueListWithFixedValues: true,
                                     Label                   : 'New Status',
                                     ValueList               : {
                                         $Type         : 'Common.ValueListType',
                                         CollectionPath: 'BookStatus',
                                         Parameters    : [{
                                             $Type            : 'Common.ValueListParameterInOut',
                                             LocalDataProperty: newStatus,
                                             ValueListProperty: 'code',
                                         }],
                                     }
                                 })
                                 newStatus: String);
        };

    @(Common.SideEffects: {TargetEntities: ['/BookStoreService.EntityContainer/Books']})
    action addDiscount();

    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;

    entity GenresVH   as projection on db.Genres;
}

annotate BookStoreService.Books with @odata.draft.enabled;
annotate BookStoreService.Authors with @odata.draft.enabled;
