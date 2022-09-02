@EndUserText.label: 'Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
@UI.headerInfo: { typeName: 'Booking',
                  typeNamePlural: 'Bookings',
                  title.value: 'BookingId',
                  description.value: '_Book.BookName'

                }
define root view entity ZABC_C_BOOKING
  provider contract transactional_query
  as projection on ZABC_I_BOOKING
{
       @UI.facet: [
                     {
                         id:              'GeneralInformation',
                         type:            #COLLECTION,
                         label:           'General Information',
                         position:        10
                      },
                     {
                         id:              'AdminDataCollection',
                         type:            #COLLECTION,
                         label:           'Admin Data',
                         position:        20
                      },
                     {
                         id:              'BasicData',
                         purpose:         #STANDARD ,
                         parentId:        'GeneralInformation',
                         type:            #FIELDGROUP_REFERENCE,
                         label:           'Basic Data',
                         position:        10,
                         targetQualifier: 'BasicData'
                      },
                     {
                         id:              'ReaderData',
                         purpose:         #STANDARD ,
                         parentId:        'GeneralInformation',
                         type:            #FIELDGROUP_REFERENCE,
                         label:           'Reader',
                         position:        20,
                         targetQualifier: 'Reader'
                      }
                      ,
                     {
                         id:              'BookData',
                         purpose:         #STANDARD ,
                         parentId:        'GeneralInformation',
                         type:            #FIELDGROUP_REFERENCE,
                         label:           'Book',
                         position:        30,
                         targetQualifier: 'Book'
                      },
                     {
                         id:              'BookingTime',
                         purpose:         #STANDARD ,
                         parentId:        'GeneralInformation',
                         type:            #FIELDGROUP_REFERENCE,
                         label:           'Booking Time',
                         position:        40,
                         targetQualifier: 'BookingTime'
                      }]


       @UI.identification: [{ type: #FOR_ACTION, dataAction: 'returnTheBook', label: 'Return the Book' }]
       @UI.hidden: true
  key  BookingUuid,

       @Search: { defaultSearchElement: true }
       @UI.lineItem:       [{ position: 10, importance: #HIGH }]
       @UI.fieldGroup:     [{ position: 10, qualifier: 'BasicData' }]
       BookingId,

       @Consumption.valueHelpDefinition: [{ entity: { name: 'zabc_i_book',
                                                     element: 'BookId'} }]
       @Consumption.semanticObject: 'zabc_i_book'
       @ObjectModel.text.element: ['BookName']
       @UI.selectionField: [{ position: 20 }]
       @UI.lineItem:       [{ position: 20, importance: #HIGH }]
       @UI.fieldGroup:     [{ position: 20, qualifier: 'Book' }]
       BookId,

       _Book.BookName as BookName,

       @Consumption.valueHelpDefinition: [{ entity: { name: 'zabc_i_reader',
                                                      element: 'PersonId'} }]
       @Consumption.semanticObject: 'zlab_ui_reader'
       @ObjectModel.text.element: ['ReaderFullName']
       @UI.selectionField: [{ position: 30 }]
       @UI.lineItem:       [{ position: 30, importance: #HIGH }]
       @UI.fieldGroup:     [{ position: 30, qualifier: 'Reader' }]
       PersonId,
       
       _Reader.FullName as ReaderFullName,

       @UI.selectionField: [{ position: 40 }]
       @UI.lineItem:       [{ position: 40, importance: #HIGH }]
       @UI.fieldGroup:     [{ position: 40, qualifier: 'BasicData' }]
       BookingStatus,

       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       @UI.selectionField: [{ position: 50 }]
       @UI.lineItem:       [{ position: 50, importance: #HIGH }]
       @UI.fieldGroup:     [{ position: 50, qualifier: 'BookingTime' }]
       @UI.dataPoint: { title: 'Start Date' }
       BookingBegDate,

       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       @UI.selectionField: [{ position: 60 }]
       @UI.lineItem:       [{ position: 60, importance: #MEDIUM }]
       @UI.fieldGroup:     [{ position: 60, qualifier: 'BookingTime' }]
       BookingBegTime,

       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       @UI.selectionField: [{ position: 70 }]
       @UI.lineItem:       [{ position: 70, importance: #HIGH }]
       @UI.fieldGroup:     [{ position: 70, qualifier: 'BookingTime' }]
       @UI.dataPoint: { title: 'End Date' }
       BookingEndDate,

       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       @UI.selectionField: [{ position: 80 }]
       @UI.lineItem:       [{ position: 80, importance: #MEDIUM }]
       @UI.fieldGroup:     [{ position: 80, qualifier: 'BookingTime' }]
       BookingEndTime,

       /* Associations */
       _Book,
       _Reader
}
