using BookStoreService as service from '../../srv/service';
annotate service.Authors with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'About',
            ID : 'About',
            Target : '@UI.FieldGroup#About',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Ebook',
            ID : 'Ebook',
            Target : '@UI.FieldGroup#Ebook',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Book Information',
            ID : 'BookInformation',
            Target : '@UI.FieldGroup#BookInformation',
        },
    ],
    UI.FieldGroup #Ebook : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : content,
                Label : 'Ebook file',
            },
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name',
        },
        {
            $Type : 'UI.DataField',
            Value : bookCount,
            Label : 'Books',
        },
    ],
    UI.FieldGroup #BookInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bookCount,
                Label : 'Book Count',
            },
        ],
    },
    UI.FieldGroup #About : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'Name',
            },
        ],
    },
);

