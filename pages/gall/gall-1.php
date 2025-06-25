<?php include_once $_SERVER['DOCUMENT_ROOT'] . '/inc/lib/base.class.php'; ?>

<!-- dev -->

<?php include_once $STATIC_ROOT . '/inc/layouts/head.php'; ?>

<!-- css, js  -->
<?php
include_once $STATIC_ROOT . '/inc/layouts/header.php';
?>
<!-- contents -->
<?php include_once $STATIC_ROOT . '/inc/shared/sub.visual.php'; ?>
<main class="no-sub">
    <section class="no-sub--gall no-pd-120--y">
        <div class="no-container-xl">
            <div class="title">
                <h2 class="no-heading-lg fw-sm">공실현황</h2>
            </div>

            <div class="no-board-top no-pd-80--t">
                <div class="no-pd-64--t">
                    <ul class="cate_tab">
                        <li class="cate_tab--item">
                            <a href="/pages/gall/gall-1.php" class="active">단기임대</a>
                        </li>
                        <li class="cate_tab--item">
                            <a href="/pages/process/pc-2.php">근생</a>
                        </li>
                        <li class=" cate_tab--item">
                            <a href="/pages/process/pc-3.php">일반주택</a>
                        </li>
                    </ul>
                </div>
                <div class="no-board-search">
                    <div class="no-board-search-inp">
                        <form>
                            <div class="no-form-group">
                                <label for="search_term" class="no-form-label">
                                    <div class="no-form-search">
                                        <button type="submit" class="search_control"><i
                                                class="fa-regular fa-magnifying-glass"></i></button>
                                        <input type="search" class="search" placeholder="검색어를 입력해주세요." id="search"
                                            name="search">
                                    </div>
                                </label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>




            <div class="no-pd-120--t">
                <div class="gallery-cont">
                    <ul>
                        <li>
                            <a href="/pages/gall/gall-view.php" class="grid-col-2">
                                <figure>
                                    <img src="/resource/images/main/gall-img01.jpg">
                                    <div class="payment">
                                        <h4 class="no-body-lg fw-sm">중개수수료</h4>
                                        <p class="no-body-lg fw-r">
                                            250,000원
                                        </p>
                                    </div>
                                </figure>

                                <div class="info-wrap">
                                    <span class="cate no-body-md">
                                        역삼동
                                    </span>
                                    <div class="title">
                                        <h3 class="no-heading-md fw-sm">W하우스</h3>
                                        <p class="no-body-lg">투룸</p>
                                    </div>
                                    <div class="desc no-pd-32--t">
                                        <dl>
                                            <dt><i class="fa-solid fa-location-dot"></i>주소</dt>
                                            <dd>서울 강남구 역삼동 W하우스</dd>
                                        </dl>


                                        <dl>
                                            <dt><i class="fa-solid fa-sack-dollar"></i>보증금</dt>
                                            <dd>500만원</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-calendar"></i>월세</dt>
                                            <dd>50만원</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-square-plus"></i>관리비</dt>
                                            <dd>20만원(인터넷, 수도, 전기)</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-tags"></i>상세설명</dt>
                                            <dd>깔끔함, 넓은평수</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-file-lines"></i>계약유무</dt>
                                            <dd>계약가능</dd>
                                        </dl>
                                    </div>

                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="grid-col-2">
                                <figure>
                                    <img src="/resource/images/main/gall-img01.jpg">
                                    <div class="payment">
                                        <h4 class="no-body-lg fw-sm">중개수수료</h4>
                                        <p class="no-body-lg fw-r">
                                            250,000원
                                        </p>
                                    </div>
                                </figure>

                                <div class="info-wrap">
                                    <span class="cate no-body-md">
                                        역삼동
                                    </span>
                                    <div class="title">
                                        <h3 class="no-heading-md fw-sm">W하우스</h3>
                                        <p class="no-body-lg">투룸</p>
                                    </div>
                                    <div class="desc no-pd-32--t">
                                        <dl>
                                            <dt><i class="fa-solid fa-location-dot"></i>주소</dt>
                                            <dd>서울 강남구 역삼동 W하우스</dd>
                                        </dl>


                                        <dl>
                                            <dt><i class="fa-solid fa-sack-dollar"></i>보증금</dt>
                                            <dd>500만원</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-calendar"></i>월세</dt>
                                            <dd>50만원</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-square-plus"></i>관리비</dt>
                                            <dd>20만원(인터넷, 수도, 전기)</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-tags"></i>상세설명</dt>
                                            <dd>깔끔함, 넓은평수</dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid fa-file-lines"></i>계약유무</dt>
                                            <dd>계약가능</dd>
                                        </dl>
                                    </div>

                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="no-pagi-div no-pd-80--t" <?= $aos_sslow ?>>
                <div class="arrow_wrap">
                    <a href="#" class="no-pagi-div__arrow pgi-ar">
                        <i class="fa-light fa-angles-right fa-rotate-180"></i>
                    </a>
                    <a href="#" class="no-pagi-div__arrow pgi-ar">
                        <i class="fa-light fa-angle-up fa-rotate-270"></i>
                    </a>
                </div>


                <ul class="no-pagi-div__list">
                    <li><a href="#" class="active">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                </ul>

                <div class="arrow_wrap">
                    <a href="#" class="no-pagi-div__arrow pgi-al">
                        <i class="fa-light fa-angle-up fa-rotate-90"></i>
                    </a>
                    <a href="#" class="no-pagi-div__arrow pgi-ar">
                        <i class="fa-light fa-angles-right"></i>
                    </a>
                </div>
            </div>
        </div>

    </section>
</main>


<?php
include_once $STATIC_ROOT . '/inc/layouts/footer.php';
?>