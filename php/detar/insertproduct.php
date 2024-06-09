<?php
include("dbconection.php");
$con=dbconection();

if(isset($_POST["uname"]))
{
    $uname= $_POST["uname"];
}
else return;
if(isset($_POST["uprice"]))
{
    $uprice= $_POST["uprice"];
}
else return;
if(isset($_POST["uquantity"]))
{
    $uquantity= $_POST["uquantity"];
}
else return;
if(isset($_POST["data"]))
{
    $data= $_POST["data"];
}
else return;
if(isset($_POST["name"]))
{
    $name= $_POST["name"];
}
else return;

$path="upload/$name";

$query="INSERT INTO `product`(`uname`, `uprice`, `uquantity`, `image`) VALUES ('$uname','$uprice','$uquantity','$path')";
file_put_contents($path,base64_decode($data));
$arr=[];
$exe=mysqli_query($con,$query);
if($exe){
    $arr["success"]="true";
}else{
    $arr["success"]="false";
}
print(json_encode($arr));
?>
