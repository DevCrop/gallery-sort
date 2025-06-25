<?php
$cur_gnb = $CUR_PAGE_LIST[0]['title'];
$cur_snb = $CUR_PAGE_LIST[1]['title'];

$img_path = '';
$sub_path = '';
$main_path = '';

if ($cur_gnb == 'HOUSEMAN 소개') {
    $img_path = '0';
    $main_path = 'HOUSEMAN 소개';
} else if ($cur_gnb == '서비스안내') {
    $img_path = '1';
    $main_path = '서비스안내';
} else if ($cur_gnb == '공실정보') {
    $img_path = '2';
    $main_path = '공실정보 ';
}
?>

<section class="no-sub-visual">
    <div class="no-sub-visual-img">
        <figure class="scale-img">
            <img src="/resource/images/sub/sub-vs-<?= $img_path ?>.jpg">
        </figure>


        <div class="no-container-xl title" >
            <h2 class="no-heading-xl fw-sm" <?= $aos_slow?>><?php echo $main_path ?></h2>
            <nav class="no-sub-visaul-nav ">
                <div class="no-container-xl" <?= $aos_slow?>>
                    <a href="/"><i class="fa-sharp fa-regular fa-house" style="color: #ffffff;"></i></a>
                    <i class="fa-regular fa-angle-up fa-rotate-90" style="color: #fff;"></i>
                    <?php
                    $pagecount = 0;
                    $totalpages = count($CUR_PAGE_LIST);
                    foreach ($CUR_PAGE_LIST as $page) {
                        if ($page['isActive']) {
                            echo '<h2>' . $page['title'] . '</h2>';
                            $pagecount++;

                            if ($pagecount < $totalpages) {
                                echo '<i class="fa-regular fa-angle-up fa-rotate-90" style="color: #fff;"></i>';
                            }
                        }
                    }
                    ?>
                </div>
            </nav>
        </div>

    </div>
</section>