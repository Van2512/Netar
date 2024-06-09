<?php
include("dbconection.php");
$con = dbconection();

// Check if the required 'uid' is provided
if (!isset($_POST["uid"])) {
    echo json_encode(["success" => "false", "message" => "uid is required"]);
    return;
}

$uid = $_POST["uid"];
$fields = [];

// Check which fields are set and add them to the $fields array
if (isset($_POST["uname"])) {
    $uname = $_POST["uname"];
    $fields[] = "`uname`='$uname'";
}

if (isset($_POST["uprice"])) {
    $uprice = $_POST["uprice"];
    $fields[] = "`uprice`='$uprice'";
}

if (isset($_POST["uquantity"])) {
    $uquantity = $_POST["uquantity"];
    $fields[] = "`uquantity`='$uquantity'";
}

if (isset($_POST["data"]) && isset($_POST["name"])) {
    $data = $_POST["data"];
    $name = $_POST["name"];
    $path = "upload/$name";
    $fields[] = "`image`='$path'";
    // Save the image file
    file_put_contents($path, base64_decode($data));
}

// If no fields are provided, return an error
if (empty($fields)) {
    echo json_encode(["success" => "false", "message" => "No fields to update"]);
    return;
}

// Build the query dynamically based on the provided fields
$query = "UPDATE `product` SET " . implode(", ", $fields) . " WHERE `uid`='$uid'";

$arr = [];
$exe = mysqli_query($con, $query);
if ($exe) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
    $arr["error"] = mysqli_error($con); // Optional: Add error message for debugging
}
print(json_encode($arr));
?>
