<?php
include_once $_SERVER['DOCUMENT_ROOT'] . "/inc/lib/base.class.php";

try {
    // Obtain PDO instance
    $db = DB::getInstance();

    // Previous post query
    $query = "SELECT title, no, regdate FROM nb_board 
              WHERE board_no = :board_no AND is_notice != 'Y' AND no < :no 
              ORDER BY no DESC LIMIT 1";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':board_no', $board_no, PDO::PARAM_INT);
    $stmt->bindParam(':no', $no, PDO::PARAM_INT);
    $stmt->execute();
    $r1 = $stmt->fetch(PDO::FETCH_ASSOC);

    // Set previous post title and link
	$hasPrev= $r1 ? true : false; 
    $prev_title = $r1 ? $r1['title'] : "이전글이 없습니다.";
    $prev_link = $r1 ? $_SERVER['PHP_SELF'] . "?no=" . $r1['no'] . "&board_no=" .$board_no : 'javascript:void(0)';
    $prevBack = $r1 ? '' : 'onClick="redirectToList();"';

    // Next post query
    $query = "SELECT title, no, regdate FROM nb_board 
              WHERE board_no = :board_no AND is_notice != 'Y' AND no > :no 
              ORDER BY no ASC LIMIT 1";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':board_no', $board_no, PDO::PARAM_INT);
    $stmt->bindParam(':no', $no, PDO::PARAM_INT);
    $stmt->execute();
    $r2 = $stmt->fetch(PDO::FETCH_ASSOC);

    // Set next post title and link
	$hasNext = $r2 ? true : false; 
    $next_title = $r2 ? $r2['title'] : "다음글이 없습니다.";
    $next_link = $r2 ? $_SERVER['PHP_SELF'] . "?no=" . $r2['no'] . "&board_no=" . $board_no : 'javascript:void(0)';
    $nextBack = $r2 ? '' : 'onClick="redirectToList();"';

} catch (PDOException $e) {
    echo "데이터를 불러오는 중 오류가 발생했습니다: " . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8');
    exit;
}

?>

<div class="no-board-nav">
    <ul class="no-board-nav__items">
        <li>
            <a href="<?= $prev_link ?>" <?= $prevBack ?> class="no-board-nav__link">
                <div class="no-board-nav__division">
                    <i class="fa-sharp fa-regular fa-angle-up" style="color: #000000;"></i>
                    <p>이전글</p>
                    <span class="no-board-nav__title"><?= $prev_title ?></span>
                </div>
                <span class="no-board-nav__date"><?= $hasPrev ? date('Y-m-d', strtotime($r1['regdate'])) : ''?></span>
            </a>
        </li>
		
        <li>
            <a href="<?= $next_link ?>" <?= $nextBack ?> class="no-board-nav__link">
                <div class="no-board-nav__division">
                    <i class="fa-sharp fa-regular fa-angle-down" style="color: #000000;"></i>
                    <p>다음글</p>
                    <span class="no-board-nav__title"><?= $next_title ?></span>
                </div>
                <span class="no-board-nav__date"><?= $hasNext ?  date('Y-m-d', strtotime($r2['regdate'])) : '' ?></span>
            </a>
        </li>
    </ul>

    <div class="view-btn">
        <a href="javascript:window.history.back();">뒤로가기</a>
    </div>
</div>

<?php
$cate_no = $_GET['category_no'] ?? '';
?>

<script>
function redirectToList() {
    alert('정보를 찾을 수 없습니다.');
    const board_no = searchParam('board_no');
    location.href = './board.list.php?board_no=' + board_no;
}

function searchParam(key) {
    return new URLSearchParams(location.search).get(key);
}
</script>
