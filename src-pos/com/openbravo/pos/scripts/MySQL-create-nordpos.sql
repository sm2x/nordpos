-- NORD POS is a fork of Openbravo POS.
-- Copyright (C) 2009-2016 Nord Trading Ltd. <http://www.nordpos.com>
-- This file is part of NORD POS.
-- NORD POS is free software: you can redistribute it and/or modify it under the
-- terms of the GNU General Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your option) any later
-- version.
-- NORD POS is distributed in the hope that it will be useful, but WITHOUT ANY
-- WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
-- A PARTICULAR PURPOSE. See the GNU General Public License for more details.
-- You should have received a copy of the GNU General Public License along with
-- NORD POS. If not, see <http://www.gnu.org/licenses/>.

-- Database initial script for MYSQL
-- NORD POS v3.0.6CE

CREATE TABLE APPLICATIONS (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    VERSION VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO APPLICATIONS(ID, NAME, VERSION) VALUES($APP_ID{}, $APP_NAME{}, $APP_VERSION{});

CREATE TABLE ROLES (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    PERMISSIONS MEDIUMBLOB,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX ROLES_NAME_INX ON ROLES(NAME);
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('0', 'Administrator role', $FILE{/com/openbravo/pos/templates/Role.Administrator.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('1', 'Manager role', $FILE{/com/openbravo/pos/templates/Role.Manager.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('2', 'Employee role', $FILE{/com/openbravo/pos/templates/Role.Employee.xml} );
INSERT INTO ROLES(ID, NAME, PERMISSIONS) VALUES('3', 'Guest role', $FILE{/com/openbravo/pos/templates/Role.Guest.xml} );

CREATE TABLE PEOPLE (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    APPPASSWORD VARCHAR(255),
    CARD VARCHAR(255),
    ROLE VARCHAR(255) NOT NULL,
    VISIBLE BIT NOT NULL,
    IMAGE MEDIUMBLOB,
    PROPERTIES MEDIUMBLOB,
    PRIMARY KEY (ID),
    CONSTRAINT PEOPLE_FK_1 FOREIGN KEY (ROLE) REFERENCES ROLES(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX PEOPLE_NAME_INX ON PEOPLE(NAME);
CREATE INDEX PEOPLE_CARD_INX ON PEOPLE(CARD);

INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, VISIBLE, IMAGE) VALUES ('0', 'Administrator', NULL, '0', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, VISIBLE, IMAGE) VALUES ('1', 'Manager', NULL, '1', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, VISIBLE, IMAGE) VALUES ('2', 'Employee', NULL, '2', TRUE, NULL);
INSERT INTO PEOPLE(ID, NAME, APPPASSWORD, ROLE, VISIBLE, IMAGE) VALUES ('3', 'Guest', NULL, '3', TRUE, NULL);

CREATE TABLE RESOURCES (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    RESTYPE INTEGER NOT NULL,
    CONTENT MEDIUMBLOB,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX RESOURCES_NAME_INX ON RESOURCES(NAME);
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('6', 'Printer.Ticket.Logo', 1, $FILE{/com/openbravo/pos/templates/Printer.Ticket.Logo.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('9', 'Window.Logo', 1, $FILE{/com/openbravo/pos/templates/Window.Logo.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('10', 'Window.Title', 0, $FILE{/com/openbravo/pos/templates/Window.Title.txt});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('11', 'Ticket.Buttons', 0, $FILE{/com/openbravo/pos/templates/Ticket.Buttons.xml});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('12', 'Ticket.Line', 0, $FILE{/com/openbravo/pos/templates/Ticket.Line.xml});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('14', 'Menu.Root', 0, $FILE{/com/openbravo/pos/templates/Menu.Root.bsh});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('17', 'payment.cash', 0, $FILE{/com/openbravo/pos/templates/Payment.Cash.bsh});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('18', 'banknote.50euro', 1, $FILE{/com/openbravo/pos/templates/banknote.50euro.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('19', 'banknote.20euro', 1, $FILE{/com/openbravo/pos/templates/banknote.20euro.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('20', 'banknote.10euro', 1, $FILE{/com/openbravo/pos/templates/banknote.10euro.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('21', 'banknote.5euro', 1, $FILE{/com/openbravo/pos/templates/banknote.5euro.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('22', 'coin.2euro', 1, $FILE{/com/openbravo/pos/templates/coin.2euro.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('23', 'coin.1euro', 1, $FILE{/com/openbravo/pos/templates/coin.1euro.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('24', 'coin.50cent', 1, $FILE{/com/openbravo/pos/templates/coin.50cent.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('25', 'coin.20cent', 1, $FILE{/com/openbravo/pos/templates/coin.20cent.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('26', 'coin.10cent', 1, $FILE{/com/openbravo/pos/templates/coin.10cent.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('27', 'coin.5cent', 1, $FILE{/com/openbravo/pos/templates/coin.5cent.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('28', 'coin.2cent', 1, $FILE{/com/openbravo/pos/templates/coin.2cent.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('29', 'coin.1cent', 1, $FILE{/com/openbravo/pos/templates/coin.1cent.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('90005', 'Window.Description', 0, $FILE{/com/openbravo/pos/templates/Window.Description.txt});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('90006', 'Window.DescLogo', 1, $FILE{/com/openbravo/pos/templates/Window.DescLogo.png});
INSERT INTO RESOURCES(ID, NAME, RESTYPE, CONTENT) VALUES('90007', 'Window.SupportBy', 1, $FILE{/com/openbravo/pos/templates/Window.SupportBy.png});

CREATE TABLE TAXCUSTCATEGORIES (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX TAXCUSTCAT_NAME_INX ON TAXCUSTCATEGORIES(NAME);

CREATE TABLE CUSTOMERS (
    ID VARCHAR(255) NOT NULL,
    SEARCHKEY VARCHAR(255) NOT NULL,
    TAXID VARCHAR(255),
    NAME VARCHAR(255) NOT NULL,
    TAXCATEGORY VARCHAR(255),
    CARD VARCHAR(255),
    MAXDEBT DOUBLE DEFAULT 0 NOT NULL,
    ADDRESS VARCHAR(255),
    ADDRESS2 VARCHAR(255),
    POSTAL VARCHAR(255),
    CITY VARCHAR(255),
    REGION VARCHAR(255),
    COUNTRY VARCHAR(255),
    FIRSTNAME VARCHAR(255),
    LASTNAME VARCHAR(255),
    EMAIL VARCHAR(255),
    PHONE VARCHAR(255),
    PHONE2 VARCHAR(255),
    FAX VARCHAR(255),
    NOTES VARCHAR(255),
    VISIBLE BIT DEFAULT b'1' NOT NULL,
    CURDATE DATETIME,
    CURDEBT DOUBLE,
    PROPERTIES MEDIUMBLOB,
    PRIMARY KEY (ID),
    CONSTRAINT CUSTOMERS_TAXCAT FOREIGN KEY (TAXCATEGORY) REFERENCES TAXCUSTCATEGORIES(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX CUSTOMERS_SKEY_INX ON CUSTOMERS(SEARCHKEY);
CREATE INDEX CUSTOMERS_TAXID_INX ON CUSTOMERS(TAXID);
CREATE INDEX CUSTOMERS_NAME_INX ON CUSTOMERS(NAME);
CREATE INDEX CUSTOMERS_CARD_INX ON CUSTOMERS(CARD);

CREATE TABLE CATEGORIES (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    CODE VARCHAR(255) NOT NULL,
    PARENTID VARCHAR(255),
    IMAGE MEDIUMBLOB,
    PRIMARY KEY(ID),
    CONSTRAINT CATEGORIES_FK_1 FOREIGN KEY (PARENTID) REFERENCES CATEGORIES(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX CATEGORIES_NAME_INX ON CATEGORIES(NAME);
INSERT INTO CATEGORIES(ID, NAME, CODE) VALUES ('000', 'Category Standard', '0001');

CREATE TABLE TAXCATEGORIES (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX TAXCAT_NAME_INX ON TAXCATEGORIES(NAME);
INSERT INTO TAXCATEGORIES(ID, NAME) VALUES ('000', 'Tax Exempt');
INSERT INTO TAXCATEGORIES(ID, NAME) VALUES ('001', 'Tax Standard');

CREATE TABLE TAXES (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    VALIDFROM DATETIME DEFAULT '2001-01-01 00:00:00' NOT NULL,
    CATEGORY VARCHAR(255) NOT NULL,
    CUSTCATEGORY VARCHAR(255),
    PARENTID VARCHAR(255),
    RATE DOUBLE NOT NULL,
    RATECASCADE BIT DEFAULT b'0' NOT NULL,
    RATEORDER INTEGER,
    PRIMARY KEY(ID),
    CONSTRAINT TAXES_CAT_FK FOREIGN KEY (CATEGORY) REFERENCES TAXCATEGORIES(ID),
    CONSTRAINT TAXES_CUSTCAT_FK FOREIGN KEY (CUSTCATEGORY) REFERENCES TAXCUSTCATEGORIES(ID),
    CONSTRAINT TAXES_TAXES_FK FOREIGN KEY (PARENTID) REFERENCES TAXES(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX TAXES_NAME_INX ON TAXES(NAME);
INSERT INTO TAXES(ID, NAME, CATEGORY, CUSTCATEGORY, PARENTID, RATE, RATECASCADE, RATEORDER) VALUES ('000', 'Tax Exempt', '000', NULL, NULL, 0, FALSE, NULL);
INSERT INTO TAXES(ID, NAME, CATEGORY, CUSTCATEGORY, PARENTID, RATE, RATECASCADE, RATEORDER) VALUES ('001', 'Tax Standard', '001', NULL, NULL, 0.10, FALSE, NULL);

CREATE TABLE ATTRIBUTE (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ATTRIBUTEVALUE (
    ID VARCHAR(255) NOT NULL,
    ATTRIBUTE_ID VARCHAR(255) NOT NULL,
    VALUE VARCHAR(255),
    PRIMARY KEY (ID),
    CONSTRAINT ATTVAL_ATT FOREIGN KEY (ATTRIBUTE_ID) REFERENCES ATTRIBUTE(ID) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ATTRIBUTESET (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ATTRIBUTEUSE (
    ID VARCHAR(255) NOT NULL,
    ATTRIBUTESET_ID VARCHAR(255) NOT NULL,
    ATTRIBUTE_ID VARCHAR(255) NOT NULL,
    LINENO INTEGER,
    PRIMARY KEY (ID),
    CONSTRAINT ATTUSE_SET FOREIGN KEY (ATTRIBUTESET_ID) REFERENCES ATTRIBUTESET(ID) ON DELETE CASCADE,
    CONSTRAINT ATTUSE_ATT FOREIGN KEY (ATTRIBUTE_ID) REFERENCES ATTRIBUTE(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX ATTUSE_LINE ON ATTRIBUTEUSE(ATTRIBUTESET_ID, LINENO);

CREATE TABLE ATTRIBUTESETINSTANCE (
    ID VARCHAR(255) NOT NULL,
    ATTRIBUTESET_ID VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(255),
    PRIMARY KEY (ID),
    CONSTRAINT ATTSETINST_SET FOREIGN KEY (ATTRIBUTESET_ID) REFERENCES ATTRIBUTESET(ID) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ATTRIBUTEINSTANCE (
    ID VARCHAR(255) NOT NULL,
    ATTRIBUTESETINSTANCE_ID VARCHAR(255) NOT NULL,
    ATTRIBUTE_ID VARCHAR(255) NOT NULL,
    VALUE VARCHAR(255),
    PRIMARY KEY (ID),
    CONSTRAINT ATTINST_SET FOREIGN KEY (ATTRIBUTESETINSTANCE_ID) REFERENCES ATTRIBUTESETINSTANCE(ID) ON DELETE CASCADE,
    CONSTRAINT ATTINST_ATT FOREIGN KEY (ATTRIBUTE_ID) REFERENCES ATTRIBUTE(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PRODUCTS (
    ID VARCHAR(255) NOT NULL,
    REFERENCE VARCHAR(255) NOT NULL,
    CODE VARCHAR(255) NOT NULL,
    CODETYPE VARCHAR(255),
    NAME VARCHAR(255) NOT NULL,
    PRICEBUY DOUBLE NOT NULL,
    PRICESELL DOUBLE NOT NULL,
    CATEGORY VARCHAR(255) NOT NULL,
    TAXCAT VARCHAR(255) NOT NULL,
    ATTRIBUTESET_ID VARCHAR(255),
    STOCKCOST DOUBLE,
    STOCKVOLUME DOUBLE,
    IMAGE MEDIUMBLOB,
    ISCOM BIT DEFAULT b'0' NOT NULL,
    ISSCALE BIT DEFAULT b'0' NOT NULL,
    ATTRIBUTES MEDIUMBLOB,
    PRIMARY KEY (ID),
    CONSTRAINT PRODUCTS_FK_1 FOREIGN KEY (CATEGORY) REFERENCES CATEGORIES(ID),
    CONSTRAINT PRODUCTS_TAXCAT_FK FOREIGN KEY (TAXCAT) REFERENCES TAXCATEGORIES(ID),
    CONSTRAINT PRODUCTS_ATTRSET_FK FOREIGN KEY (ATTRIBUTESET_ID) REFERENCES ATTRIBUTESET(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX PRODUCTS_INX_0 ON PRODUCTS(REFERENCE);
CREATE UNIQUE INDEX PRODUCTS_INX_1 ON PRODUCTS(CODE);
CREATE UNIQUE INDEX PRODUCTS_NAME_INX ON PRODUCTS(NAME);

CREATE TABLE PRODUCTS_CAT (
    PRODUCT VARCHAR(255) NOT NULL,
    CATORDER INTEGER,
    PRIMARY KEY (PRODUCT),
    CONSTRAINT PRODUCTS_CAT_FK_1 FOREIGN KEY (PRODUCT) REFERENCES PRODUCTS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX PRODUCTS_CAT_INX_1 ON PRODUCTS_CAT(CATORDER);

CREATE TABLE PRODUCTS_COM (
    ID VARCHAR(255) NOT NULL,
    PRODUCT VARCHAR(255) NOT NULL,
    PRODUCT2 VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT PRODUCTS_COM_FK_1 FOREIGN KEY (PRODUCT) REFERENCES PRODUCTS(ID),
    CONSTRAINT PRODUCTS_COM_FK_2 FOREIGN KEY (PRODUCT2) REFERENCES PRODUCTS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX PCOM_INX_PROD ON PRODUCTS_COM(PRODUCT, PRODUCT2);

CREATE TABLE LOCATIONS (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    ADDRESS VARCHAR(255),
    ISCLOSE BIT DEFAULT b'0' NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX LOCATIONS_NAME_INX ON LOCATIONS(NAME);
INSERT INTO LOCATIONS(ID, NAME,ADDRESS) VALUES('0', 'General', NULL);

CREATE TABLE STOCKDIARY (
    ID VARCHAR(255) NOT NULL,
    DATENEW DATETIME NOT NULL,
    REASON INTEGER NOT NULL,
    LOCATION VARCHAR(255) NOT NULL,
    PRODUCT VARCHAR(255) NOT NULL,
    ATTRIBUTESETINSTANCE_ID VARCHAR(255),
    UNITS DOUBLE NOT NULL,
    PRICE DOUBLE NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT STOCKDIARY_FK_1 FOREIGN KEY (PRODUCT) REFERENCES PRODUCTS(ID),
    CONSTRAINT STOCKDIARY_ATTSETINST FOREIGN KEY (ATTRIBUTESETINSTANCE_ID) REFERENCES ATTRIBUTESETINSTANCE(ID),
    CONSTRAINT STOCKDIARY_FK_2 FOREIGN KEY (LOCATION) REFERENCES LOCATIONS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX STOCKDIARY_INX_1 ON STOCKDIARY(DATENEW);

CREATE TABLE STOCKLEVEL (
    ID VARCHAR(255) NOT NULL,
    LOCATION VARCHAR(255) NOT NULL,
    PRODUCT VARCHAR(255) NOT NULL,
    STOCKSECURITY DOUBLE,
    STOCKMAXIMUM DOUBLE,
    PRIMARY KEY (ID),
    CONSTRAINT STOCKLEVEL_PRODUCT FOREIGN KEY (PRODUCT) REFERENCES PRODUCTS(ID),
    CONSTRAINT STOCKLEVEL_LOCATION FOREIGN KEY (LOCATION) REFERENCES LOCATIONS(ID)
 )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE STOCKCURRENT (
    LOCATION VARCHAR(255) NOT NULL,
    PRODUCT VARCHAR(255) NOT NULL,
    ATTRIBUTESETINSTANCE_ID VARCHAR(255),
    UNITS DOUBLE NOT NULL,
    ID VARCHAR(255),
    CONSTRAINT STOCKCURRENT_FK_1 FOREIGN KEY (PRODUCT) REFERENCES PRODUCTS(ID),
    CONSTRAINT STOCKCURRENT_ATTSETINST FOREIGN KEY (ATTRIBUTESETINSTANCE_ID) REFERENCES ATTRIBUTESETINSTANCE(ID),
    CONSTRAINT STOCKCURRENT_FK_2 FOREIGN KEY (LOCATION) REFERENCES LOCATIONS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX STOCKCURRENT_INX ON STOCKCURRENT(LOCATION, PRODUCT, ATTRIBUTESETINSTANCE_ID);

CREATE TABLE CLOSEDCASH (
    MONEY VARCHAR(255) NOT NULL,
    HOST VARCHAR(255) NOT NULL,
    HOSTSEQUENCE INTEGER NOT NULL,
    DATESTART DATETIME NOT NULL,
    DATEEND DATETIME,
    PRIMARY KEY(MONEY)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX CLOSEDCASH_INX_1 ON CLOSEDCASH(DATESTART);
CREATE UNIQUE INDEX CLOSEDCASH_INX_SEQ ON CLOSEDCASH(HOST, HOSTSEQUENCE);

CREATE TABLE RECEIPTS (
    ID VARCHAR(255) NOT NULL,
    MONEY VARCHAR(255) NOT NULL,
    DATENEW DATETIME NOT NULL,
    ATTRIBUTES MEDIUMBLOB,
    PRIMARY KEY(ID),
    CONSTRAINT RECEIPTS_FK_MONEY FOREIGN KEY (MONEY) REFERENCES CLOSEDCASH(MONEY)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX RECEIPTS_INX_1 ON RECEIPTS(DATENEW);
CREATE INDEX RECEIPTS_MONEY_INX ON RECEIPTS(MONEY);

CREATE TABLE TICKETS (
    ID VARCHAR(255) NOT NULL,
    TICKETTYPE INTEGER DEFAULT 0 NOT NULL,
    TICKETID INTEGER NOT NULL,
    PERSON VARCHAR(255) NOT NULL,
    CUSTOMER VARCHAR(255),
    STATUS INTEGER DEFAULT 0 NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT TICKETS_FK_ID FOREIGN KEY (ID) REFERENCES RECEIPTS(ID),
    CONSTRAINT TICKETS_FK_2 FOREIGN KEY (PERSON) REFERENCES PEOPLE(ID),
    CONSTRAINT TICKETS_CUSTOMERS_FK FOREIGN KEY (CUSTOMER) REFERENCES CUSTOMERS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX TICKETS_TICKETID ON TICKETS(TICKETTYPE, TICKETID);

CREATE TABLE TICKETSNUM (ID INTEGER NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO TICKETSNUM VALUES(1);

CREATE TABLE TICKETSNUM_REFUND (ID INTEGER NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO TICKETSNUM_REFUND VALUES(1);

CREATE TABLE TICKETSNUM_PAYMENT (ID INTEGER NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO TICKETSNUM_PAYMENT VALUES(1);

CREATE TABLE TICKETLINES (
    TICKET VARCHAR(255) NOT NULL,
    LINE INTEGER NOT NULL,
    PRODUCT VARCHAR(255),
    ATTRIBUTESETINSTANCE_ID VARCHAR(255),
    UNITS DOUBLE NOT NULL,
    PRICE DOUBLE NOT NULL,
    TAXID VARCHAR(255) NOT NULL,
    ATTRIBUTES MEDIUMBLOB,
    ID VARCHAR(255),
    PRIMARY KEY (TICKET, LINE),
    CONSTRAINT TICKETLINES_FK_TICKET FOREIGN KEY (TICKET) REFERENCES TICKETS(ID),
    CONSTRAINT TICKETLINES_FK_2 FOREIGN KEY (PRODUCT) REFERENCES PRODUCTS(ID),
    CONSTRAINT TICKETLINES_ATTSETINST FOREIGN KEY (ATTRIBUTESETINSTANCE_ID) REFERENCES ATTRIBUTESETINSTANCE(ID),
    CONSTRAINT TICKETLINES_FK_3 FOREIGN KEY (TAXID) REFERENCES TAXES(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PAYMENTS (
    ID VARCHAR(255) NOT NULL,
    RECEIPT VARCHAR(255) NOT NULL,
    PAYMENT VARCHAR(255) NOT NULL,
    TOTAL DOUBLE NOT NULL,
    TRANSID VARCHAR(255),
    RETURNMSG MEDIUMBLOB,
    PRIMARY KEY (ID),
    CONSTRAINT PAYMENTS_FK_RECEIPT FOREIGN KEY (RECEIPT) REFERENCES RECEIPTS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX PAYMENTS_INX_1 ON PAYMENTS(PAYMENT);
CREATE INDEX PAYMENTS_RECEIPT_INX ON PAYMENTS(RECEIPT);

CREATE TABLE TAXLINES (
    ID VARCHAR(255) NOT NULL,
    RECEIPT VARCHAR(255) NOT NULL,
    TAXID VARCHAR(255) NOT NULL,
    BASE DOUBLE NOT NULL,
    AMOUNT DOUBLE NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT TAXLINES_TAX FOREIGN KEY (TAXID) REFERENCES TAXES(ID),
    CONSTRAINT TAXLINES_RECEIPT FOREIGN KEY (RECEIPT) REFERENCES RECEIPTS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX TAXLINES_RECEIPT_INX ON TAXLINES(RECEIPT);

CREATE TABLE FLOORS (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    IMAGE MEDIUMBLOB,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX FLOORS_NAME_INX ON FLOORS(NAME);
INSERT INTO FLOORS(ID, NAME, IMAGE) VALUES ('0', 'Restaurant floor', $FILE{/com/openbravo/pos/templates/restaurantsample.png});

CREATE TABLE PLACES (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    X INTEGER NOT NULL,
    Y INTEGER NOT NULL,
    FLOOR VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT PLACES_FK_1 FOREIGN KEY (FLOOR) REFERENCES FLOORS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX PLACES_NAME_INX ON PLACES(NAME);
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('1', 'Table 1', 133, 151, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('2', 'Table 2', 532, 151, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('3', 'Table 3', 133, 264, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('4', 'Table 4', 266, 264, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('5', 'Table 5', 399, 264, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('6', 'Table 6', 532, 264, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('7', 'Table 7', 133, 377, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('8', 'Table 8', 266, 377, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('9', 'Table 9', 399, 377, '0');
INSERT INTO PLACES(ID, NAME, X, Y, FLOOR) VALUES ('10', 'Table 10', 532, 377, '0');

CREATE TABLE RESERVATIONS (
    ID VARCHAR(255) NOT NULL,
    CREATED DATETIME NOT NULL,
    DATENEW DATETIME DEFAULT '2001-01-01 00:00:00' NOT NULL,
    TITLE VARCHAR(255) NOT NULL,
    CHAIRS INTEGER NOT NULL,
    ISDONE BIT NOT NULL,
    DESCRIPTION VARCHAR(255),
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE INDEX RESERVATIONS_INX_1 ON RESERVATIONS(DATENEW);

CREATE TABLE RESERVATION_CUSTOMERS (
    ID VARCHAR(255) NOT NULL,
    CUSTOMER VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT RES_CUST_FK_1 FOREIGN KEY (ID) REFERENCES RESERVATIONS(ID),
    CONSTRAINT RES_CUST_FK_2 FOREIGN KEY (CUSTOMER) REFERENCES CUSTOMERS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE GEOLAYERS (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    VISIBLE BIT DEFAULT b'1' NOT NULL,    
    IMAGE MEDIUMBLOB,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX GEOLAYERS_NAME_INX ON GEOLAYERS(NAME);
INSERT INTO GEOLAYERS(ID, NAME) VALUES ('0', 'Cities');

CREATE TABLE GEOMARKERS (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255),
    LATITUDE DOUBLE NOT NULL,
    LONGITUDE DOUBLE NOT NULL,
    VISIBLE BIT DEFAULT b'1' NOT NULL,
    GEOLAYER VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID),
    CONSTRAINT GEOMARKERS_FK_1 FOREIGN KEY (GEOLAYER) REFERENCES GEOLAYERS(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('1', 'Astana', '51.14', '71.44', '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('2', 'Madrid', 40.39, -3.72, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('3', 'Istanbul', 41.01, 28.97, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('4', 'London', 51.49, 0.0, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('5', 'Paris', 48.86, 2.36, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('6', 'Moscow', 55.75, 37.62, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('7', 'Beijing', 39.9, 116.39, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('8', 'Cairo',30.05, 31.24, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('9', 'Berlin', 52.51, 13.4, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('10', 'Rome', 41.90, 12.49, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('11', 'Delhi', 28.63, 77.22, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('12', 'Melbourne', -37.82, 145.0, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('13', 'Buenos Aires', -34.67, -58.46, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('14', 'Mexico City', 19.43, -99.14, '0');
INSERT INTO GEOMARKERS(ID, NAME, LATITUDE, LONGITUDE, GEOLAYER) VALUES ('15', 'New York', 40.78, -73.97, '0');

CREATE TABLE SHAREDTICKETS (
    ID VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    CONTENT MEDIUMBLOB,
    PRIMARY KEY(ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
