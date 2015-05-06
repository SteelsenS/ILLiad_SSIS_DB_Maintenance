ILLiad\_SSIS\_DB\_Maintenance
==========================

SSIS package responsible for trimming DB and maintaining the archive

This project is written to expect a multi-site system but can be adjusted to single site by changing UsersAll / LenderAddressesAll references to Users / LenderAddresses.

## Structure ##
This project uses SQL Server Integration services. It depends on SQL Server Data Tools in Visual Studio 2012 - although it may run on Visual Studio 2010. It will only work for SQL Server 2012. There is a SQL subfolder that includes the scripts used to create the archive databases as well as the T-SQL Scripts used to merge "active" tables (those where values are expected to change, e.g., transactions is active, history is a log table). The T-SQL scripts used to purge old data are labled accordingly. The date parameter may be recorded in the script or overridden as a variable in the project.

**Important**: SQL files are present for reference, but in project have are consumed from variables. Changing the file in-folder will usually not affect operation. There is no build script to update variables automatically.

## Package Operation ##
Integration services packages are run sequentially. This application has a "Master" package defined as the entry point. It executes packages in sequence to:

1. Archive: 
	- Perform a merge of active tables
		- Transactions
		- Invoices
		- Billing
		- UsersAll
	- Compute newest record presently in reports db for log tables
		- BillingDetails
		- Citation
		- EmailCopies
		- InvoiceDetails
		- Hisotry
		- InvoiceTracking
		- INvoicePayments
		- Notes
		- UserNotes
		- CopyrightSessions
		- Tracking
		- WebSession (An active table but we treat it as a log)
	- Copy records from production newer than newest value in archive into archive
		- Sequence constraint runs this step after previous
		- Runs for each table above simultaneously 
2. Purge aged borrowing and Doc Del transactions
	1. Purge borrowing transactions and associated records older than cutoff (set to 5 years)
	2. Purge users who longer have any affiliated borrowing or doc del transactions.
3. Purge aged lending transactions
	1. Delete lending transactions and associated records older than cutoff (set to 3 years)
	2. Delete lender address records that lack associated transactions
4. Sync Addresses
	-	Our offsite facility does not maintain its addressbook - it is therefore copied nightly from central.
5.	Rebuild Indices
	-	This step is disabled since our DBA now handles this independently.


## Important Notes ##

###Archive Database###
SQL Scripts to create the archive database are provided in the SQL subfolder. It must exist prior to configuring new connection managers. Please adjust based on your needs.

###ILLiad Version###
This was developed and tested on ILLiad 8.5. It has not been tested on any other version.

###Connection Managers###
The ILLData connection manager reflects the database to be archived, the ILL_Reports manager reflects the archive database. Be sure to update according to local settings. **You should add accurate connection information as soon as possible as VS will be extremly slow without it**.

###Password Warning###
Visual studio may take a while to open the solution and complain about machine keys. You will need to store your own connection information in the project.

###SQL Files###
Again, the SQL files in the folder are for reference - the executed SQL is usually managed in a variable.
###Variables###
Executed SQL and computed maximums are stored in variables. The default value is needed for Intellisense to work and for the build to succeed. The expression controls the real execution value.
###Warning###
There is no guarantee, express or implied, that this package will work for you. You assume all liability for its use and testing and agree to not hold responsible its creator, owner, or any other party for damages resulting from its use. As with any time you are directly touching an application database there is a pretty good chance that it will break.  Make sure to take backups and only ever work in a development environment. There is no support from the vendor for this package and a pretty good likelihood that using it will void your warranty, so proceed with caution.