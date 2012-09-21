 <?php
@session_start();
if ( $_SESSION["admin_name"] == "") {
    print("You are not logged into the application. Please <a href='./login.php'>Admin login</a>.");
    exit();
}
?>