
<?PHP
include 'databaseconnect.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DeckViewer</title>
</head>
<header>
<?PHP
include '../header.php';
?>
</header>
<body>
    
<h1>Scripture Resources</h1>
  <br>

  <?PHP
  foreach ($db->query('SELECT book, chapter, verse, content FROM scriptures') as $row) {
    echo '<b>' . $row['book'] . ' ' . $row['chapter'] . ':' . $row['verse'] . '</b> - "' . $row['content'] . '"';
    echo '<br/>';
  }
  ?>

</body>
<footer>
<?PHP
include '../footer.php';
?>
</footer>
</html>