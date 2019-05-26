<?php
include 'databaseconnect.php';

#$sql = "SELECT customerid, companyname, contactname, address, city, postalcode, country
#FROM customers WHERE customerid = ?";


 # $data = trim($data);
 # $data = stripslashes($data);
 # $data = htmlspecialchars($data);
 # return $data;
#}


$sql = "SELECT d.num_owned, cs.cardname, cs.manacost 
from CardStorage cs join deck d 
on cs.id = d.card_num 
where d.deck_owner = " . $_GET['user'];

$stmt = $db->query($sql);
foreach ($stmt
 as $row) {
echo "<table>";
echo "<tr>";
echo "<th>NumberInDeck</th>";
echo "<td>" . $row['num_owned'] . "</td>";
echo "<th>CardName</th>";
echo "<td>" . $row['cardname'] . "</td>";
echo "<th>Cost</th>";
echo "<td>" . $row['manacost'] . "</td>";
echo "</tr>";
echo "</table>";
 }


?> 