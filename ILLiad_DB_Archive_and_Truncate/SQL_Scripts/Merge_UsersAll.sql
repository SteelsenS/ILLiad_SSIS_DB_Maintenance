/*Merge UsersAll*/

Merge ILLiadData_1_Reports.dbo.usersAll as target
	using ILLData.dbo.usersAll as source
		on target.username = source.username
when Matched
	then
	update
		set 
			target.UserName = source.UserName
			, target.LastName = source.LastName
			, target.FirstName = source.FirstName
			, target.SSN = source.SSN
			, target.Status = source.Status
			, target.EMailAddress = source.EMailAddress
			, target.Phone = source.Phone
			, target.Department = source.Department
			, target.NVTGC = source.NVTGC
			, target.Password = source.Password
			, target.NotificationMethod = source.NotificationMethod
			, target.DeliveryMethod = source.DeliveryMethod
			, target.LoanDeliveryMethod = source.LoanDeliveryMethod
			, target.LastChangedDate = source.LastChangedDate
			, target.AuthorizedUsers = source.AuthorizedUsers
			, target.Staff = source.Staff
			, target.Cleared = source.Cleared
			, target.Web = source.Web
			, target.Address = source.Address
			, target.Address2 = source.Address2
			, target.City = source.City
			, target.State = source.State
			, target.Zip = source.Zip
			, target.Site = source.Site
			, target.ExpirationDate = source.ExpirationDate
			, target.Special = source.Special
			, target.Number = source.Number
			, target.UserRequestLimit = source.UserRequestLimit
			, target.Organization = source.Organization
			, target.Fax = source.Fax
			, target.ShippingAcctNo = source.ShippingAcctNo
			, target.BillingCategory = source.BillingCategory
			, target.Country = source.Country
			, target.SAddress = source.SAddress
			, target.SAddress2 = source.SAddress2
			, target.SCity = source.SCity
			, target.SState = source.SState
			, target.SZip = source.SZip
			, target.PasswordHint = source.PasswordHint
			, target.SCountry = source.SCountry
			, target.RSSID = source.RSSID
			, target.AuthType = source.AuthType
			, target.UserInfo1 = source.UserInfo1
			, target.UserInfo2 = source.UserInfo2
			, target.UserInfo3 = source.UserInfo3
			, target.UserInfo4 = source.UserInfo4
			, target.UserInfo5 = source.UserInfo5


when not matched by target
	then
		insert (UserName, LastName, FirstName, SSN, Status, EMailAddress, Phone, Department, NVTGC, Password, NotificationMethod, DeliveryMethod, LoanDeliveryMethod, LastChangedDate, AuthorizedUsers, Staff, Cleared, Web, Address, Address2, City, State, Zip, Site, ExpirationDate, Special, Number, UserRequestLimit, Organization, Fax, ShippingAcctNo, BillingCategory, Country, SAddress, SAddress2, SCity, SState, SZip, PasswordHint, SCountry, RSSID, AuthType, UserInfo1, UserInfo2, UserInfo3, UserInfo4, UserInfo5)
		values (source.UserName, source.LastName, source.FirstName, source.SSN, source.Status, source.EMailAddress, source.Phone, source.Department, source.NVTGC, source.Password, source.NotificationMethod, source.DeliveryMethod, source.LoanDeliveryMethod, source.LastChangedDate, source.AuthorizedUsers, source.Staff, source.Cleared, source.Web, source.Address, source.Address2, source.City, source.State, source.Zip, source.Site, source.ExpirationDate, source.Special, source.Number, source.UserRequestLimit, source.Organization, source.Fax, source.ShippingAcctNo, source.BillingCategory, source.Country, source.SAddress, source.SAddress2, source.SCity, source.SState, source.SZip, source.PasswordHint, source.SCountry, source.RSSID, source.AuthType, source.UserInfo1, source.UserInfo2, source.UserInfo3, source.UserInfo4, source.UserInfo5);