/*Merge Billing*/

Merge ILLiadData_1_Reports.dbo.billing as target
	using ILLData.dbo.billing as source
		on target.transactionnumber = source.transactionnumber
when Matched
	then
	update
		set 
			target.TransactionNumber = source.TransactionNumber
			, target.InternalNo = source.InternalNo
			, target.Amount = source.Amount
			, target.Note = source.Note
			, target.BillingDate = source.BillingDate
			, target.InvoiceDate = source.InvoiceDate
			, target.Processed = source.Processed

when not matched by target
	then
		insert (TransactionNumber, InternalNo, Amount, Note, BillingDate, InvoiceDate, Processed)
		values (source.TransactionNumber, source.InternalNo, source.Amount, source.Note, source.BillingDate, source.InvoiceDate, source.Processed);