<div class="no-pagi-div no-pd-80--t" >
    <!-- 맨앞으로 이동 -->
    <?php if ($listCurPage > 1): ?>
        <div class="no-pagi-div--first">
            <a href="javascript:void(0);" title="first" class="no-pagi-div__arrow pgi-ar" onClick="goListMove(1, '<?= htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') ?>');">
				<i class="fa-light fa-angles-right fa-rotate-180"></i>
            </a>
        </div>
    <?php else: ?>
        <div class="no-pagi-div--first">
            <a href="javascript:void(0);" title="first" class="no-pagi-div__arrow pgi-ar">
                <i class="fa-light fa-angles-right fa-rotate-180"></i>
            </a>
        </div>
    <?php endif; ?>

    <!-- 이전 페이지 -->
    <?php if ($listCurPage > 1): ?>
        <?php $prevpage = $listCurPage - 1; ?>
        <div class="no-pagi-div--prev">
            <a href="javascript:void(0);" title="prev" class="no-pagi-div__arrow pgi-ar" onClick="goListMove(<?= htmlspecialchars($prevpage, ENT_QUOTES, 'UTF-8') ?>, '<?= htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') ?>');">
               <i class="fa-light fa-angle-up fa-rotate-270"></i>
            </a>
        </div>
    <?php else: ?>
        <div class="no-pagi-div--prev">
            <a href="javascript:void(0);" title="prev" class="no-pagi-div__arrow pgi-ar">
                <i class="fa-light fa-angle-up fa-rotate-270"></i>
            </a>
        </div>
    <?php endif; ?>

   <?php
// Pagination range 설정
$pageRange = 5; // 표시할 페이지 범위
$maxVisiblePages = 9; // 최대 표시할 페이지 수 (9페이지까지만 표시)

// 시작 및 종료 페이지 계산
$startPage = max(1, $listCurPage - $pageRange);
$endPage = min($Page, $listCurPage + $pageRange);

// 페이지 범위 초과 시 처리
if ($listCurPage <= $maxVisiblePages) {
    $startPage = 1;
    $endPage = min($maxVisiblePages, $Page);
} else {
    $startPage = $listCurPage - floor($pageRange / 2);
    $endPage = $startPage + $pageRange - 1;

    // 마지막 페이지 범위 초과 방지
    if ($endPage > $Page) {
        $endPage = $Page;
        $startPage = max(1, $endPage - $pageRange + 1);
    }
}
?>

<ul class="no-pagi-div__list">
    <?php if ($startPage > 1): ?>
        <li>
            <a href="javascript:void(0);" title="1 page" class="num" onClick="goListMove(1, '<?= htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') ?>');">
                1
            </a>
        </li>
        <?php if ($startPage > 2): ?>
            <li><span>...</span></li>
        <?php endif; ?>
    <?php endif; ?>

    <?php for ($x = $startPage; $x <= $endPage; $x++): ?>
        <li>
            <?php if ($x == $listCurPage): ?>
                <a href="javascript:void(0);" title="<?= htmlspecialchars($x, ENT_QUOTES, 'UTF-8') ?> page" class="active num">
                    <?= htmlspecialchars($x, ENT_QUOTES, 'UTF-8') ?>
                </a>
            <?php else: ?>
                <a href="javascript:void(0);" title="<?= htmlspecialchars($x, ENT_QUOTES, 'UTF-8') ?> page" class="num" onClick="goListMove(<?= htmlspecialchars($x, ENT_QUOTES, 'UTF-8') ?>, '<?= htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') ?>');">
                    <?= htmlspecialchars($x, ENT_QUOTES, 'UTF-8') ?>
                </a>
            <?php endif; ?>
        </li>
    <?php endfor; ?>

    <?php if ($endPage < $Page): ?>
        <?php if ($endPage < $Page - 1): ?>
            <li><span>...</span></li>
        <?php endif; ?>
        <li>
            <a href="javascript:void(0);" title="<?= htmlspecialchars($Page, ENT_QUOTES, 'UTF-8') ?> page" class="num" onClick="goListMove(<?= htmlspecialchars($Page, ENT_QUOTES, 'UTF-8') ?>, '<?= htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') ?>');">
                <?= htmlspecialchars($Page, ENT_QUOTES, 'UTF-8') ?>
            </a>
        </li>
    <?php endif; ?>
</ul>

    <!-- 다음 페이지 -->
    <?php if ($listCurPage < $Page): ?>
        <?php $nextpage = $listCurPage + 1; ?>
        <div class="no-pagi-div--next">
            <a href="javascript:void(0);" title="next" class="prevnext next no-pagi-div__arrow pgi-al" onClick="goListMove(<?= htmlspecialchars($nextpage, ENT_QUOTES, 'UTF-8') ?>, '<?= htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') ?>');">
                <i class="fa-light fa-angle-up fa-rotate-90"></i>
            </a>
        </div>
    <?php else: ?>
        <div class="no-pagi-div--next">
            <a href="javascript:void(0);" title="next" class="prevnext next no-pagi-div__arrow pgi-al">
                <i class="fa-light fa-angle-up fa-rotate-90"></i>
            </a>
        </div>
    <?php endif; ?>

    <!-- 맨뒤로 이동 -->
    <?php if ($listCurPage < $Page): ?>
        <div class="no-pagi-div--last">
            <a href="javascript:void(0);" title="last" class="no-pagi-div__arrow pgi-ar" onClick="goListMove(<?= htmlspecialchars($Page, ENT_QUOTES, 'UTF-8') ?>, '<?= htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') ?>');">
                <i class="fa-light fa-angles-right"></i>
            </a>
        </div>
    <?php else: ?>
        <div class="no-pagi-div--last">
            <a href="javascript:void(0);" title="last" class="no-pagi-div__arrow pgi-ar">
                <i class="fa-light fa-angles-right"></i>
            </a>
        </div>
    <?php endif; ?>
</div>

<script>
function goListMove(start, url) {
    const form = document.getElementById('frm');
    const hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.name = 'page';
    hiddenInput.value = start;
    form.appendChild(hiddenInput);
    form.action = url;
    form.submit();
}
</script>
