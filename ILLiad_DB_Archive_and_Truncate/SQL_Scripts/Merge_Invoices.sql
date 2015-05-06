/*Merge Invoices*/

Merge ILLiadData_1_Reports.dbo.invoices as target
	using ILLData.dbo.invoices as source
		on target.transactionnumber = source.transactionnumber
when Matched
	then
	update
		set 
			target.TransactionNumber = source.TransactionNumber
			, target.InvoiceNumber = source.InvoiceNumber
			, target.EntryDate = source.EntryDate
			, target.InvoiceDate = source.InvoiceDate
			, target.ItemAmount = source.ItemAmount
			, target.OtherFees = source.OtherFees

when not matched by target
	then
		insert (TransactionNumber, InvoiceNumber, EntryDate, InvoiceDate, ItemAmount, OtherFees)
		values (source.TransactionNumber, source.InvoiceNumber, source.EntryDate, source.InvoiceDate, source.ItemAmount, source.OtherFees);