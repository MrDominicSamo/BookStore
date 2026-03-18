using BookStoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>PublishedAt}',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Pages}',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Price}',
                Value : price,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Admin Infromation',
            ID : 'AdminInfromation',
            Target : '@UI.FieldGroup#AdminInfromation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>BookName}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Genre}',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PublishedAt}',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Pages}',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price}',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ],
    UI.SelectionFields : [
        genre,
        title,
        price,
    ],
    UI.HeaderInfo : {
        TypeName : '{i18n>Book}',
        TypeNamePlural : '{i18n>Books}',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : genre,
        },
        TypeImageUrl : 'sap-icon://education',
    },
    UI.FieldGroup #AdminInfromation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    genre @Common.Label : '{i18n>Genre}'
};

annotate service.Books with {
    title @Common.Label : '{i18n>Title}'
};

annotate service.Books with {
    price @Common.Label : '{i18n>Price}'
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.title,
            Label : '{i18n>Title}',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.pages,
            Label : '{i18n>Pages}',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.number,
            Label : '{i18n>Number}',
        },
    ]
);

