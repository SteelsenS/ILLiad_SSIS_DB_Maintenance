/***********************************************************************************************/
/*First Create the database*/
/***********************************************************************************************/
--drop database ILLiadData_1_Reports_Dev
create database ILLiadData_1_Reports
go
/***********************************************************************************************/
/*Then set up the tables needed to hold the data*/
/***********************************************************************************************/

use ILLiadData_1_Reports
go
/***********************************************************************************************/
/*Billing*/
/***********************************************************************************************/
CREATE TABLE [dbo].[Billing](
	[TransactionNumber] [int] NOT NULL,
	[InternalNo] [float] NOT NULL,
	[Amount] [money] NULL,
	[Note] [nvarchar](100) NULL,
	[BillingDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[Processed] [nvarchar](3) NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC,
	[InternalNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/***********************************************************************************************/
/*BillingDetails*/
/***********************************************************************************************/
CREATE TABLE [dbo].[BillingDetails](
	[TransactionNumber] [int] NOT NULL,
	[ChargeName] [nvarchar](100) NOT NULL,
	[ChargeBase] [money] NULL,
	[ChargeUnit] [money] NULL,
	[ChargeQty] [int] NULL,
	[ChargeAmount] [money] NULL,
	[ChargeDesc] [nvarchar](250) NULL,
	[ChargeNote] [nvarchar](250) NULL,
	[ChargeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BillingDetail] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC,
	[ChargeName] ASC,
	[ChargeDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/***********************************************************************************************/
/*Citation*/
/***********************************************************************************************/
CREATE TABLE [dbo].[Citation](
	[TransactionNumber] [int] NOT NULL,
	[Citation1] [nvarchar](250) NULL,
	[Citation2] [nvarchar](250) NULL,
	[Citation3] [nvarchar](250) NULL,
	[Citation4] [nvarchar](250) NULL,
	[Citation5] [nvarchar](250) NULL,
	[Citation6] [nvarchar](250) NULL,
	[Citation7] [nvarchar](250) NULL,
	[Citation8] [nvarchar](250) NULL,
 CONSTRAINT [PK_Citation] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/***********************************************************************************************/
/*EmailCopies*/
/***********************************************************************************************/
CREATE TABLE [dbo].[EMailCopies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[EMailDate] [datetime] NOT NULL,
	[EMailType] [nvarchar](100) NULL,
	[EMailReference] [nvarchar](100) NULL,
	[EMailTo] [nvarchar](100) NULL,
	[EMailFrom] [nvarchar](100) NULL,
	[EMailCC] [nvarchar](100) NULL,
	[EMailBCC] [nvarchar](100) NULL,
	[Subject] [nvarchar](100) NULL,
	[Body] [nvarchar](max) NULL,
	[Staff] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
	[Note] [nvarchar](255) NULL,
	[NVTGC] [nvarchar](10) NULL,
 CONSTRAINT [PK_EMailCopies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[TransactionNumber] ASC,
	[EMailDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/***********************************************************************************************/
/*History*/
/***********************************************************************************************/
CREATE TABLE [dbo].[History](
	[TransactionNumber] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Entry] [nvarchar](250) NOT NULL,
	[Username] [nvarchar](50) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC,
	[DateTime] ASC,
	[Entry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/***********************************************************************************************/
/*Invoices*/
/***********************************************************************************************/
CREATE TABLE [dbo].[Invoices](
	[TransactionNumber] [int] NOT NULL,
	[InvoiceNumber] [nvarchar](40) NULL,
	[EntryDate] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[ItemAmount] [money] NULL,
	[OtherFees] [money] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/***********************************************************************************************/
/*Notes*/
/***********************************************************************************************/
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[NoteDate] [datetime] NOT NULL,
	[Note] [nvarchar](4000) NOT NULL,
	[AddedBy] [nvarchar](50) NULL,
	[NoteType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Notes] ADD  CONSTRAINT [DF_Notes_NoteType]  DEFAULT ('User') FOR [NoteType]
GO

/***********************************************************************************************/
/*Tracking*/
/***********************************************************************************************/
CREATE TABLE [dbo].[Tracking](
	[TransactionNumber] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[ChangedTo] [nvarchar](40) NOT NULL,
	[ChangedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tracking] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC,
	[DateTime] ASC,
	[ChangedTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/***********************************************************************************************/
/*Transactions*/
/***********************************************************************************************/
CREATE TABLE [dbo].[Transactions](
	[TransactionNumber] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RequestType] [nvarchar](8) NULL,
	[LoanAuthor] [nvarchar](100) NULL,
	[LoanTitle] [nvarchar](255) NULL,
	[LoanPublisher] [nvarchar](50) NULL,
	[LoanPlace] [nvarchar](30) NULL,
	[LoanDate] [nvarchar](30) NULL,
	[LoanEdition] [nvarchar](30) NULL,
	[PhotoJournalTitle] [nvarchar](255) NULL,
	[PhotoJournalVolume] [nvarchar](30) NULL,
	[PhotoJournalIssue] [nvarchar](30) NULL,
	[PhotoJournalMonth] [nvarchar](30) NULL,
	[PhotoJournalYear] [nvarchar](30) NULL,
	[PhotoJournalInclusivePages] [nvarchar](30) NULL,
	[PhotoArticleAuthor] [nvarchar](100) NULL,
	[PhotoArticleTitle] [nvarchar](250) NULL,
	[CitedIn] [nvarchar](40) NULL,
	[CitedTitle] [nvarchar](40) NULL,
	[CitedDate] [nvarchar](40) NULL,
	[CitedVolume] [nvarchar](40) NULL,
	[CitedPages] [nvarchar](40) NULL,
	[NotWantedAfter] [nvarchar](40) NULL,
	[AcceptNonEnglish] [nvarchar](3) NULL,
	[AcceptAlternateEdition] [nvarchar](3) NULL,
	[TransactionStatus] [nvarchar](40) NULL,
	[TransactionDate] [datetime] NULL,
	[ISSN] [nvarchar](20) NULL,
	[ILLNumber] [nvarchar](32) NULL,
	[ESPNumber] [nvarchar](32) NULL,
	[LendingString] [nvarchar](150) NULL,
	[BaseFee] [money] NULL,
	[PerPage] [money] NULL,
	[Pages] [int] NULL,
	[DueDate] [datetime] NULL,
	[RenewalsAllowed] [nvarchar](3) NULL,
	[SpecIns] [nvarchar](40) NULL,
	[Pieces] [int] NULL,
	[LibraryUseOnly] [nvarchar](3) NULL,
	[AllowPhotocopies] [nvarchar](3) NULL,
	[LendingLibrary] [nvarchar](40) NULL,
	[ReasonForCancellation] [nvarchar](100) NULL,
	[CallNumber] [nvarchar](255) NULL,
	[Location] [nvarchar](255) NULL,
	[Maxcost] [nvarchar](50) NULL,
	[ProcessType] [nvarchar](10) NULL,
	[ItemNumber] [nvarchar](10) NULL,
	[LenderAddressNumber] [float] NULL,
	[Ariel] [nvarchar](3) NULL,
	[Patron] [nvarchar](50) NULL,
	[PhotoItemAuthor] [nvarchar](100) NULL,
	[PhotoItemPlace] [nvarchar](40) NULL,
	[PhotoItemPublisher] [nvarchar](40) NULL,
	[PhotoItemEdition] [nvarchar](40) NULL,
	[DocumentType] [nvarchar](15) NULL,
	[InternalAcctNo] [float] NULL,
	[PriorityShipping] [nvarchar](3) NULL,
	[Rush] [nvarchar](30) NULL,
	[CopyrightAlreadyPaid] [nvarchar](3) NULL,
	[WantedBy] [nvarchar](25) NULL,
	[SystemID] [nvarchar](32) NULL,
	[ReplacementPages] [nvarchar](3) NULL,
	[IFMCost] [nvarchar](30) NULL,
	[CopyrightPaymentMethod] [nvarchar](50) NULL,
	[ShippingOptions] [nvarchar](50) NULL,
	[CCCNumber] [nvarchar](50) NULL,
	[IntlShippingOptions] [nvarchar](50) NULL,
	[ShippingAcctNo] [nvarchar](50) NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[CopyrightComp] [nvarchar](10) NULL,
	[TAddress] [nvarchar](100) NULL,
	[TAddress2] [nvarchar](100) NULL,
	[TCity] [nvarchar](50) NULL,
	[TState] [nvarchar](50) NULL,
	[TZip] [nvarchar](50) NULL,
	[TCountry] [nvarchar](50) NULL,
	[TFax] [nvarchar](50) NULL,
	[TEMailAddress] [nvarchar](50) NULL,
	[TNumber] [nvarchar](50) NULL,
	[HandleWithCare] [nvarchar](3) NULL,
	[CopyWithCare] [nvarchar](3) NULL,
	[RestrictedUse] [nvarchar](3) NULL,
	[ReceivedVia] [nvarchar](20) NULL,
	[CancellationCode] [nvarchar](50) NULL,
	[BillingCategory] [nvarchar](50) NULL,
	[CCSelected] [nvarchar](3) NULL,
	[OriginalTN] [int] NULL,
	[OriginalNVTGC] [nvarchar](20) NULL,
	[InProcessDate] [nvarchar](8) NULL,
	[InvoiceNumber] [int] NULL,
	[BorrowerTN] [int] NULL,
	[WebRequestForm] [nvarchar](100) NULL,
	[TName] [nvarchar](100) NULL,
	[TAddress3] [nvarchar](100) NULL,
	[IFMPaid] [nvarchar](3) NULL,
	[ConnectorErrorStatus] [nvarchar](50) NULL,
	[BillingAmount] [nvarchar](15) NULL,
	[BorrowerNVTGC] [nvarchar](20) NULL,
	[CCCOrder] [nvarchar](3) NULL,
	[ISOStatus] [nvarchar](50) NULL,
	[ShippingDetail] [nvarchar](50) NULL,
	[OdysseyErrorStatus] [nvarchar](50) NULL,
	[WorldCatLCNumber] [nvarchar](50) NULL,
	[Locations] [nvarchar](255) NULL,
	[FlagType] [nvarchar](50) NULL,
	[FlagNote] [nvarchar](250) NULL,
	[CreationDate] [datetime] NULL,
	[ItemInfo1] [nvarchar](255) NULL,
	[ItemInfo2] [nvarchar](255) NULL,
	[ItemInfo3] [nvarchar](255) NULL,
	[ItemInfo4] [nvarchar](255) NULL,
	[ItemInfo5] [nvarchar](255) NULL,
	[SpecialService] [nvarchar](3) NULL,
	[DeliveryMethod] [nvarchar](25) NULL,
	[Web] [nvarchar](3) NULL,
	[PMID] [nvarchar](20) NULL,
	[DOI] [nvarchar](50) NULL,
	[LastOverdueNoticeSent] [int] NULL,
	[ExternalRequest] [int] NULL,
	[AEUrl] [nvarchar](50) NULL,
	[AEPassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_RequestType]  DEFAULT ('Article') FOR [RequestType]
GO

ALTER TABLE [dbo].[Transactions] ADD  DEFAULT ('No') FOR [CopyrightAlreadyPaid]
GO

ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF__Transacti__CCSel__7B5B524B]  DEFAULT ('No') FOR [CCSelected]
GO

ALTER TABLE [dbo].[Transactions] ADD  CONSTRAINT [DF_Transactions_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO

/***********************************************************************************************/
/*CopyrightSessions*/
/***********************************************************************************************/
CREATE TABLE [dbo].[CopyrightSessions](
	[TransactionNumber] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[OrderHeader] [nvarchar](50) NOT NULL,
	[OrderDetail] [nvarchar](50) NOT NULL,
	[SubmittedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_CopyrightSessions] PRIMARY KEY CLUSTERED 
(
	[TransactionNumber] ASC,
	[OrderHeader] ASC,
	[OrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CopyrightSessions] ADD  CONSTRAINT [DF_CopyrightSessions_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO

/***********************************************************************************************/
/*WebSessions*/
/***********************************************************************************************/
CREATE TABLE [dbo].[WebSession](
	[Username] [nvarchar](50) NOT NULL,
	[SessionID] [nvarchar](255) NOT NULL,
	[Expiration] [datetime] NOT NULL,
	[SessionType] [nvarchar](50) NULL,
	[LastFormSignature] [nvarchar](100) NULL,
 CONSTRAINT [PK_WebSession] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[WebSession] ADD  CONSTRAINT [DF_WebSession_SessionType]  DEFAULT ('Default') FOR [SessionType]
GO

/***********************************************************************************************/
/*UsersAll*/
/***********************************************************************************************/
CREATE TABLE [dbo].[UsersALL](
	[UserName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[SSN] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](40) NULL,
	[EMailAddress] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[Department] [nvarchar](255) NULL,
	[NVTGC] [nvarchar](20) NULL,
	[Password] [nvarchar](64) NULL,
	[NotificationMethod] [nvarchar](8) NULL,
	[DeliveryMethod] [nvarchar](25) NULL,
	[LoanDeliveryMethod] [nvarchar](25) NULL,
	[LastChangedDate] [datetime] NULL,
	[AuthorizedUsers] [nvarchar](255) NULL,
	[Staff] [nvarchar](3) NULL,
	[Cleared] [nvarchar](3) NULL,
	[Web] [nvarchar](3) NULL,
	[Address] [nvarchar](40) NULL,
	[Address2] [nvarchar](40) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](10) NULL,
	[Site] [nvarchar](40) NULL,
	[ExpirationDate] [datetime] NULL,
	[Special] [nvarchar](3) NULL,
	[Number] [nvarchar](20) NULL,
	[UserRequestLimit] [nvarchar](5) NULL,
	[Organization] [nvarchar](50) NULL,
	[Fax] [nvarchar](15) NULL,
	[ShippingAcctNo] [nvarchar](50) NULL,
	[BillingCategory] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[SAddress] [nvarchar](40) NULL,
	[SAddress2] [nvarchar](40) NULL,
	[SCity] [nvarchar](30) NULL,
	[SState] [nvarchar](2) NULL,
	[SZip] [nvarchar](10) NULL,
	[PasswordHint] [nvarchar](50) NULL,
	[SCountry] [nvarchar](50) NULL,
	[RSSID] [nvarchar](50) NULL,
	[AuthType] [nvarchar](50) NULL,
	[UserInfo1] [nvarchar](255) NULL,
	[UserInfo2] [nvarchar](255) NULL,
	[UserInfo3] [nvarchar](255) NULL,
	[UserInfo4] [nvarchar](255) NULL,
	[UserInfo5] [nvarchar](255) NULL,
 CONSTRAINT [Users_UserName_PK] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UsersALL] ADD  CONSTRAINT [DF_Users_NVTGC]  DEFAULT ('ILL') FOR [NVTGC]
GO

ALTER TABLE [dbo].[UsersALL] ADD  CONSTRAINT [DF_Users_BillingCategory]  DEFAULT ('Default') FOR [BillingCategory]
GO

ALTER TABLE [dbo].[UsersALL] ADD  CONSTRAINT [DF_Users_AuthType]  DEFAULT ('ILLiad') FOR [AuthType]
GO

/***********************************************************************************************/
/*UserNotes*/
/***********************************************************************************************/
CREATE TABLE [dbo].[UserNotes](
	[Username] [nvarchar](50) NOT NULL,
	[NoteDate] [datetime] NOT NULL,
	[Note] [nvarchar](4000) NULL,
	[AddedBy] [nvarchar](20) NULL,
 CONSTRAINT [PK_UserNotes] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[NoteDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/***********************************************************************************************/
/*InvoiceDetails*/
/***********************************************************************************************/
CREATE TABLE [dbo].[InvoiceDetails](
	[InvoiceNumber] [int] NOT NULL,
	[DetailNumber] [int] NOT NULL,
	[DetailType] [nvarchar](50) NOT NULL,
	[ItemAmount] [money] NULL,
	[Citation] [nvarchar](255) NULL,
	[BillingDetails] [nvarchar](255) NULL,
	[ILLNumber] [nvarchar](50) NULL,
	[PaymentNumber] [int] NULL,
 CONSTRAINT [PK_InvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC,
	[DetailNumber] ASC,
	[DetailType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InvoiceDetails] ADD  CONSTRAINT [DF_InvoiceDetails_DetailType]  DEFAULT ('Transaction') FOR [DetailType]
GO

/***********************************************************************************************/
/*InvoicePayments*/
/***********************************************************************************************/
CREATE TABLE [dbo].[InvoicePayments](
	[InvoiceNumber] [int] NOT NULL,
	[PaymentNumber] [int] NOT NULL,
	[PaymentAmount] [money] NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[PaymentNotes] [nvarchar](100) NULL,
	[Staff] [nvarchar](50) NULL,
 CONSTRAINT [PK_InvoicePayments] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC,
	[PaymentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/***********************************************************************************************/
/*InvoiceTracking*/
/***********************************************************************************************/
CREATE TABLE [dbo].[InvoiceTracking](
	[InvoiceNumber] [int] NOT NULL,
	[TrackingDate] [datetime] NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
	[Staff] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_InvoiceTracking] PRIMARY KEY CLUSTERED 
(
	[InvoiceNumber] ASC,
	[TrackingDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO