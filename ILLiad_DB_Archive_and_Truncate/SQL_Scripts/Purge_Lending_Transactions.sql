declare @Lending_Purge varchar(20) = 'Lending_Purge'

Begin Transaction @Lending_Purge

declare @purgedate datetime = cast(dateadd(yy,-3,getdate()) as date)
declare @purgetn int = (select max(transactionnumber) from Transactions where creationdate < @purgedate and processtype = 'Lending')

delete
from
	LendingInvoices
Where
	DateGenerated < @purgedate

delete
from
	ConnectorDetails
Where
	ConnectorDateTime < @purgedate

delete
from
	ConnectorSessions
Where
	SessionBeginDateTime < @purgedate

delete
from
	PrintSessions
Where
	PrintDateTime < @purgedate

delete
from
	WebSession
Where
	Expiration < @purgedate

delete
from
	Transactions
where
	TransactionNumber <= @purgetn 
	and ProcessType = 'Lending'

delete
from
	Billing
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	BillingDetails
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	EmailCopies
where
	EMailType = 'Transaction'
	and TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	ESPUpdate
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	History
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	Invoices
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	Notes
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	OriginalRequest
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	tracking
where
	TransactionNumber not in 
	(select TransactionNumber from transactions)

delete
from
	InvoiceDetails
where
	DetailNumber not in 
	(select transactionnumber from Transactions)

delete
from
	LendingPayments
where
	InvoiceNumber not in 
	(select InvoiceNumber from LendingInvoices)

delete
from
	PrintDetails
where
	SessionID not in 
	(select SessionID from PrintSessions)

COMMIT TRANSACTION @Lending_Purge
go