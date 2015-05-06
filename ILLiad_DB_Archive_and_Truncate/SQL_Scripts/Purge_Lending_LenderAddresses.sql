declare @Address_Purge varchar(20) = 'Address_Purge'

BEGIN TRANSACTION @Address_Purge

delete laa
/*select laa.lenderstring,laa.addressnumber,laa.NVTGC, t.TransactionNumber, t.ProcessType, t.nvtgc*/
from
LenderAddressesALL laa
	left join (select tr.transactionnumber,tr.processtype,tr.lendinglibrary,tr.lenderaddressnumber, ua.nvtgc from transactions tr join usersall ua on tr.username = ua.UserName) t /*Subset of transactions to exclude lend-only or borrow-only libraries*/
		on 
			laa.LenderString = t.LendingLibrary 
			and laa.addressnumber = t.lenderaddressnumber 
			and laa.NVTGC = t.nvtgc
where
	laa.nvtgc not in ('LAW','MED')
	and t.transactionnumber is null and laa.addressnumber <> 100 COMMIT TRANSACTION @Address_Purge 
go