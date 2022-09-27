<?php
function select($server, $user, $password, $database) {
    $db = new mysqli($server, "root", "", $database);

    if ($db->connect_error) {
        return $db->connection_error;
    }

    $sql = "SELECT * FROM dania LIMIT 3";
    $result = $db->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_array()) {
            echo "<li>{$row["nazwa"]} - {$row["cena"]} zł</li>";
        }
    } else {
        echo "Brak danych";
    }

    $db->close();
}