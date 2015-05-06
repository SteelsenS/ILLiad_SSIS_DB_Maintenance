declare @TN_Purge varchar(20) = 'TN_Purge'

Begin Transaction @TN_Purge

declare @purgedate datetime = cast(dateadd(yy,-5,getdate()) as date)
declare @purgetn int = (select max(transactionnumber) from Transactions where creationdate < @purgedate)

delete
from
	BorrowingInvoices
where
	DateGenerated < @purgedate

delete
from
	InvoiceTracking
where
	TrackingDate < @purgedate

delete
from
	InvoicePayments
where
	PaymentDate < @purgedate

delete
from
	Billing
where
	TransactionNumber <= @purgetn

delete
from
	BillingDetails
where
	TransactionNumber <= @purgetn

delete
from
	BorrowingRequests
where
	TransactionNumber <= @purgetn

delete
from
	Citation
where
	TransactionNumber <= @purgetn

delete
from
	EMailCopies
where
	TransactionNumber <= @purgetn

delete
from
	History
where
	TransactionNumber <= @purgetn

delete
from
	Invoices
where
	TransactionNumber <= @purgetn

delete
from
	ISOBillingInfo
where
	TransactionNumber <= @purgetn

delete
from
	Notes
where
	TransactionNumber <= @purgetn

delete
from
	Tracking
where
	TransactionNumber <= @purgetn

delete
from
	transactions
where
	TransactionNumber <= @purgetn

delete
from
	CopyrightSessions
where
	TransactionNumber <= @purgetn

delete
from
	ISOControl
where
	TransactionNumber <= @purgetn

delete
from
	ESPUpdate
where
	TransactionNumber <= @purgetn

delete
from
	OriginalRequest
where
	TransactionNumber <= @purgetn

delete
from
	Resubmission
where
	TransactionNumber <= @purgetn

delete bp
from
	BorrowingPayments as bp
where
	bp.invoicenumber NOT IN
	(select invoicenumber from BorrowingInvoices)

delete bp
from
	BorrowingPayments as bp
where
	bp.invoicenumber NOT IN
	(select invoicenumber from BorrowingInvoices)

delete ie
from
	ISOExchange as ie
where
	ie.ISONumber NOT IN
	(select ISONumber from ISOControl)

COMMIT TRANSACTION @TN_Purge
go