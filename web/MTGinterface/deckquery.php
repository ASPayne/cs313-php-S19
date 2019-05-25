<?php
include 'databaseconnect.php';

#$sql = "SELECT customerid, companyname, contactname, address, city, postalcode, country
#FROM customers WHERE customerid = ?";

$sql = "SELECT d.num_owned, cs.cardname, cs.manacost 
from CardStorage cs join deck d 
on cs.id = d.card_num 
where d.deck_owner = " . $_GET['user'];

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $_GET['user']);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($num_owned, $cname, $manacost);
$stmt->fetch();
$stmt->close();

echo "<table>";
echo "<tr>";
echo "<th>NumberInDeck</th>";
echo "<td>" . $num_owned . "</td>";
echo "<th>CardName</th>";
echo "<td>" . $cname . "</td>";
echo "<th>Cost</th>";
echo "<td>" . $manacost . "</td>";
echo "</tr>";
echo "</table>";
?> 