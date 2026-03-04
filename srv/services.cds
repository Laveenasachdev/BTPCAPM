using { sap.capire.bookstore as database } from '../db/schema';

service BookService {

    @readonly
    entity Books as projection on database.Books {
        *,
        case currency.code
            when 'EUR' then 'Euro'
            when 'USD' then 'US Dollar'
            when 'GBP' then 'Great Britain Pound'
        end as CDESC : String(20) @(title: '{i18n>CURRENCY}'),
        category as genre
    } excluding { createdAt, createdBy, modifiedAt, modifiedBy };

    @readonly
    entity Authors as projection on database.Authors;

    // @readonly entity AddressSrv as projection on database.Addresses;
    // @readonly entity BusinessPartnersSrv as projection on database.BusinessPartners;

}  // <-- CLOSED BookService properly



//---------------------------------------------------
// Orders Service (this MUST be inside a service!)
//---------------------------------------------------

service OrdersService {

    @restrict: [
        { grant: '*', to: 'Administrators' },
        { grant: '*', where: 'createdBy = $user' }
    ]
    entity Orders as projection on database.Orders;

    @restrict: [
        { grant: '*', to: 'Administrators' },
        { grant: '*', where: 'parent.createdBy = $user' }
    ]
    entity OrderItems as projection on database.OrderItems;
}



//---------------------------------------------------
// AdminService Extension
//---------------------------------------------------

using { AdminService } from '../node_modules/@sap/product-service-cds/srv/admin-service';

extend service AdminService with {
    entity Authors as projection on database.Authors;
}

annotate AdminService with @requires: 'Administrators';