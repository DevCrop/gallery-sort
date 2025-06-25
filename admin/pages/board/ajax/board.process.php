<?php

include_once "../../../../inc/lib/base.class.php";
include_once "../../../lib/admin.check.ajax.php";

$mode = $_POST['mode'] ?? '';

if ($mode == "save") {
    $board_no    = $_POST['board_no'];
    $title       = htmlspecialchars($_POST['title'],       ENT_QUOTES, 'UTF-8');
    $direct_url  = htmlspecialchars($_POST['direct_url'],  ENT_QUOTES, 'UTF-8');
    $write_name  = htmlspecialchars($_POST['write_name'],  ENT_QUOTES, 'UTF-8');
    $contents    = htmlspecialchars($_POST['contents'],    ENT_QUOTES, 'UTF-8');
    $category_no = $_POST['category_no'] ?? 0;
    $is_notice   = $_POST['is_notice']   ?? "N";
    $regdate     = $_POST['regdate']     ?? null;

    // extra1 ~ extra21
    $extras = [];
    for ($i = 1; $i <= 21; $i++) {
        $extras["extra$i"] = $_POST["extra$i"] ?? '';
    }

    $depths = [
        'depth1' => $_POST['depth1'] ?? -1,
        'depth2' => $_POST['depth2'] ?? -1,
        'depth3' => $_POST['depth3'] ?? -1,
        'depth4' => $_POST['depth4'] ?? -1,
    ];

    $user_no     = -1;
    $allow       = $board_file_allow;
    $uploads_dir = $UPLOAD_DIR_BOARD;
    $origin_file = '';

    // thumbnail upload
    $uploadResult        = imageUpload($uploads_dir, $_FILES['thumb_image'],   $origin_file, false, $allow);
    $thumb_image_saved   = $uploadResult['saved'];

    // file_attach_1 ~ file_attach_11
    $file_attachments = [];
    for ($i = 1; $i <= 11; $i++) {
        $uploadResult = imageUpload($uploads_dir, $_FILES["addFile$i"], $origin_file, true, $allow);
        $file_attachments[$i] = [
            'saved'  => $uploadResult['saved'],
            'origin' => $uploadResult['origin'],
        ];
    }

    try {
        $query = "INSERT INTO nb_board (
                    sitekey, board_no, user_no, category_no, title, contents, regdate, is_notice,
                    write_name, direct_url, thumb_image,
                    file_attach_1,  file_attach_2,  file_attach_3,  file_attach_4,  file_attach_5,
                    file_attach_6,  file_attach_7,  file_attach_8,  file_attach_9,  file_attach_10, file_attach_11,
                    file_attach_origin_1,  file_attach_origin_2,  file_attach_origin_3,  file_attach_origin_4,  file_attach_origin_5,
                    file_attach_origin_6,  file_attach_origin_7,  file_attach_origin_8,  file_attach_origin_9,  file_attach_origin_10, file_attach_origin_11,
                    extra1, extra2, extra3, extra4, extra5, extra6, extra7, extra8, extra9, extra10,
                    extra11, extra12, extra13, extra14, extra15, extra16, extra17, extra18, extra19, extra20, extra21
                  ) VALUES (
                    :sitekey, :board_no, :user_no, :category_no, :title, :contents, NOW(), :is_notice,
                    :write_name, :direct_url, :thumb_image,
                    :file_attach_1,  :file_attach_2,  :file_attach_3,  :file_attach_4,  :file_attach_5,
                    :file_attach_6,  :file_attach_7,  :file_attach_8,  :file_attach_9,  :file_attach_10, :file_attach_11,
                    :file_attach_origin_1,  :file_attach_origin_2,  :file_attach_origin_3,  :file_attach_origin_4,  :file_attach_origin_5,
                    :file_attach_origin_6,  :file_attach_origin_7,  :file_attach_origin_8,  :file_attach_origin_9,  :file_attach_origin_10, :file_attach_origin_11,
                    :extra1, :extra2, :extra3, :extra4, :extra5, :extra6, :extra7, :extra8, :extra9, :extra10,
                    :extra11, :extra12, :extra13, :extra14, :extra15, :extra16, :extra17, :extra18, :extra19, :extra20, :extra21
                  )";

        $stmt = DB::getInstance()->prepare($query);
        $stmt->execute([
            ':sitekey'            => $NO_SITE_UNIQUE_KEY,
            ':board_no'           => $board_no,
            ':user_no'            => $user_no,
            ':category_no'        => $category_no,
            ':title'              => $title,
            ':contents'           => $contents,
            ':is_notice'          => $is_notice,
            ':write_name'         => $write_name,
            ':direct_url'         => $direct_url,
            ':thumb_image'        => $thumb_image_saved,
            // saved files
            ':file_attach_1'      => $file_attachments[1]['saved'],
            ':file_attach_2'      => $file_attachments[2]['saved'],
            ':file_attach_3'      => $file_attachments[3]['saved'],
            ':file_attach_4'      => $file_attachments[4]['saved'],
            ':file_attach_5'      => $file_attachments[5]['saved'],
            ':file_attach_6'      => $file_attachments[6]['saved'],
            ':file_attach_7'      => $file_attachments[7]['saved'],
            ':file_attach_8'      => $file_attachments[8]['saved'],
            ':file_attach_9'      => $file_attachments[9]['saved'],
            ':file_attach_10'     => $file_attachments[10]['saved'],
            ':file_attach_11'     => $file_attachments[11]['saved'],
            // origin files
            ':file_attach_origin_1'  => $file_attachments[1]['origin'],
            ':file_attach_origin_2'  => $file_attachments[2]['origin'],
            ':file_attach_origin_3'  => $file_attachments[3]['origin'],
            ':file_attach_origin_4'  => $file_attachments[4]['origin'],
            ':file_attach_origin_5'  => $file_attachments[5]['origin'],
            ':file_attach_origin_6'  => $file_attachments[6]['origin'],
            ':file_attach_origin_7'  => $file_attachments[7]['origin'],
            ':file_attach_origin_8'  => $file_attachments[8]['origin'],
            ':file_attach_origin_9'  => $file_attachments[9]['origin'],
            ':file_attach_origin_10' => $file_attachments[10]['origin'],
            ':file_attach_origin_11' => $file_attachments[11]['origin'],
            // extras
            ':extra1'  => $extras['extra1'],
            ':extra2'  => $extras['extra2'],
            ':extra3'  => $extras['extra3'],
            ':extra4'  => $extras['extra4'],
            ':extra5'  => $extras['extra5'],
            ':extra6'  => $extras['extra6'],
            ':extra7'  => $extras['extra7'],
            ':extra8'  => $extras['extra8'],
            ':extra9'  => $extras['extra9'],
            ':extra10' => $extras['extra10'],
            ':extra11' => $extras['extra11'],
            ':extra12' => $extras['extra12'],
            ':extra13' => $extras['extra13'],
            ':extra14' => $extras['extra14'],
            ':extra15' => $extras['extra15'],
            ':extra16' => $extras['extra16'],
            ':extra17' => $extras['extra17'],
            ':extra18' => $extras['extra18'],
            ':extra19' => $extras['extra19'],
            ':extra20' => $extras['extra20'],
            ':extra21' => $extras['extra21'],
        ]);

        echo json_encode(["result" => "success", "msg" => "정상적으로 등록되었습니다."]);
    } catch (PDOException $e) {
        echo json_encode(["result" => "fail", "msg" => "처리중 문제가 발생하였습니다.[Error-DB: " . $e->getMessage() . "]"]);
    }
}



if ($mode == "edit") {
    try {
        $no = $_POST['no'];
        $board_no = $_POST['board_no'];
        $title = $_POST['title'];
        $write_name = $_POST['write_name'];
        $contents = htmlspecialchars($_POST['contents'], ENT_QUOTES, 'UTF-8');
        $category_no = $_POST['category_no'] ?? 0;
        $is_notice = isset($_POST['is_notice']) && $_POST['is_notice'] === 'Y' ? 'Y' : 'N';
        $regdate = $_POST['regdate'] ?? null;
        $direct_url = $_POST['direct_url'];

        // extra1 ~ extra21
        $extraFields = [];
        for ($i = 1; $i <= 21; $i++) {
            $extraFields["extra{$i}"] = $_POST["extra{$i}"] ?? '';
        }

        $uploads_dir = $UPLOAD_DIR_BOARD;
        $allow = $board_file_allow;
        $origin_file = '';

        $db = DB::getInstance();

        // 1️⃣ 기존 파일 정보 조회 (file_attach_1 ~ file_attach_11)
        $stmt = $db->prepare("
            SELECT thumb_image,
                   file_attach_1,  file_attach_2,  file_attach_3,  file_attach_4,  file_attach_5,
                   file_attach_6,  file_attach_7,  file_attach_8,  file_attach_9,  file_attach_10, file_attach_11
            FROM nb_board
            WHERE no = :no
        ");
        $stmt->execute(['no' => $no]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$data) {
            echo json_encode(["result" => "fail", "msg" => "정보를 찾을 수 없습니다"]);
            exit;
        }

        // 2️⃣ 삭제 요청된 파일 처리 (0=thumb, 1~11=file_attach_i)
        $deleteFiles = $_POST['attach_file_del'] ?? [];
        foreach ($deleteFiles as $index) {
            if ($index == 0) {
                // 썸네일 삭제
                $filePath = "$uploads_dir/{$data['thumb_image']}";
                if ($data['thumb_image'] && file_exists($filePath)) {
                    unlink($filePath);
                }
                $data['thumb_image'] = '';
            } elseif ($index >= 1 && $index <= 11) {
                // 첨부파일 삭제
                $field = "file_attach_$index";
                $filePath = "$uploads_dir/{$data[$field]}";
                if ($data[$field] && file_exists($filePath)) {
                    unlink($filePath);
                }
                $data[$field] = '';
                $data["file_attach_origin_$index"] = '';
            }
        }

        // 3️⃣ 썸네일 업로드
        $thumb_image_saved = '';
        if (isset($_FILES['thumb_image'])) {
            $origin_file = $data['thumb_image'] ?? '';
            $uploadResult = imageUpload($uploads_dir, $_FILES['thumb_image'], $origin_file, false, $allow);
            $thumb_image_saved = $uploadResult['saved'];
        }

        // 4️⃣ 첨부파일 업로드 (1~11)
        $fileAttachments = [];
        for ($i = 1; $i <= 11; $i++) {
            if (isset($_FILES["addFile$i"])) {
                $origin_file = $data["file_attach_$i"] ?? '';
                $uploadResult = imageUpload($uploads_dir, $_FILES["addFile$i"], $origin_file, true, $allow);
                $fileAttachments[$i] = [
                    'saved'  => $uploadResult['saved'],
                    'origin' => $uploadResult['origin']
                ];
            }
        }

        // 5️⃣ 업데이트할 필드 정리
        $updateFields = [
            'board_no'   => $board_no,
            'title'      => $title,
            'contents'   => $contents,
            'is_notice'  => $is_notice,
            'direct_url' => $direct_url,
            'regdate'    => $regdate,
            'write_name' => $write_name
        ];

        // extra1~21
        foreach ($extraFields as $key => $value) {
            $updateFields[$key] = $value;
        }

        if ($category_no) {
            $updateFields['category_no'] = $category_no;
        }

        // 6️⃣ 썸네일 DB 반영
        if (in_array(0, $deleteFiles)) {
            $updateFields['thumb_image'] = '';
        } elseif (!empty($thumb_image_saved)) {
            $updateFields['thumb_image'] = $thumb_image_saved;
        }

        // 7️⃣ 첨부파일 DB 반영 for 1~11
        for ($i = 1; $i <= 11; $i++) {
            if (in_array($i, $deleteFiles)) {
                $updateFields["file_attach_$i"]        = '';
                $updateFields["file_attach_origin_$i"] = '';
            } elseif (!empty($fileAttachments[$i]['saved'])) {
                $updateFields["file_attach_$i"]        = $fileAttachments[$i]['saved'];
                $updateFields["file_attach_origin_$i"] = $fileAttachments[$i]['origin'];
            }
        }

        // 8️⃣ UPDATE 쿼리 실행
        $query = "UPDATE nb_board SET " .
                 implode(", ", array_map(fn($f) => "$f = :$f", array_keys($updateFields))) .
                 " WHERE no = :no";
        $updateFields['no'] = $no;

        $stmt = $db->prepare($query);
        $result = $stmt->execute($updateFields);

        echo $result
            ? json_encode(["result" => "success", "msg" => "정상적으로 수정되었습니다."])
            : json_encode(["result" => "fail",    "msg" => "처리중 문제가 발생하였습니다.[Error-DB]"]);

    } catch (Exception $e) {
        echo json_encode(["result" => "fail", "msg" => "Exception occurred: " . $e->getMessage()]);
    }
}




if ($mode == "delete") {
    $no = $_REQUEST['no'];

    try {
        $query = "SELECT thumb_image, file_attach_1, file_attach_2, file_attach_3, file_attach_4, file_attach_5
                  FROM nb_board WHERE no = :no";
        $stmt = DB::getInstance()->prepare($query);
        $stmt->execute([':no' => $no]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$data) {
            throw new Exception("정보를 찾을 수 없습니다");
        }

        // Delete files
        foreach ($data as $key => $file) {
            if ($file) {
                imageDelete($UPLOAD_DIR_BOARD . "/" . $file);
            }
        }

        // Delete board record
        $query = "DELETE FROM nb_board WHERE no = :no";
        $stmt = DB::getInstance()->prepare($query);
        $stmt->execute([':no' => $no]);

        // Delete associated comments
        $query = "DELETE FROM nb_board_comment WHERE parent_no = :parent_no";
        $stmt = DB::getInstance()->prepare($query);
        $stmt->execute([':parent_no' => $no]);

        echo json_encode(["result" => "success", "msg" => "정상적으로 삭제되었습니다."]);
    } catch (PDOException $e) {
        echo json_encode(["result" => "fail", "msg" => "DB 처리중 오류가 발생하였습니다.[Error: " . $e->getMessage() . "]"]);
    } catch (Exception $e) {
        echo json_encode(["result" => "fail", "msg" => $e->getMessage()]);
    }
} 

if ($mode == "delete.array") {
    $board_file_check_no = $_POST['board_file_check_no'];

    try {
        foreach ($board_file_check_no as $val) {
            $no = $val;

            $query = "SELECT thumb_image, file_attach_1, file_attach_2, file_attach_3, file_attach_4, file_attach_5
                      FROM nb_board WHERE no = :no";
            $stmt = DB::getInstance()->prepare($query);
            $stmt->execute([':no' => $no]);
            $data = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$data) {
                throw new Exception("정보를 찾을 수 없습니다");
            }

            // Delete files
            foreach ($data as $key => $file) {
                if ($file) {
                    imageDelete($UPLOAD_DIR_BOARD . "/" . $file);
                }
            }

            // Delete board record
            $query = "DELETE FROM nb_board WHERE no = :no";
            $stmt = DB::getInstance()->prepare($query);
            $stmt->execute([':no' => $no]);

            // Delete associated comments
            $query = "DELETE FROM nb_board_comment WHERE parent_no = :parent_no";
            $stmt = DB::getInstance()->prepare($query);
            $stmt->execute([':parent_no' => $no]);
        }

        echo json_encode(["result" => "success", "msg" => "정상적으로 삭제되었습니다."]);
    } catch (PDOException $e) {
        echo json_encode(["result" => "fail", "msg" => "DB 처리중 오류가 발생하였습니다.[Error: " . $e->getMessage() . "]"]);
    } catch (Exception $e) {
        echo json_encode(["result" => "fail", "msg" => $e->getMessage()]);
    }
} 

if ($mode == "board.category") {
    $board_no = $_REQUEST['board_no'];
    $boardManage_info = getBoardManageInfoByNo($board_no);
    $category_yn = $boardManage_info[0]['category_yn'];

    try {
        $query = "SELECT no, name FROM nb_board_category WHERE sitekey = :sitekey AND board_no = :board_no ORDER BY sort_no ASC";
        $stmt = DB::getInstance()->prepare($query);
        $stmt->execute([':sitekey' => $NO_SITE_UNIQUE_KEY, ':board_no' => $board_no]);

        $rows = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $rows[] = ["no" => $row['no'], "name" => $row['name']];
        }

        echo json_encode([
            "result" => "success",
            "category_yn" => $category_yn,
            "rows" => $rows,
            "msg" => "정상적으로 불러왔습니다."
        ]);
    } catch (PDOException $e) {
        echo json_encode(["result" => "fail", "msg" => "DB 처리중 오류가 발생하였습니다.[Error: " . $e->getMessage() . "]"]);
    }
} 

if ($mode == "category.depth") {
    $board_no = $_REQUEST['board_no'];
    $boardManage_info = getBoardManageInfoByNo($board_no);
    $depth_category_yn = $boardManage_info[0]['depth_category_yn'];

    echo json_encode([
        "result" => "success",
        "depth_category_yn" => $depth_category_yn,
        "msg" => "정상적으로 불러왔습니다."
    ]);
} 

if ($mode == "board.field") {
    $board_no = $_REQUEST['board_no'];
    $boardManage_info = getBoardManageInfoByNo($board_no);

    $rows = [];
    foreach ($boardManage_info[0] as $k => $v) {
        if (strpos($k, 'extra_match_field') !== false && !empty($v)) {
            $i = substr($k, strlen('extra_match_field'), 1);
            $rows[] = ["name" => $v, "fields" => "extra$i"];
        }
    }

    echo json_encode([
        'test' => true,
        'result' => 'success',
        'rows' => $rows,
        'msg' => '정상적으로 불러왔습니다.',
    ]);
} 

if ($mode == "board.copy") {
    function copyAndRenameFile($originalPath) {
        if (!file_exists($originalPath)) {
            return false;
        }

        $directory = dirname($originalPath);
        $extension = pathinfo($originalPath, PATHINFO_EXTENSION);
        $newPath = $directory . '/' . uniqid() . '.' . $extension;

        if (!copy($originalPath, $newPath)) {
            return false;
        }

        return basename($newPath);
    }

    function copyAndUpdateImageSrc($htmlContent) {
        global $UPLOAD_DIR_BOARD;
        $updatedSrcArray = [];
        $dom = new DOMDocument();
        libxml_use_internal_errors(true);
        $dom->loadHTML('<?xml encoding="utf-8" ?>' . $htmlContent);
$images = $dom->getElementsByTagName('img');

foreach ($images as $img) {
$originalSrc = $img->getAttribute('src');
$baseSrc = basename($originalSrc);
$updatedSrc = copyAndRenameFile($UPLOAD_DIR_BOARD . '/' . $baseSrc);

if (file_exists($originalSrc)) {
$newSrc = $UPLOAD_DIR_BOARD . '/' . $updatedSrc;

if (copy($originalSrc, $newSrc)) {
$img->setAttribute('src', '/uploads/board/' . $updatedSrc);
$updatedSrcArray[] = $updatedSrc;
}
}
}

$updatedHtmlContent = $dom->saveHTML();
libxml_clear_errors();

return $updatedHtmlContent;
}

$no = $_REQUEST['no'];

try {
$sql = "SELECT thumb_image, file_attach_1, file_attach_2, file_attach_3, file_attach_4, file_attach_5, contents FROM
nb_board WHERE no = :no";
$stmt = DB::getInstance()->prepare($sql);
$stmt->execute([':no' => $no]);
$orgData = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$orgData) {
throw new Exception("정보를 찾을 수 없습니다.");
}

$newData = [];
foreach ($orgData as $k => $v) {
if ($k === 'contents') {
$contents = stripslashes($v);
$contents = htmlspecialchars_decode($contents);
$newContents = copyAndUpdateImageSrc($contents);
$newData[$k] = htmlspecialchars($newContents);
} else if (!empty($v)) {
$newData[$k] = copyAndRenameFile($UPLOAD_DIR_BOARD . '/' . $v);
} else {
$newData[$k] = '';
}
}

$query = "INSERT INTO nb_board (
sitekey,
board_no,
user_no,
category_no,
title,
contents,
regdate,
is_notice,
write_name,
direct_url,
thumb_image,
file_attach_1,
file_attach_2,
file_attach_3,
file_attach_4,
file_attach_5,
file_attach_origin_1,
file_attach_origin_2,
file_attach_origin_3,
file_attach_origin_4,
file_attach_origin_5,
extra1,
extra2,
extra3,
extra4,
extra5,
extra6,
extra7,
extra8,
extra9,
extra10,
extra11,
extra12,
extra13,
extra14,
extra15
)
SELECT
sitekey,
board_no,
user_no,
category_no,
title,
:contents,
regdate,
is_notice,
write_name,
direct_url,
:thumb_image,
:file_attach_1,
:file_attach_2,
:file_attach_3,
:file_attach_4,
:file_attach_5,
file_attach_origin_1,
file_attach_origin_2,
file_attach_origin_3,
file_attach_origin_4,
file_attach_origin_5,
extra1,
extra2,
extra3,
extra4,
extra5,
extra6,
extra7,
extra8,
extra9,
extra10,
extra11,
extra12,
extra13,
extra14,
extra15
FROM nb_board WHERE no = :no";

$stmt = DB::getInstance()->prepare($query);
$stmt->execute([
':contents' => $newData['contents'],
':thumb_image' => $newData['thumb_image'],
':file_attach_1' => $newData['file_attach_1'],
':file_attach_2' => $newData['file_attach_2'],
':file_attach_3' => $newData['file_attach_3'],
':file_attach_4' => $newData['file_attach_4'],
':file_attach_5' => $newData['file_attach_5'],
':no' => $no
]);

echo json_encode(["result" => "success", "msg" => "정상적으로 복사 되었습니다."]);
} catch (PDOException $e) {
echo json_encode(["result" => "fail", "msg" => "DB 처리중 오류가 발생하였습니다.[Error: " . $e->getMessage() . "]"]);
} catch (Exception $e) {
echo json_encode(["result" => "fail", "msg" => $e->getMessage()]);
}
}