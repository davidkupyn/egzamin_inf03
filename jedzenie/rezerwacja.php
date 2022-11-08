<?php
    function insertInto($username, $password, $servername, $database, $array) {
        $db = new mysqli($username, $password, $servername, $database);

        if ($db->connect_error) {
            return $db->connection_error;
        }

        $sql = "INSERT INTO rezerwacje (nr_stolika, data_rez, liczba_osob, telefon) VALUES (NULL, '{$array[0]}', {$array[1]}, {$array[2]})";
        $db->query($sql);
        $db->close();
    }

    function handleInput($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $data = $ilosc_osob = $telefon = $zgoda = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $data = handleInput($_POST["data"]);
        $ilosc_osob = handleInput($_POST["ilosc_osob"]);
        $telefon = handleInput($_POST["telefon"]);
        $zgoda = handleInput($_POST["zgoda"]);

        if (insertInto("localhost", "root", "", "baza", array($data, $ilosc_osob, $telefon)) == NULL) {
            echo "Dodano rezerwację do bazy";
        } else {
            echo "Nie udało się dodać rezerwacji do bazy";
        }
    }
