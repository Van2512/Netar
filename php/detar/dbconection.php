<?php
function dbconection(){
    $con=mysqli_connect("localhost","root","","detar");
    return $con;
}
?>
