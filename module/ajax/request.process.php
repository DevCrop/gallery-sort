<?php
include_once "../../inc/lib/base.class.php";

$name               = $_POST['name'];
$birth              = $_POST['birth'];
$gender             = $_POST['gender'];
$sup                = $_POST['sup'];
$tel                = $_POST['tel'];
$address            = $_POST['address'];
$address_detail     = $_POST['address_detail'];
$contents           = $_POST['contents'];
$r_captcha         = $_POST['r_captcha'];

session_start();

if ($_SESSION['captcha_secure'] != $r_captcha) {
    echo json_encode([
        "result" => "fail",
        "msg" => "보안코드가 일치하지 않습니다. 정확히 입력해주세요"
    ]);
    exit;
}

try {
    // Obtain the PDO instance
    $db = DB::getInstance();

    // Prepare the SQL query
    $query = "INSERT INTO nb_request (
                sitekey,
				 name,
                birth,
                gender,
                sup,
                tel,
                address,
                address_detail,
                contents,
                regdate
              ) VALUES (
                '$NO_SITE_UNIQUE_KEY',
				 :name,
                :birth,
                :gender,
                :sup,
                :tel,
                :address,
                :address_detail,
                :contents,
                NOW()
              )";

    // Prepare the statement
    $stmt = $db->prepare($query);

    // Bind parameters
    $stmt->bindParam(':name', $name);
	    $stmt->bindParam(':birth', $birth);
    $stmt->bindParam(':gender', $gender);
    $stmt->bindParam(':sup', $sup);
    $stmt->bindParam(':tel', $tel);
    $stmt->bindParam(':address', $address);
    $stmt->bindParam(':address_detail', $address_detail);
    $stmt->bindParam(':contents', $contents);

    // Execute the statement
    $result = $stmt->execute();

    if ($result) {
        echo json_encode([
            'result' => 'success',
            'msg' => '정상적으로 등록 되었습니다. 담당자가 확인하는대로 연락드리겠습니다.'
        ]);
    } else {
        echo json_encode([
            'result' => 'fail',
            'msg' => '처리중 문제가 발생하였습니다. 관리자에게 문의해주세요 [CODE001]',
        ]);
    }
} catch (PDOException $e) {
    echo json_encode([
        'result' => 'fail',
        'msg' => '처리중 문제가 발생하였습니다. 관리자에게 문의해주세요 [CODE002]',
        'error' => $e->getMessage()
    ]);
}
?>
