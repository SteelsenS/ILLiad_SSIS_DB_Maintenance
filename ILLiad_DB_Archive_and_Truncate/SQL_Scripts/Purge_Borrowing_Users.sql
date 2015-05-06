declare @User_Purge varchar(20) = 'User_Purge'

BEGIN TRANSACTION @User_Purge

delete ua
from
	UsersALL ua
where
	ua.UserName not in
	(select UserName from Transactions)

delete un
from
	UserNotes un
where
	un.Username not in
	(select username from UsersALL)

delete ual
from
	UserAccountsLink ual
where
	ual.Username not in
	(select Username from UsersALL)

delete uac
from
	UserAccounts uac
where
	uac.InternalNo not in
	(select useraccountslink.InternalNo from UserAccountsLink)

delete e
from
	EmailCopies e
where
	e.EMailReference not in
	(select Username from UsersALL)
	and EMailType = 'User'

COMMIT TRANSACTION @User_Purge
go