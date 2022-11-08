<?php
    function connect() {
        $db = new mysqli("localhost", "root", "", "wedkowanie");
        if ($db->connect_errno) {
            echo "Caught an error while connecting to the database: (" . $db->connect_errno . ") " . $db->connect_error;
        }
        return $db;
    }

    function fill_list() {
        $db = connect();

        $result = $db->query("SELECT nazwa, akwen, wojewodztwo FROM Ryby JOIN Lowisko ON Ryby.id = Lowisko.ryby_id WHERE rodzaj = 3;");

        if (!$result) {
            echo "Error: (" . $db->errno . ") " . $db->error;
        }
        
        while ($row = mysqli_fetch_array($result)) {
            echo "<li>{$row['nazwa']} pływa w rzece {$row['akwen']}, {$row['wojewodztwo']}</li>";
        }
    }

    function fill_table() {
        $db = connect();

        $result = $db->query("SELECT id, nazwa, wystepowanie FROM Ryby WHERE styl_zycia = 1");

        if (!$result) {
            echo "Error: (" . $db->errno . ") " . $db->error;
        }
        
        while ($row = mysqli_fetch_array($result)) {
            echo "<tr><td>{$row['id']}</td><td>{$row['nazwa']}</td><td>{$row['wystepowanie']}</td></tr>";
        }
    }
?>