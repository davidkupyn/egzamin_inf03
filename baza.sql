CREATE DATABASE baza;

USE baza;

CREATE TABLE lokale (
    id INTEGER PRIMARY KEY,
    nazwa TEXT,
    miasto TEXT,
    ulica TEXT,
    numer INTEGER
);

CREATE TABLE dania (
    id INTEGER PRIMARY KEY,
    typ INTEGER,
    nazwa TEXT,
    cena INTEGER
);

CREATE TABLE rezerwacje (
    id INTEGER PRIMARY KEY,
    nr_stolika INTEGER,
    data_rez DATE,
    liczba_osob INTEGER,
    telefon TEXT
);