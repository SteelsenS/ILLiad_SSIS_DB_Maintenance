/*Merge Transactions*/

Merge ILLiadData_1_Reports.dbo.transactions as target
	using ILLData.dbo.transactions as source
		on target.transactionnumber = source.transactionnumber
when Matched
	then
	update
		set
			target.TransactionNumber = source.TransactionNumber
			, target.Username = source.Username
			, target.RequestType = source.RequestType
			, target.LoanAuthor = source.LoanAuthor
			, target.LoanTitle = source.LoanTitle
			, target.LoanPublisher = source.LoanPublisher
			, target.LoanPlace = source.LoanPlace
			, target.LoanDate = source.LoanDate
			, target.LoanEdition = source.LoanEdition
			, target.PhotoJournalTitle = source.PhotoJournalTitle
			, target.PhotoJournalVolume = source.PhotoJournalVolume
			, target.PhotoJournalIssue = source.PhotoJournalIssue
			, target.PhotoJournalMonth = source.PhotoJournalMonth
			, target.PhotoJournalYear = source.PhotoJournalYear
			, target.PhotoJournalInclusivePages = source.PhotoJournalInclusivePages
			, target.PhotoArticleAuthor = source.PhotoArticleAuthor
			, target.PhotoArticleTitle = source.PhotoArticleTitle
			, target.CitedIn = source.CitedIn
			, target.CitedTitle = source.CitedTitle
			, target.CitedDate = source.CitedDate
			, target.CitedVolume = source.CitedVolume
			, target.CitedPages = source.CitedPages
			, target.NotWantedAfter = source.NotWantedAfter
			, target.AcceptNonEnglish = source.AcceptNonEnglish
			, target.AcceptAlternateEdition = source.AcceptAlternateEdition
			, target.TransactionStatus = source.TransactionStatus
			, target.TransactionDate = source.TransactionDate
			, target.ISSN = source.ISSN
			, target.ILLNumber = source.ILLNumber
			, target.ESPNumber = source.ESPNumber
			, target.LendingString = source.LendingString
			, target.BaseFee = source.BaseFee
			, target.PerPage = source.PerPage
			, target.Pages = source.Pages
			, target.DueDate = source.DueDate
			, target.RenewalsAllowed = source.RenewalsAllowed
			, target.SpecIns = source.SpecIns
			, target.Pieces = source.Pieces
			, target.LibraryUseOnly = source.LibraryUseOnly
			, target.AllowPhotocopies = source.AllowPhotocopies
			, target.LendingLibrary = source.LendingLibrary
			, target.ReasonForCancellation = source.ReasonForCancellation
			, target.CallNumber = source.CallNumber
			, target.Location = source.Location
			, target.Maxcost = source.Maxcost
			, target.ProcessType = source.ProcessType
			, target.ItemNumber = source.ItemNumber
			, target.LenderAddressNumber = source.LenderAddressNumber
			, target.Ariel = source.Ariel
			, target.Patron = source.Patron
			, target.PhotoItemAuthor = source.PhotoItemAuthor
			, target.PhotoItemPlace = source.PhotoItemPlace
			, target.PhotoItemPublisher = source.PhotoItemPublisher
			, target.PhotoItemEdition = source.PhotoItemEdition
			, target.DocumentType = source.DocumentType
			, target.InternalAcctNo = source.InternalAcctNo
			, target.PriorityShipping = source.PriorityShipping
			, target.Rush = source.Rush
			, target.CopyrightAlreadyPaid = source.CopyrightAlreadyPaid
			, target.WantedBy = source.WantedBy
			, target.SystemID = source.SystemID
			, target.ReplacementPages = source.ReplacementPages
			, target.IFMCost = source.IFMCost
			, target.CopyrightPaymentMethod = source.CopyrightPaymentMethod
			, target.ShippingOptions = source.ShippingOptions
			, target.CCCNumber = source.CCCNumber
			, target.IntlShippingOptions = source.IntlShippingOptions
			, target.ShippingAcctNo = source.ShippingAcctNo
			, target.ReferenceNumber = source.ReferenceNumber
			, target.CopyrightComp = source.CopyrightComp
			, target.TAddress = source.TAddress
			, target.TAddress2 = source.TAddress2
			, target.TCity = source.TCity
			, target.TState = source.TState
			, target.TZip = source.TZip
			, target.TCountry = source.TCountry
			, target.TFax = source.TFax
			, target.TEMailAddress = source.TEMailAddress
			, target.TNumber = source.TNumber
			, target.HandleWithCare = source.HandleWithCare
			, target.CopyWithCare = source.CopyWithCare
			, target.RestrictedUse = source.RestrictedUse
			, target.ReceivedVia = source.ReceivedVia
			, target.CancellationCode = source.CancellationCode
			, target.BillingCategory = source.BillingCategory
			, target.CCSelected = source.CCSelected
			, target.OriginalTN = source.OriginalTN
			, target.OriginalNVTGC = source.OriginalNVTGC
			, target.InProcessDate = source.InProcessDate
			, target.InvoiceNumber = source.InvoiceNumber
			, target.BorrowerTN = source.BorrowerTN
			, target.WebRequestForm = source.WebRequestForm
			, target.TName = source.TName
			, target.TAddress3 = source.TAddress3
			, target.IFMPaid = source.IFMPaid
			, target.ConnectorErrorStatus = source.ConnectorErrorStatus
			, target.BillingAmount = source.BillingAmount
			, target.BorrowerNVTGC = source.BorrowerNVTGC
			, target.CCCOrder = source.CCCOrder
			, target.ISOStatus = source.ISOStatus
			, target.ShippingDetail = source.ShippingDetail
			, target.OdysseyErrorStatus = source.OdysseyErrorStatus
			, target.WorldCatLCNumber = source.WorldCatLCNumber
			, target.Locations = source.Locations
			, target.FlagType = source.FlagType
			, target.FlagNote = source.FlagNote
			, target.CreationDate = source.CreationDate
			, target.ItemInfo1 = source.ItemInfo1
			, target.ItemInfo2 = source.ItemInfo2
			, target.ItemInfo3 = source.ItemInfo3
			, target.ItemInfo4 = source.ItemInfo4
			, target.ItemInfo5 = source.ItemInfo5
			, target.SpecialService = source.SpecialService
			, target.DeliveryMethod = source.DeliveryMethod
			, target.Web = source.Web
			, target.PMID = source.PMID
			, target.DOI = source.DOI
			, target.LastOverdueNoticeSent = source.LastOverdueNoticeSent
			, target.ExternalRequest = source.ExternalRequest
			, target.AEUrl = source.AEUrl
			, target.AEPassword = source.AEPassword
when not matched by target
	then
		insert (TransactionNumber, Username, RequestType, LoanAuthor, LoanTitle, LoanPublisher, LoanPlace, LoanDate, LoanEdition, PhotoJournalTitle, PhotoJournalVolume, PhotoJournalIssue, PhotoJournalMonth, PhotoJournalYear, PhotoJournalInclusivePages, PhotoArticleAuthor, PhotoArticleTitle, CitedIn, CitedTitle, CitedDate, CitedVolume, CitedPages, NotWantedAfter, AcceptNonEnglish, AcceptAlternateEdition, TransactionStatus, TransactionDate, ISSN, ILLNumber, ESPNumber, LendingString, BaseFee, PerPage, Pages, DueDate, RenewalsAllowed, SpecIns, Pieces, LibraryUseOnly, AllowPhotocopies, LendingLibrary, ReasonForCancellation, CallNumber, Location, Maxcost, ProcessType, ItemNumber, LenderAddressNumber, Ariel, Patron, PhotoItemAuthor, PhotoItemPlace, PhotoItemPublisher, PhotoItemEdition, DocumentType, InternalAcctNo, PriorityShipping, Rush, CopyrightAlreadyPaid, WantedBy, SystemID, ReplacementPages, IFMCost, CopyrightPaymentMethod, ShippingOptions, CCCNumber, IntlShippingOptions, ShippingAcctNo, ReferenceNumber, CopyrightComp, TAddress, TAddress2, TCity, TState, TZip, TCountry, TFax, TEMailAddress, TNumber, HandleWithCare, CopyWithCare, RestrictedUse, ReceivedVia, CancellationCode, BillingCategory, CCSelected, OriginalTN, OriginalNVTGC, InProcessDate, InvoiceNumber, BorrowerTN, WebRequestForm, TName, TAddress3, IFMPaid, ConnectorErrorStatus, BillingAmount, BorrowerNVTGC, CCCOrder, ISOStatus, ShippingDetail, OdysseyErrorStatus, WorldCatLCNumber, Locations, FlagType, FlagNote, CreationDate, ItemInfo1, ItemInfo2, ItemInfo3, ItemInfo4, ItemInfo5, SpecialService, DeliveryMethod, Web, PMID, DOI, LastOverdueNoticeSent, ExternalRequest, AEUrl, AEPassword)
		values (source.TransactionNumber, source.Username, source.RequestType, source.LoanAuthor, source.LoanTitle, source.LoanPublisher, source.LoanPlace, source.LoanDate, source.LoanEdition, source.PhotoJournalTitle, source.PhotoJournalVolume, source.PhotoJournalIssue, source.PhotoJournalMonth, source.PhotoJournalYear, source.PhotoJournalInclusivePages, source.PhotoArticleAuthor, source.PhotoArticleTitle, source.CitedIn, source.CitedTitle, source.CitedDate, source.CitedVolume, source.CitedPages, source.NotWantedAfter, source.AcceptNonEnglish, source.AcceptAlternateEdition, source.TransactionStatus, source.TransactionDate, source.ISSN, source.ILLNumber, source.ESPNumber, source.LendingString, source.BaseFee, source.PerPage, source.Pages, source.DueDate, source.RenewalsAllowed, source.SpecIns, source.Pieces, source.LibraryUseOnly, source.AllowPhotocopies, source.LendingLibrary, source.ReasonForCancellation, source.CallNumber, source.Location, source.Maxcost, source.ProcessType, source.ItemNumber, source.LenderAddressNumber, source.Ariel, source.Patron, source.PhotoItemAuthor, source.PhotoItemPlace, source.PhotoItemPublisher, source.PhotoItemEdition, source.DocumentType, source.InternalAcctNo, source.PriorityShipping, source.Rush, source.CopyrightAlreadyPaid, source.WantedBy, source.SystemID, source.ReplacementPages, source.IFMCost, source.CopyrightPaymentMethod, source.ShippingOptions, source.CCCNumber, source.IntlShippingOptions, source.ShippingAcctNo, source.ReferenceNumber, source.CopyrightComp, source.TAddress, source.TAddress2, source.TCity, source.TState, source.TZip, source.TCountry, source.TFax, source.TEMailAddress, source.TNumber, source.HandleWithCare, source.CopyWithCare, source.RestrictedUse, source.ReceivedVia, source.CancellationCode, source.BillingCategory, source.CCSelected, source.OriginalTN, source.OriginalNVTGC, source.InProcessDate, source.InvoiceNumber, source.BorrowerTN, source.WebRequestForm, source.TName, source.TAddress3, source.IFMPaid, source.ConnectorErrorStatus, source.BillingAmount, source.BorrowerNVTGC, source.CCCOrder, source.ISOStatus, source.ShippingDetail, source.OdysseyErrorStatus, source.WorldCatLCNumber, source.Locations, source.FlagType, source.FlagNote, source.CreationDate, source.ItemInfo1, source.ItemInfo2, source.ItemInfo3, source.ItemInfo4, source.ItemInfo5, source.SpecialService, source.DeliveryMethod, source.Web, source.PMID, source.DOI, source.LastOverdueNoticeSent, source.ExternalRequest, source.AEUrl, source.AEPassword);
