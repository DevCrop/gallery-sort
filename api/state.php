<?php
include_once "../inc/lib/base.class.php";

header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

// 필수값 검사
if (!isset($data['id'], $data['type'], $data['value'])) {
    echo json_encode([
        "success" => false,
        "message" => "잘못된 요청입니다."
    ]);
    exit;
}

$id = (int)$data['id'];
$type = $data['type'];
$value = (int)$data['value'];

$allowedFields = ['is_visible', 'is_contract'];

if (!in_array($type, $allowedFields, true)) {
    echo json_encode([
        "success" => false,
        "message" => "허용되지 않은 필드입니다."
    ]);
    exit;
}

try {
    $pdo = DB::getInstance();

    $stmt = $pdo->prepare("SELECT {$type} FROM nb_board WHERE no = :id LIMIT 1");
    $stmt->execute([':id' => $id]);
    $current = $stmt->fetchColumn();

    if ($current === false) {
        echo json_encode([
            "success" => false,
            "message" => "해당 게시글을 찾을 수 없습니다."
        ]);
        exit;
    }

    if ((int)$current === $value) {
        echo json_encode([
            "success" => false,
            "message" => "변경된 값이 없습니다. (동일 상태)",
            "skipped" => true
        ]);
        exit;
    }

    $update = $pdo->prepare("UPDATE nb_board SET {$type} = :value WHERE no = :id");
    $update->execute([
        ':value' => $value,
        ':id' => $id
    ]);

    echo json_encode([
        "success" => true,
        "message" => "상태가 성공적으로 변경되었습니다."
    ]);
} catch (PDOException $e) {
    echo json_encode([
        "success" => false,
        "message" => "DB 오류가 발생했습니다.",
        "error" => $e->getMessage()
    ]);
}