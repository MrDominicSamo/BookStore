using BookStoreService as service from '../../srv/service';
using from '@sap/cds/common';

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>PublishedAt}',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Page',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Value : genre_code,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Criticality : status.criticality,
                CriticalityRepresentation : #WithIcon,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
                Label : 'Currency',
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Stock',
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
            Value : status_code,
            Label : '{i18n>Status}',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>BookName}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Genre}',
            Value : genre_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PublishedAt}',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>Stock}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookStoreService.addStock',
            Label : 'Add Stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookStoreService.changePublishDate',
            Label : 'Change Publish Date',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookStoreService.EntityContainer/addDiscount',
            Label : '10% Discount',
        },
    ],
    UI.SelectionFields : [
        price,
        status_code,
        genre_code,
        title,
    ],
    UI.HeaderInfo : {
        TypeName : '{i18n>Book}',
        TypeNamePlural : '{i18n>Books}',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeImageUrl : 'sap-icon://education',
        Description : {
            $Type : 'UI.DataField',
            Value : genre_code,
        },
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
    UI.HeaderFacets : [
        
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookStoreService.addStock',
            Label : 'Add Stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookStoreService.changePublishDate',
            Label : 'Change Publish Date',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookStoreService.changeStatus',
            Label : 'Change Status',
        },
    ],
    );

annotate service.Books with {
    genre @(
        Common.Label : '{i18n>Genre}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'GenresVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : genre_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Genre',
        },
        Common.ValueListWithFixedValues : true,
        )
};

annotate service.Books with {
    title @(
        Common.Label : '{i18n>Title}',
        )
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

annotate service.Books with {
    status @(
        Common.Text : status.displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.Label : '{i18n>Status}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.BookStatus with {
    code @(
        Common.Label : 'status/code',
        Common.Text : displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Books with {
    currency @Common.ValueListWithFixedValues : true
};

annotate service.Currencies with {
    code @Common.Text : descr
};

annotate service.GenresVH with {
    code @(
        Common.Text : description,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};
