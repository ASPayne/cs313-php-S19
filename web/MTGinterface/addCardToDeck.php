<?PHP
include 'databaseconnect';
include 'cardquery.php';

$query = 'INSERT INTO CardStorage(multiverseid, CardName, CardTypes) VALUES ("'. $card['multiverseid'] .'", "' . $card['name'] . '", "' . $card['types'] . '")';

$db->query($query);

?>
