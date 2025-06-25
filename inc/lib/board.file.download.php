<?php
include_once $_SERVER['DOCUMENT_ROOT'] . "/inc/lib/base.class.php";

$no = $_GET['no'] ?? null;
$fld = $_GET['fld'] ?? null;

if (!$no || !$fld) die("잘못된 접근");

$pdo = DB::getInstance();

$query = "SELECT thumb_image, file_attach_1, file_attach_2, file_attach_3, file_attach_4, file_attach_5,
                 file_attach_origin_1, file_attach_origin_2, file_attach_origin_3, file_attach_origin_4, file_attach_origin_5
          FROM nb_board 
          WHERE no = ?";

$stmt = $pdo->prepare($query);
$stmt->execute([$no]);
$data = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$data) die("정보를 찾을 수 없습니다");

switch ($fld) {
    case "thumb":
        $filename = $data['thumb_image'];
        $filename_origin = $data['thumb_image'];
        break;
    case "attach1":
    case "attach2":
    case "attach3":
    case "attach4":
    case "attach5":
        $index = substr($fld, -1);
        $filename = $data["file_attach_$index"];
        $filename_origin = $data["file_attach_origin_$index"];
        break;
    default:
        die("유효하지 않은 필드 값입니다");
}

$filepath = $_SERVER['DOCUMENT_ROOT'] . "/uploads/board/" . $filename;

if (!file_exists($filepath)) {
    die("파일을 찾을 수 없습니다.");
}

$extension = strtolower(pathinfo($filepath, PATHINFO_EXTENSION));
$filesize = filesize($filepath);

$mimeTypes = [
    'pdf' => 'application/pdf',
    'zip' => 'application/zip',
    'hwp' => 'application/x-hwp',
    'xls' => 'application/vnd.ms-excel',
    'xlsx' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'doc' => 'application/msword',
    'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'ppt' => 'application/vnd.ms-powerpoint',
    'pptx' => 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'jpg' => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'png' => 'image/png',
    'gif' => 'image/gif',
];

$mime = $mimeTypes[$extension] ?? 'application/octet-stream';

header("Content-Type: $mime");
header("Content-Disposition: attachment; filename=\"" . basename($filename_origin) . "\"");
header("Content-Transfer-Encoding: binary");
header("Content-Length: $filesize");
header("Pragma: public");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

ob_clean();
flush();
readfile($filepath);
exit;
