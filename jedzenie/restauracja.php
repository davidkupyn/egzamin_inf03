<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="utf-8">
    <title>Wszystkie Smaki</title>
    <link rel="stylesheet" href="styl_1.css">
</head>

<body>
    <header>
        <h1>Witamy w restauracji „Wszystkie Smaki”</h1>
    </header>
    <section class="blocks">
        <div class="left-block">
            <img src="menu.jpg" alt="Nasze danie" class="image" />
        </div>
        <div class="right-block">
            <h4>U nas dobrze zjesz!</h4>
            <ol>
                <?php 
                    require_once('dynamiczna_lista.php');
                    select("localhost", "root", "", "baza");
                ?>
            </ol>
        </div>
    </section>
    <section class="bottom-section">
        <h2>Zarezerwuj stolik on-line</h2>
        <form method="post" action="rezerwacja.php" id="rezerwacja">
            <div class="form-block">
                <label>Data (format rrrr-mm-dd):</label>
                <input type="date" name="data" />
            </div>
            <div class="form-block">
                <label>Ile osób?:</label>
                <input type="number" name="ilosc_osob" />
            </div>
            <div class="form-block">
                <label>Twój numer telefonu:</label>
                <input type="text" name="telefon" />
            </div>
            <div class="form-block checkbox">
                <input type="checkbox" name="zgoda" />
                <label>Zgadzam się na przetwarzanie moich danych osobowych</label>
            </div>
            <div>
                <button class="button" type="reset" form="rezerwacja">wyczyść</button>
                <button class="button" form="rezerwacja">rezerwuj</button>
            </div>
        </form>
    </section>
    <footer>
        <p>Stronę internetową opracował: <i>00000000000</i></p>
    </footer>
</body>

</html>