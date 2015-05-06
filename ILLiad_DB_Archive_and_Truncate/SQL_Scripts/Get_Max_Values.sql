use illiaddata_1_reports_dev

/* Get Max Values */

select Convert(varchar(23),isnull(max(chargedate),cast('1/1/1999' as datetime)),121) as Newest from BillingDetails

select isnull(max(transactionnumber),0) as Newest from Citation 

select isnull(max(ID),0) as Newest from EMailCopies 

select isnull(max(invoicenumber),0) as Newest from InvoiceDetails 

select Convert(varchar(23),isnull(max(datetime),cast('1/1/1999' as datetime)),121) as Newest from history 

select Convert(varchar(23),isnull(max(trackingdate), cast('1/1/1999' as datetime)),121) as Newest from InvoiceTracking 

select Convert(varchar(23),isnull(max(paymentdate),cast('1/1/1999' as datetime)),121) as Newest from InvoicePayments 

select isnull(max(id),0) as Newest from notes 

select Convert(varchar(23),isnull(max(notedate), cast('1/1/1999' as datetime)),121) as Newest from UserNotes 

select Convert(varchar(23),isnull(max(datetime), cast('1/1/1999' as datetime)),121) as Newest from copyrightsessions 

select Convert(varchar(23),isnull(max(datetime), cast('1/1/1999' as datetime)),121) as Newest from tracking 

select Convert(varchar(23),isnull(max(expiration), cast('1/1/1999' as datetime)),121) as Newest from websession 