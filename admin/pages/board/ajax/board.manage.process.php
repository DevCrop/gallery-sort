<?php
include_once "../../../../inc/lib/base.class.php";
include_once "../../../lib/admin.check.ajax.php";

$connect = DB::getInstance(); // Initialize PDO instance
$mode = $_POST['mode'];

if ($mode === "save") {
    try {
        $pdo = DB::getInstance();

        // 필드 수집
        $title = $_POST['title'];
        $skin = $_POST['skin'];
        $view_yn = $_POST['view_yn'];
        $secret_yn = $_POST['secret_yn'];
        $comment_yn = $_POST['comment_yn'];
        $category_yn = $_POST['category_yn'];
        $fileattach_yn = $_POST['fileattach_yn'];
        $fileattach_cnt = $_POST['fileattach_cnt'] ?? 0;
        $list_size = isset($_POST['list_size']) && $_POST['list_size'] !== '' ? (int)$_POST['list_size'] : $BOARD_DEFAULT_LIST_SIZE;

        // SQL 준비
        $query = "
            INSERT INTO nb_board_manage (
                sitekey, title, skin, regdate, view_yn, secret_yn,
                comment_yn, category_yn,
                fileattach_yn, fileattach_cnt, list_size
            ) VALUES (
                :sitekey, :title, :skin, NOW(), :view_yn, :secret_yn,
                :comment_yn, :category_yn,
                :fileattach_yn, :fileattach_cnt, :list_size
            )
        ";

        $stmt = $pdo->prepare($query);
        $result = $stmt->execute([
            ':sitekey' => $NO_SITE_UNIQUE_KEY,
            ':title' => $title,
            ':skin' => $skin,
            ':view_yn' => $view_yn,
            ':secret_yn' => $secret_yn,
            ':comment_yn' => $comment_yn,
            ':category_yn' => $category_yn,
            ':fileattach_yn' => $fileattach_yn,
            ':fileattach_cnt' => $fileattach_cnt,
            ':list_size' => $list_size
        ]);

        if ($result) {
            echo json_encode(["result" => "success", "msg" => "정상적으로 등록되었습니다."]);
        } else {
            echo json_encode(["result" => "fail", "msg" => "DB 처리에 실패했습니다."]);
        }

    } catch (Exception $e) {
        echo json_encode(["result" => "fail", "msg" => "에러 발생: " . $e->getMessage()]);
    }
}
elseif ($mode === "edit") {
    try {
        $no = $_POST['no'];
        $title = $_POST['title'];
        $skin = $_POST['skin'];
        $view_yn = $_POST['view_yn'];
        $secret_yn = $_POST['secret_yn'];
        $comment_yn = $_POST['comment_yn'];
        $category_yn = $_POST['category_yn'];
        $fileattach_yn = $_POST['fileattach_yn'];
        $fileattach_cnt = $_POST['fileattach_cnt'] ?? 0;
        $list_size = isset($_POST['list_size']) && $_POST['list_size'] !== '' ? (int)$_POST['list_size'] : $BOARD_DEFAULT_LIST_SIZE;

        // 파일 업로드
        $uploads_dir = $UPLOAD_DIR_BOARD;
        $origin_file = '';
        $uploadResult = imageUpload($uploads_dir, $_FILES['top_banner_image'] ?? null, $origin_file, false);
        $savedFile = $uploadResult['saved'] ?? '';

        // 쿼리 구성
        $query = "
            UPDATE nb_board_manage SET 
                title = :title,
                skin = :skin,
                view_yn = :view_yn,
                secret_yn = :secret_yn,
                comment_yn = :comment_yn,
                category_yn = :category_yn,
                fileattach_yn = :fileattach_yn,
                fileattach_cnt = :fileattach_cnt,
                list_size = :list_size";

        if ($savedFile) {
            $query .= ", top_banner_image = :top_banner_image";
        }

        $query .= " WHERE no = :no";

        $stmt = $connect->prepare($query);

        $params = [
            ':title' => $title,
            ':skin' => $skin,
            ':view_yn' => $view_yn,
            ':secret_yn' => $secret_yn,
            ':comment_yn' => $comment_yn,
            ':category_yn' => $category_yn,
            ':fileattach_yn' => $fileattach_yn,
            ':fileattach_cnt' => $fileattach_cnt,
            ':list_size' => $list_size,
            ':no' => $no
        ];

        if ($savedFile) {
            $params[':top_banner_image'] = $savedFile;
        }

        $result = $stmt->execute($params);

        echo json_encode([
            "result" => $result ? "success" : "fail",
            "msg" => $result ? "정상적으로 수정되었습니다." : "처리 중 문제가 발생하였습니다.[Error-DB]"
        ]);

    } catch (PDOException $e) {
        echo json_encode([
            "result" => "fail",
            "msg" => "DB 오류: " . $e->getMessage()
        ]);
    } catch (Exception $e) {
        echo json_encode([
            "result" => "fail",
            "msg" => "처리 중 문제가 발생하였습니다: " . $e->getMessage()
        ]);
    }
}
elseif ($mode == "delete") {

	$no = $_POST['no'];

	try {
		// 데이터베이스 연결
		$connect = DB::getInstance();
		
		// 삭제할 파일명을 가져오는 쿼리
		$query = "SELECT top_banner_image FROM nb_board_manage WHERE no = :no";
		$stmt = $connect->prepare($query);
		$stmt->execute([':no' => $no]);
		$data = $stmt->fetch(PDO::FETCH_ASSOC);

		// 파일 정보가 없을 경우 에러 메시지 반환
		if (!$data) {
			echo json_encode(["result" => "fail", "msg" => "정보를 찾을 수 없습니다"]);
			exit;
		}

		// 이미지 파일 삭제
		$filename = $data['top_banner_image'];
		if ($filename) {
			$filePath = $UPLOAD_DIR_BOARD . "/" . $filename;
			
			if (file_exists($filePath) && !unlink($filePath)) {
				echo json_encode(["result" => "fail", "msg" => "이미지 파일 삭제에 실패했습니다."]);
				exit;
			}
		}

		// 데이터베이스에서 해당 레코드 삭제
		$query = "DELETE FROM nb_board_manage WHERE no = :no";
		$stmt = $connect->prepare($query);
		$result = $stmt->execute([':no' => $no]);

		echo json_encode([
			"result" => $result ? "success" : "fail",
			"msg" => $result ? "정상적으로 삭제되었습니다." : "데이터 삭제에 실패했습니다."
		]);
	} catch (PDOException $e) {
		// PDO 예외 처리
		echo json_encode(["result" => "fail", "msg" => "데이터베이스 오류: " . $e->getMessage()]);
	} catch (Exception $e) {
		// 기타 예외 처리
		echo json_encode(["result" => "fail", "msg" => "오류가 발생했습니다: " . $e->getMessage()]);
	}


} elseif ($mode == "category.add") {
    $board_no = $_POST['board_no'];
	$name = $_POST['name'];

	try {
		// 데이터베이스 연결
		$connect = DB::getInstance();

		// `sort_no`를 가져오는 쿼리 실행
		$query = "SELECT IFNULL(MAX(sort_no), 0) + 1 AS sort_no FROM nb_board_category WHERE sitekey = :sitekey AND board_no = :board_no";
		$stmt = $connect->prepare($query);
		$stmt->execute([':sitekey' => $NO_SITE_UNIQUE_KEY, ':board_no' => $board_no]);
		$data = $stmt->fetch(PDO::FETCH_ASSOC);

		// 데이터가 없을 경우 에러 메시지 반환
		if (!$data) {
			echo json_encode(["result" => "fail", "msg" => "정보를 찾을 수 없습니다"]);
			exit;
		}

		// `sort_no` 가져오기
		$sort_no = $data['sort_no'];

		// `nb_board_category` 테이블에 데이터 삽입
		$query = "INSERT INTO nb_board_category (sitekey, board_no, name, sort_no) VALUES (:sitekey, :board_no, :name, :sort_no)";
		$stmt = $connect->prepare($query);
		$result = $stmt->execute([
			':sitekey' => $NO_SITE_UNIQUE_KEY,
			':board_no' => $board_no,
			':name' => $name,
			':sort_no' => $sort_no
		]);

		// 결과 반환
		echo json_encode([
			"result" => $result ? "success" : "fail",
			"msg" => $result ? "정상적으로 등록되었습니다." : "처리 중 문제가 발생하였습니다. [Error-DB]"
		]);

	} catch (PDOException $e) {
		// PDO 예외 처리
		echo json_encode(["result" => "fail", "msg" => "데이터베이스 오류: " . $e->getMessage()]);
	} catch (Exception $e) {
		// 일반 예외 처리
		echo json_encode(["result" => "fail", "msg" => "오류가 발생했습니다: " . $e->getMessage()]);
	}

} elseif ($mode == "category.save") {
    $no = $_POST['no'];
    $name = urldecode($_POST['name']);
    $sort_no = $_POST['sort_no'];

    try {
        $query = "UPDATE nb_board_category SET name = :name, sort_no = :sort_no WHERE no = :no";
        $stmt = $connect->prepare($query);
        $result = $stmt->execute([':name' => $name, ':sort_no' => $sort_no, ':no' => $no]);

        echo json_encode([
            "result" => $result ? "success" : "fail",
            "msg" => $result ? "정상적으로 수정 되었습니다." : "처리 중 문제가 발생하였습니다.[Error-DB]"
        ]);
    } catch (PDOException $e) {
        echo json_encode(["result" => "fail", "msg" => "데이터베이스 오류: " . $e->getMessage()]);
    } catch (Exception $e) {
        echo json_encode(["result" => "fail", "msg" => "오류가 발생했습니다: " . $e->getMessage()]);
    }

} elseif ($mode == "category.delete") {
    $no = $_POST['no'];

    try {
        $query = "DELETE FROM nb_board_category WHERE no = :no";
        $stmt = $connect->prepare($query);
        $result = $stmt->execute([':no' => $no]);

        echo json_encode([
            "result" => $result ? "success" : "fail",
            "msg" => $result ? "정상적으로 삭제되었습니다." : "파일 삭제에 실패했습니다."
        ]);
    } catch (PDOException $e) {
        echo json_encode(["result" => "fail", "msg" => "데이터베이스 오류: " . $e->getMessage()]);
    } catch (Exception $e) {
        echo json_encode(["result" => "fail", "msg" => "오류가 발생했습니다: " . $e->getMessage()]);
    }
}
?>