
<?PHP
include 'databaseconnect.php';
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
    


<form action=""> 
  <select name="customers" onchange="showDeck(this.value)">
    <option value="">Select a customer:</option>
    <option value="1">SYSADMIN</option>
    <option value="2">TESTUSER1</option>
    <option value="3">TESTUSER2</option>
  </select>
</form>
<br>
<div id="txtHint">Deck info will be listed here...</div>

<script>
function showDeck(str) {
  var xhttp;  
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "deckquery.php?user="+str, true);
  xhttp.send();
}
</script>




  <?PHP
  /*
  foreach ($db->query(
  'Select cs.CardName, cs.CardTypes from public.cardstorage cs 
  Join 
  public.deck d
  on d.card_num = cs.id
  join public.user u
  on d.card_owner = u.id;')
 as $row) {
    echo '<b>' . $row['cardname'] . ' ' . $row['Cardtypes'] . ':' . '</b>';
    echo '<br/>';
  }*/
  ?>

</body>
<footer>
<?PHP
include '../footer.php';
?>
</footer>
</html>