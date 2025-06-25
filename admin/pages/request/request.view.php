<!DOCTYPE html>
<html lang="ko">
<?php

include_once $_SERVER['DOCUMENT_ROOT'] . "/inc/lib/base.class.php";

$depthnum = 3;
$pagenum = 1;

$no = $_REQUEST['no'];
$db = DB::getInstance();

try {
    // Get request data
    $stmt = $db->prepare("SELECT * FROM nb_request WHERE no = :no");
    $stmt->execute(['no' => $no]);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$data) {
        throw new Exception("정보를 찾을 수 없습니다");
    }

    // Fetch board list
    $stmtBoard = $db->prepare("SELECT no, title, skin, sort_no FROM nb_board_manage ORDER BY no ASC");
    $stmtBoard->execute();
    $arrBoardList = $stmtBoard->fetchAll(PDO::FETCH_ASSOC);

} catch (Exception $e) {
    echo "<script>alert('" . $e->getMessage() . "'); history.back();</script>";
    exit;
}

include_once "../../inc/admin.title.php";
include_once "../../inc/admin.css.php";
include_once "../../inc/admin.js.php";
?>
</head>

<body>
    <div class="no-wrap">
        <!-- Header -->
        <?php include_once "../../inc/admin.header.php"; ?>

        <!-- Main -->
        <main class="no-app no-container">
            <!-- Drawer -->
            <?php include_once "../../inc/admin.drawer.php"; ?>

            <!-- Contents -->
            <form id="frm" name="frm" method="post" enctype="multipart/form-data">
            <input type="hidden" id="mode" name="mode" value="">
            <input type="hidden" id="no" name="no" value="<?= htmlspecialchars($data['no']) ?>">
                <section class="no-content">
                    <!-- Page Title -->
                    <div class="no-toolbar">
                        <div class="no-toolbar-container no-flex-stack">
                            <div class="no-page-indicator">
                            <h1 class="no-page-title">상담문의 목록</h1>
                            <div class="no-breadcrumb-container">
                                <ul class="no-breadcrumb-list">
                                <li class="no-breadcrumb-item">
                                    <span>상담문의</span>
                                </li>
                                <li class="no-breadcrumb-item">
                                    <span>상담목록</span>
                                </li>
                                </ul>
                            </div>
                            </div>
                            <!-- page indicator -->
                        </div>
                    </div>
                    <!-- card-title -->
                    <div class="no-toolbar-container">
                        <div class="no-card">
                            <div class="no-card-header no-card-header--detail">
                                <h2 class="no-card-title">신청 내용</h2>
                            </div>
                            <div class="no-card-body no-admin-column no-admin-column--detail">

								<div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="name">이름</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <input
                                            type="text"
                                            name="b_desc"
                                            id="b_desc"
                                            class="no-input--detail"
                                            value="<?= htmlspecialchars($data['name']) ?>"
                                            readonly
                                        />
                                    </div>
                                </div>
                                <!-- admin-block -->

                                <div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="phone">생년월일</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <input
                                            type="tel"
                                            name="b_desc"
                                            id="b_desc"
                                            class="no-input--detail"
                                            value="<?= htmlspecialchars($data['birth']) ?>"
                                            readonly
                                        />
                                    </div>
                                </div>
                                <!-- admin-block -->
								
								<div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="b_desc">성별</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <input
                                            type="text"
                                            name="b_desc"
                                            id="b_desc"
                                            class="no-input--detail"
                                            value="<?= htmlspecialchars($data['gender']) ?>"
                                            readonly
                                        />
                                    </div>
                                </div>
								<!-- admin-block -->
								<div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="b_desc">지원부분</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <input
                                            type="text"
                                            name="b_desc"
                                            id="b_desc"
                                            class="no-input--detail"
                                            value="<?= htmlspecialchars($data['sup']) ?>"
                                            readonly
                                        />
                                    </div>
                                </div>

								<!-- admin-block -->
								<div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="b_desc">주소</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <input
                                            type="text"
                                            name="b_desc"
                                            id="b_desc"
                                            class="no-input--detail"
                                            value="<?= htmlspecialchars($data['address']) ?>"
                                            readonly
                                        />
                                    </div>
                                </div>
							<!-- admin-block -->
								<div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="b_desc">상세주소</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <input
                                            type="text"
                                            name="b_desc"
                                            id="b_desc"
                                            class="no-input--detail"
                                            value="<?= htmlspecialchars($data['address_detail']) ?>"
                                            readonly
                                        />
                                    </div>
                                </div>
                                <!-- admin-block -->
							
                                <div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="b_desc">등록일</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <input
                                            type="text"
                                            name="b_desc"
                                            id="b_desc"
                                            class="no-input--detail"
                                            value="<?= htmlspecialchars(date("Y-m-d", strtotime($data['regdate']))) ?>"
                                            readonly
                                        />
                                    </div>
                                </div>
                                <!-- admin-block -->

                                <div class="no-admin-block">
                                    <h3 class="no-admin-title">
                                        <label for="b_desc">문의내용</label>
                                    </h3>
                                    <div class="no-admin-content">
                                        <textarea name="" id="" cols="30" rows="10" readonly><?= htmlspecialchars($data['contents']) ?></textarea>
                                    </div>
                                </div>
                                <!-- admin-block -->

                                <div class="no-items-center center">
                                    <a
                                        href="javascript:void(0);"
                                        class="no-btn no-btn--big no-btn--delete-outline"
                                        onClick="doDelete(<?= htmlspecialchars($data['no']) ?>);"
                                    >
                                        삭제
                                    </a>
                                    <a
                                        href="./request.list.php"
                                        class="no-btn no-btn--big no-btn--normal"
                                    >
                                        목록
                                    </a>
                                </div>
                            </div>
                            <!-- card-body -->
                        </div>
                    </div>
                </section>
            </form>
        </main>

        <!-- Footer -->
        <script type="text/javascript" src="./js/request.process.js?c=<?= htmlspecialchars($STATIC_ADMIN_JS_MODIFY_DATE) ?>"></script>
        <?php include_once "../../inc/admin.footer.php"; ?>
        
    </div>
</body>
</html>
