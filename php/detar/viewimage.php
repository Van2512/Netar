<?php
include_once("dbconection.php"); // Sử dụng include_once để tránh tái khai báo

$con = dbconection();

$query = "SELECT `uid`, `uname`, `uprice`, `uquantity`, `image` FROM `product`";
$exe = mysqli_query($con, $query);
$arr = [];
while ($row = mysqli_fetch_assoc($exe)) {
    $arr[] = $row;
}
print(json_encode($arr));
?>
