<style>
.hdcol1 {
	float: left;
	width: 50%;
}
.hdcol2 {
	float: left;
	width: 50%;
	text-align: right;
}
.hdrow:after {
	content: "";
	display: table;
	clear: both;
}

.cartstyle
{
	color: white;
	font-family: Arial, Sans-serif;
	font-weight:  bold;
	font-size: 14px;
	text-decoration: none;
	padding: 8px;
	background-color: red;
	border-radius: 2px;
}
.cartstyle:hover
{
	color: black;
	background-color: white;
}

.cartbdr
{
	border: solid 1px #ff8b36;
	padding: 4px;
	display: inline-block;
	border-radius: 4px;
}
.cartbdr:hover
{
	border: solid 1px white;
}

</style>
<?php
$cartcnt=0;
if(isset($_SESSION['my_cart']))
{
	$cartcnt=count($_SESSION['my_cart']);
}
?>
<div style="padding: 5px; background-color: #ff8b36; border-radius: 5px;">
<div class="hdrow">
	<div class="hdcol1">
		<img src="images/site_logo.png" style="width: 160px; height: 60px;">	
	</div>
	<div class="hdcol2">
	<?php
		// $cartcount = mysqli_query($conn, "SELECT COUNT(*) FROM gdoorcartlist");
		// $new2 = mysqli_fetch_array($cartcount);
		?>
		<div class="cartbdr">
		<div style="width: 45px; height: 40px; background-image: url('images/cart48.png');
		background-repeat: no-repeat; color: white; font-size: 19px; font-family: Arial,Sans-serif; text-align: center;"><?php echo $cartcnt;?></div>
	</div>
	</div>
</div>
<?php
if(isset($_GET['garage_id']))
{
	?>
	<a href="cart.php?garage_id=<?php if(isset($_GET['garage_id'])){ echo $_GET['garage_id'];}?>" class="cartstyle">Go to Cart</a>
	<?php
}
if(isset($_GET['solodr_id']))
{
	?>
	<a href="cart.php?odr_id=<?php if(isset($_GET['solodr_id'])){ echo $_GET['solodr_id'];}?>" class="cartstyle">Go to Cart</a>
	<?php
}
?>
</div>