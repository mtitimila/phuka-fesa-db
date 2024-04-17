create schema phuka_fesa;

use phuka_fesa;

create table  customers (
	customerID varchar(255) primary key not null,
    firstname varchar(255) not null,
    surname varchar(255) not null,
    email varchar(255) not null unique,
    my_password varchar(255) not null,
    date_joined datetime
);

create table my_account (
	account_id_number varchar(255) primary key not null,
	customerID varchar(255) not null,
    phonenumber varchar(255),
    balance float not null,
	CONSTRAINT FK_CustomerID FOREIGN KEY (customerID)
    REFERENCES customers(customerID)
);

create table investment_product (
	product_id varchar(255) primary key not null,
    account_id_number varchar(255),
    product_name varchar(255) not null,
    product_description text,
    minimum_investment float,
    CONSTRAINT FK_AccountNumberID FOREIGN KEY (account_id_number)
    REFERENCES my_account(account_id_number) 
);

create table auto_invest_feature(
	settings_id varchar(255) primary key not null,
    product_id varchar(255) not null,
    request_date datetime,
    start_date datetime,
    end_date datetime,
    frequency int,
    amount float,
    invest_status varchar(255),
    CONSTRAINT FK_ProductID FOREIGN KEY (product_id)
    REFERENCES investment_product(product_id)
);