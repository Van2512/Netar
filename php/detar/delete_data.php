<?php
include_once("dbconection.php"); // Sử dụng include_once để tránh tái khai báo

$con = dbconection();

if(isset($_POST["uid"]))
{
    $uid=$_POST["uid"];
}
else return;

$query = "DELETE FROM `product` WHERE uid = '$uid'";
$exe = mysqli_query($con, $query);
$arr = [];
if ($exe){
    $arr["success"]="true";
}
else{
    $arr["success"]="false";
}
print(json_encode($arr));
?>
