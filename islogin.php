 <?php
@session_start();
if ( $_SESSION["username"] == "") {
    print("You are not logged into the application. Please <a href='./index.php'>login</a>.");
    exit();
}
?>