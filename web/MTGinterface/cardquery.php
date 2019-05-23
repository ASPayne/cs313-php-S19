<?PHP
$id = "";
$url = "";
function find($id)
{
    $resourceName = "cards";

    $GLOBALS['url'] = sprintf("%s/%s/%s", "https://api.magicthegathering.io/v1", $resourceName, $id);
    $response = fetch($GLOBALS['url']);

    return $response;
}

function fetch($loc)
{
    $response = json_decode(file_get_contents($loc), true);

    return $response;
}

if (isset($_GET["id"])) {
    $cardIdNum = $_GET["id"];
    $card = find($cardIdNum);
}
else{
    $cardIdNum = 386616;
    $card = find(386616);
}
?>