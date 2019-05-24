<?PHP
// Start the session
//session_start();
include 'session.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="style/main.css">
    <title>Home</title>
</head>

    <?php
    include 'header.php';
    ?>
<body>
    <main>
        <h1>Azami Welcomes you!</h1>
        <br>
        <img src="/images/azami-lady-of-scrolls.png" />
        <?PHP
        include 'dice.php';
        ?>
    </main>
</body>
    <?php
    include 'footer.php';
    ?>