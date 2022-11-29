<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styl_1.css">
    <title>Wędkowanie</title>
</head>
<body>
    <header>
        <h1>Portal dla wędkarzy</h1>
    </header>
    <section>
        <div class="left">
            <div class="first">
                <h3>Ryby zamieszkujące rzeki</h3>
                <ol>
                    <?php
                        include_once 'skrypt1.php';
                        $db = connect();
                        fill_list($db);
                    ?>
                </ol>
            </div>
            <div class="second">
                <h3>Ryby drapieżne naszych wód</h3>
                <table>
                    <tr>
                        <th>L.p.</th>
                        <th>Gatunek</th>
                        <th>Występowanie</th>
                    </tr>
                    <?php
                        fill_table($db);
                        disconnect($db);
                    ?>
                </table>
            </div>
        </div>
        <div class="right">
            <img src="ryba1.jpg" alt="Sum">
            <div>
                <a href="kwerendy.txt">Pobierz kwerendy</a>
            </div>
        </div>
    </section>
    <footer>
        <p>Stronę wykonał: 05080811696</p>
    </footer>
</body>
</html>