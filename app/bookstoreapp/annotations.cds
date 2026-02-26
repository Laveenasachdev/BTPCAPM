
using BookService as service from '../../srv/services';

annotate service.Books with @(
    UI.SelectionFields : [
        title,
        author,
        price,
        currency_code
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>TITLE}'
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
            Label : '{i18n>DESCR}',
            UI.Importance : #Medium,
            UI.TextArrangement : #TextOnly
        },
        {
            $Type : 'UI.DataField',
            Value : category_ID,
            Label : '{i18n>CAT_ID}'
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>STOCK}'
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : '{i18n>PRICE}',
            Importance : #High
        },
        {
            $Type : 'UI.DataField',
            Value : CDESC,
            Label : '{i18n>CURRENCY}',
            Importance : #High
        }
    ],

    UI.HeaderInfo : {
        TypeName: 'Book',
        TypeNamePlural: 'Book Details',
        Title: {
            Label: 'Book Title',
            Value: title
        },
        Description: {
            Label: 'Description',
            Value: category_ID
        },
        ImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfV9PBFu8BCir5aP3HoinQUmvGtO297ZvYDQ&s'
    },

    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Book Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Book Information',
                    Target : '@UI.FieldGroup#BookDetails'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Stock & Price Details',
                    Target : '@UI.FieldGroup#StockPrice'
                }
            ]
        }
    ],

    UI.FieldGroup #BookDetails : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'Book title'
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : 'Book Description'
            }
        ]
    },

    UI.FieldGroup #StockPrice : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Available Stock'
            },
            {
                $Type : 'UI.DataField',
                Value : price,
                Label : 'Price'
            },
            {
                $Type : 'UI.DataField',
                Value : CDESC,
                Label : '{i18n>CURRENCY}'
            }
        ]
    }
);
