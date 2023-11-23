
/*using queen_anne_curiosity_shop database
                                               Name: Garima Sharma
                                               StudentID: 300343374
*/
USE queen_anne_curiosity_shop;

 /*Customer table created*/
CREATE TABLE CUSTOMER(
	CustomerID		    Int		        NOT NULL AUTO_INCREMENT,
	LastName     		Char(25)		NOT NULL,
    FirstName			Char(25)		NOT NULL,
	Address      		varchar(35)		NOT NULL UNIQUE,
    City                varchar(35)     NOT NULL DEFAULT 'Seattle',
    State               Char(2)         NOT NULL DEFAULT 'WA',
    ZIP                 Char(5)         NOT NULL DEFAULT '98105',
    Phone               Char(12)        NOT NULL UNIQUE,
    EmailAddress        varchar(100)    NOT NULL UNIQUE,
	CONSTRAINT 			CUSTOMER_PK 	PRIMARY KEY(CustomerID)    
	);
   
/*Employee table created*/
CREATE TABLE EMPLOYEE(
	EmployeeID	    	Int		        NOT NULL AUTO_INCREMENT,
    LastName     		Char(25)		NOT NULL,
	FirstName			Char(25)		NOT NULL,
	Phone  		        Char(12)		NOT NULL UNIQUE,
    EmailAddress        varchar(100)    NOT NULL UNIQUE,
	CONSTRAINT 			EMPLOYEE_PK     PRIMARY KEY(EmployeeID)
	);
    
        /*Vendor table created*/
CREATE TABLE VENDOR(
	VendorID		    Int		        NOT NULL AUTO_INCREMENT,
	CompanyName			varchar(100)	NULL,
	ContactLastName     Char(25)		NOT NULL,
	ContactFirstName  	Char(35)		NOT NULL,
    Address      		varchar(35)		NOT NULL UNIQUE,
    City                varchar(35)     NOT NULL DEFAULT 'Seattle',
    State               Char(2)         NOT NULL DEFAULT 'WA',
    ZIP                 Char(5)         NOT NULL DEFAULT '98107',
    Phone               Char(12)        NOT NULL UNIQUE,
    Fax                 Char(12)         NULL,
	EmailAddress        varchar(100)     NOT NULL UNIQUE,
	CONSTRAINT 			VENDOR_PK 	     PRIMARY KEY(VendorID)
	);
    
        /*Item table created*/
CREATE TABLE ITEM(
	ItemID		        Int		        NOT NULL AUTO_INCREMENT,
	ItemDescription		varchar(100)	NOT NULL DEFAULT 'Antique Desk',
	PurchaseDate     	Date		    NOT NULL,
	ItemCost  		    Numeric(9,2)	NOT NULL,
    ItemPrice           Numeric(9,2)    NOT NULL,
    VendorID            Int             NOT NULL,
    CONSTRAINT 			ITEM_PK 	    PRIMARY KEY(ItemID),
    CONSTRAINT          ITEM_VEND_FK    FOREIGN KEY(VendorID)
                                              REFERENCES VENDOR(VendorID)
                                              ON UPDATE NO ACTION
								              ON DELETE NO ACTION
	);
    
            /*Sale table created*/
CREATE TABLE SALE(
	SaleID		        Int		        NOT NULL AUTO_INCREMENT,
	CustomerID      	Int		        NOT NULL,
	EmployeeID    	    Int		        NOT NULL,
	SaleDate  		    Date        	NOT NULL,
    SubTotal            Numeric(9,2)    NOT NULL,
    Tax                 Numeric(9,2)    NOT NULL,
    Total               Numeric(9,2)    NOT NULL,
    CONSTRAINT 			SALE_PK 	    PRIMARY KEY(SaleID),
    CONSTRAINT          SALE_CustID_FK    FOREIGN KEY(CustomerID)
                                              REFERENCES CUSTOMER(CustomerID)
                                              ON UPDATE NO ACTION
								              ON DELETE NO ACTION,
    CONSTRAINT          SALE_EmpID_FK    FOREIGN KEY(EmployeeID)
                                              REFERENCES EMPLOYEE(EmployeeID)
                                              ON UPDATE NO ACTION
								              ON DELETE NO ACTION
	);
    
/*Sale_Item table created*/
CREATE TABLE SALE_ITEM(
	SaleID		        Int		        NOT NULL,
	SaleItemID      	Int		        NOT NULL,
	ItemID    	        Int		        NOT NULL,
    ItemPrice           Numeric(9,2)    NOT NULL,
    CONSTRAINT 			SALE_PK 	    PRIMARY KEY(SaleID, SaleItemID),
    CONSTRAINT          SALE_ITEM_SaleID_FK    FOREIGN KEY(SaleID)
                                              REFERENCES SALE(SaleID)
                                              ON UPDATE NO ACTION
								              ON DELETE CASCADE,
    CONSTRAINT          SALE_ITEM_ItemID_FK    FOREIGN KEY(ItemID)
                                              REFERENCES ITEM(ItemID)
                                              ON UPDATE NO ACTION
								              ON DELETE CASCADE
	);

