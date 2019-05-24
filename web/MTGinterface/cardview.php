<?PHP
include 'cardquery.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="../style/main.css">
    <title>Cardviewer</title>
</head>
<header>
<?PHP
include '../header.php';
?>
</header>
<body>
    
<img src="<?PHP echo $card['imageUrl'];?>" alt="<?PHP echo $card['name'];?>" style="float:left;margin-right:15px;">
<h1> <?PHP echo $card['name'];?> </h1>
<br/>
<p> <?PHP echo $card['text'];?> </p>
<br/><br/><br/><br/>

<form action=""> 
  <button onclick="addtodeck('<?PHP echo $cardIdNum;?>')">
    add to deck
  </button>
</form>
<br>
<div id="wasAdded"></div>

<script>
function AddToDeck(str) {
  var xhttp;  
  if (str == "") {
    document.getElementById("wasAdded").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("wasAdded").innerHTML = "<?PHP echo $cardIdNum;?> added to deck";
    }
  };
  xhttp.open("GET", "addCardToDeck.php?id="+str, true);
  xhttp.send("<?php echo "id=".$cardIdNum;?>");
}
</script>


<?PHP
/*
echo '"' . $url . '"<br><br>';

echo $cardIdNum . "<br><br>";


echo "name = " . $card['name'] . "<br><br>";


#var_dump($card);
echo "<br><br>";
    foreach ($card as $x => $x_value) {
        foreach ($x_value as $y => $y_value) {
            foreach ($y_value as $z => $z_value) {
                echo "3Key=" . $y . ", 3Value=" . $z_value;
                echo "<br>";
            }
            echo "2Key=" . $x . ", 2Value=" . $y_value;
            echo "<br>";
        }
        echo "Key=" . $x . ", Value=" . $x_value;
        echo "<br><br>";
    }*/
    ?>

</body>
<footer>
<?PHP
include '../footer.php';
?>
</footer>
</html>