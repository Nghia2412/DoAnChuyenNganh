<?php 
if(!isset($_SESSION))
{
    session_start();               
}

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

$action =isset($_GET['action'])?$_GET['action']:'index';
$sanpham = new sanphammodel();
$hd = new hoadonmodel();
$kh= new dangnhapmodel();
$cthd = new chitiethoadonmodel();

if ($action=='index')
{
    $data =$sanpham->all();
    include './views/dianhac/event.php';
}


if($action=='cart')
{
	$data=$sanpham->sptrongcart();
	include 'views/giohang/cart.php';
}



if(!isset($_SESSION["cart"]))
	{
		$_SESSION["cart"] =array();           
	}
	if(isset($_GET['action']))
	{
		function update_cart($add = false)
		{
			foreach ($_POST['quantity'] as $id => $quantity){
				if($quantity == 0){
					unset($_SESSION['cart'][$id]);
				}else{
				if($add) {
					$_SESSION['cart'][$id] += $quantity;
				}else{
					$_SESSION['cart'][$id] = $quantity;
				}
			}
		}
        }
        switch($_GET['action']){
			case "add":
				$tongtien = 0;
				update_cart(true);
				header('location: index.php?controller=cart&action=cart');

				break;

			case "delete":
				if(isset($_GET['id']))
				{
					unset($_SESSION['cart'][$_GET['id']]);
				}
				header('location: index.php?controller=cart&action=cart');
				break;
			case "submit":
				
				if(isset($_SESSION["email"]))
	{
						$tongtien = 0;
						$data=$sanpham->sptrongcart();
						
						
						foreach($data as $value)
						{
							$tongtien += $value['gia']*$_SESSION['cart'][$value['id_dianhac']]; 
						}
						
						
						$khachhang = $kh->khachhangcoemail($_SESSION["email"]);	
						$email = $_SESSION["email"];			
						$id_hd = "hd".rand(10,999);						
						$tennguoinhan = $khachhang[0]['tenkh'];
						$sodienthoainguoinhan = $khachhang[0]['sodienthoai'];			
						$diachi = $khachhang[0]['diachi'];
							
						$hdkh =$hd->insert($id_hd, $email, $tennguoinhan, $diachi, $sodienthoainguoinhan, $tongtien);
						
						foreach($data as $value)
						{
							$ctdhkh = $cthd->insert($id_hd, $value['id_dianhac'],$_SESSION['cart'][$value['id_dianhac']], $value['gia']);
							
						}
						unset($_SESSION['cart']);
						$message = "?????t h??ng th??nh c??ng.";
						echo "<script type='text/javascript'>alert('$message');</script> Nh???n v??o ????y ????? <a href='index.php?controller=sanpham'>Ti???p t???c mua h??ng</a>";
	require('mail/PHPMailer/Exception.php');
	require('mail/PHPMailer/SMTP.php');
	require('mail/PHPMailer/PHPMailer.php');

	$mail = new PHPMailer(true);

try {
    $mail->CharSet = "UTF-8";
    //Server settings
    //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
    $mail->isSMTP();                                            //Send using SMTP
    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
    $mail->Username   = 'dangkhoalop9a6@gmail.com';                     //SMTP username
    $mail->Password   = 'nbcbyqxeroirkkwl';                                //SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('dangkhoalop9a6@gmail.com', 'Nhacknight');
    $mail->addAddress($email, $tennguoinhan);     //Add a recipient
    

    

    //Content
    $mail->isHTML(true);                                  //Set email format to HTML
    $mail->Subject = '?????t h??ng th??nh c??ng';
    $mail->Body    = '<b>C??m ??n kh??ch h??ng ???? mua s???n ph???m ??? c???a ch??ng tui</b><br><b>Email: </b>'.$email.'<br><b>M?? h??a ????n:</b>'."hd".rand(10,999).'<br><b>T??n ng?????i nh???n:</b>'.$khachhang[0]['tenkh'].'<br><b>S??? ??i???n tho???i:</b>'.$khachhang[0]['sodienthoai'].'<br><b>?????a ch???:</b>'.$khachhang[0]['diachi'].'<br><b>Ti???n:</b>'.$tongtien;
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
    
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";

	break;

			}
	}else{
		$message = "B???n ch??a ????ng nh???p. Vui l??ng ????ng nh???p ????? ?????t h??ng!";
		echo "<script type='text/javascript'>alert('$message');</script> Nh???n v??o ????y ????? <a href='index.php?controller=dangnhap'>????ng nh???p</a><br>Ch??a c?? t??i kho???n Nh???n v??o ????y ????? <a href='index.php?controller=dangky'>????ng k??</br>";
		exit;
	}
    
	}
}
?>
