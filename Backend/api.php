
<?php
include('Token.php');
class lawyer
{ 



/**
		@url GET /:token
*/
	public function getAllInfo($token){
    if ($token == TOKEN){
		$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
		$handle = $link->prepare('select * from lawyers');
		$handle->execute();
		$result = $handle->fetchAll(PDO::FETCH_OBJ);

		if(empty($result)){
			$err = new stdClass();
			$err->error = "No lawyers found";
			return $err;
		}
		else{
			return $result;
		}
	}
     else {
		echo "Make sure your token is correct!";
	}


}



/**
		@url GET /getInfo/:lawyer_id/:token
	*/
	public function getAll($lawyer_id,$token){

	if ($token == TOKEN){
		$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
		$handle = $link->prepare('select * from lawyers WHERE id = ?');
		$handle->bindValue(1, $lawyer_id, PDO::PARAM_INT);
		$handle->execute();
		$result = $handle->fetchAll(PDO::FETCH_OBJ);
        
		if(empty($result)){
			$err = new stdClass();
			$err->error = "No lawyers found";
			return $err;
		}
		else{
			return $result;
		}

	}
	else {
		echo "Make sure your token is correct!";
	}
	} 

}

class user {

	/**
	@url GET /isExist/:email/:token
	*/

	public function checkIfEmailIsExist($email, $token){
		if ($token == TOKEN){
			$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
			$handle = $link->prepare('select * from users WHERE email = ?');
			$handle->bindValue(1, $email, PDO::PARAM_STR);
			$handle->execute();
			$result = $handle->fetchAll(PDO::FETCH_OBJ);

			if(empty($result)){
			$err = new stdClass();
			$err->Res = false;
			return $err;
		}
		else{
			$err = new stdClass();
			$err->Res = true;
			return $err;
		}

				}
		else {
			echo "Make sure your token is correct!";
		}
	}

	/**
	@url POST /signUp/:token
	*/
	
	public function registerNewUser($name, $email, $user_phone_number, $password, $token){
	if ($token == TOKEN){
		$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
			$handle = $link->prepare('select * from users WHERE email = ?');
			$handle->bindValue(1, $email, PDO::PARAM_STR);
			$handle->execute();
			$result = $handle->fetchAll(PDO::FETCH_OBJ);

			if(empty($result)){
				$err = new stdClass();
				$err->Res = "true";//مو موجود
				$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
				$handle = $link->prepare('INSERT INTO users(name, email, user_phone_number, password) VALUES (?,?,?,?)');
				$handle->bindValue(1, $name, PDO::PARAM_STR);
				$handle->bindValue(2, $email, PDO::PARAM_STR);
				$handle->bindValue(3, $user_phone_number, PDO::PARAM_STR);
				$handle->bindValue(4, $password, PDO::PARAM_STR);


				if($handle->execute()){ //ترجع معلومات صاحب الايمل اللي انضاف
					$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
					$handle = $link->prepare('select * from users WHERE email = ?');
					$handle->bindValue(1, $email, PDO::PARAM_STR);
					$handle->execute();
					$result = $handle->fetch(PDO::FETCH_OBJ);

					if(empty($result)){
					$err = new stdClass();
					$err->Res = "false";
					return $err;
				}
				else{
					$err = new stdClass();
					$err->Res = "true";
					$err->msg = "added user!!!";
					$err->id = $result->id;
					return $err;
				}
				}
				else{
					$err = new stdClass();
					$err->error = "Doesn't add user";
					return $err;
				}

			}
			else{//الايميل موجود
				$err = new stdClass();
				$err->Res = "false";
				$err->msg = "this email is exist";
				return $err;
			}

		}
		else {
			echo "Make sure your token is correct!";
		}
	}

	

	// /**
	// @url GET /logIn/:email/:token
	// */
	// public function logInToApp($email, $token){
	// 	if ($token == TOKEN){
	// 		$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
	// 		$handle = $link->prepare('select * from users WHERE email = ?');
	// 		$handle->bindValue(1, $email, PDO::PARAM_STR);
	// 		$handle->execute();
	// 		$result = $handle->fetch(PDO::FETCH_OBJ);

	// 		if(empty($result)){
	// 			$err = new stdClass();
	// 			$err->error = "Email Not found";
	// 			return $err;
	// 		}
	// 		else {
	// 		$err = new stdClass();
	// 		$err->user_id = $result->id;
	// 		$err->password = $result->password;
	// 		return $err;
	// 		}
	// 	}
	// 	else {
	// 	echo "Make sure your token is correct!";
	// }

	// }

	/**
	@url GET /logIn/:email/:token
	*/
	public function logInToApp($email, $token){
		if ($token == TOKEN){
			$link = new PDO('mysql:host=localhost;dbname=Mohami;charset=utf8','root','');
			$handle = $link->prepare('select * from users WHERE email = ?');
			$handle->bindValue(1, $email, PDO::PARAM_STR);
			$handle->execute();
			$result = $handle->fetch(PDO::FETCH_OBJ);

			if(empty($result)){
				$err = new stdClass();
				$err->error = "Email Not found";
				$err->Res = "false";
				return $err;

			}
			else{//email is found
				$err = new stdClass();
				$err->id = $result->id;
				$err->password = $result->password;
				$err->Res = "true";
				$err->msg = "user logged";
				return $err;
			}
		}
		else {
		echo "Make sure your token is correct!";
	}

	}


}

// class issue {

// 	$link = new PDO('mysql:host=localhost;dbname=Mohami2;charset=utf8','root','');
// 			$handle = $link->prepare('select * from lawyers_replies');
// 			$handle->bindValue(1, $email, PDO::PARAM_STR);
// 			$handle->execute();
// 			$result = $handle->fetchAll(PDO::FETCH_OBJ);

// }
//getLawyersByType, chekEmail, add issuse
require_once 'restler.php';

$r = new Restler(); 
$r->setSupportedFormats('JsonFormat'); 
$r->addAPIClass('lawyer'); 
$r->addAPIClass('user');
$r->addAPIClass('issue'); 
$r->handle(); 

?>
