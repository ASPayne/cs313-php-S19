<?PHP
function find($id)
{
    $resourceName = "cards";

    $url      = sprintf("%s/%s/%s", "https://api.magicthegathering.io/v1", $resourceName, $id);
    $response = fetch($url);

    return $response;
}

function fetch($url)
{
    $response = json_decode(file_get_contents($url), true);

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