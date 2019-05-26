
<?PHP
#include 'databaseconnect.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="../style/main.css">
    <title>DeckViewer</title>
</head>
<header>
<?PHP
include '../header.php';
?>
</header>
<body>
    
  <?PHP
  include 'deckquery.php?user=1';
  ?>

</body>
<footer>
<?PHP
include '../footer.php';
?>
</footer>
</html>