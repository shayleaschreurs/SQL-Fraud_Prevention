--schema
--drop tables
DROP TABLE IF EXISTS card_holder;
DROP TABLE IF EXISTS credit_card;
DROP TABLE IF EXISTS merchant_cat;
DROP TABLE IF EXISTS merchant;
DROP TABLE IF EXISTS transaction;

--create tables for each csv file
CREATE TABLE card_holder (
    cardholder_id INT PRIMARY KEY NOT NULL
    , customer_name VARCHAR(50)
);

CREATE TABLE credit_card (
    card_number VARCHAR(20) PRIMARY KEY NOT NULL
    , cardholder_id INT FOREIGN KEY REFERENCES card_holder(cardholder_id)
);

CREATE TABLE merchant_cat (
    merchant_type_id INT PRIMARY KEY NOT NULL
    , merchant_type VARCHAR(20) PRIMARY KEY NOT NULL
);

CREATE TABLE merchant (
    merchant_id INT PRIMARY KEY NOT NULL
    , merchant_name VARCHAR(100)
    , merchant_type_id INT FOREIGN KEY REFERENCES merchant_cat(merchant_type_id)
);

CREATE TABLE transaction (
    transaction_id INT PRIMARY KEY NOT NULL
    , date TIMESTAMP
    , amount VARCHAR(30)
    , card_number VARCHAR(20) FOREIGN KEY REFERENCES credit_card(card_number)
    , merchant_id INT FOREIGN KEY REFERENCES merchant(merchant_id)
);

--query tables
SELECT * FROM card_holder;
SELECT * FROM credit_card;
SELECT * FROM merchant_cat;
SELECT * FROM merchant;
SELECT * FROM transaction;

--next join some tables??

--questions for tutor: 1. how to save pg admin file/where to save it. 2. does my erd look good