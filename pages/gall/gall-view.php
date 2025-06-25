<?php include_once $_SERVER['DOCUMENT_ROOT'] . '/inc/lib/base.class.php'; ?>

<!-- dev -->

<?php include_once $STATIC_ROOT . '/inc/layouts/head.php'; ?>

<!-- css, js  -->
<?php
include_once $STATIC_ROOT . '/inc/layouts/header.php';
?>
<!-- contents -->
<main class="no-sub">
    <section class="no-sub--gall no-pd-80--y">
        <div class="no-container-xl">
            <div class="gallery-cont--view no-pd-120--b">
                <ul>
                    <li class="grid-col-2">
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
                                <div class="btn-wrap no-pd-24--t">
                                    <div class="tel">
                                        <a href="tel:010-5560-8245" class="no-body-lg fw-sm p-color">전화문의
                                            010-5560-8245</a>
                                    </div>
                                    <div class="list">
                                        <a href="#" class="no-body-lg fw-sm g-color">목록</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="no-pd-80--y">
                <div class="title-left">
                    <h2 class="no-heading-md fw-sm">
                        내부사진
                    </h2>
                </div>
                <div class="no-pd-48--t">
                    <div class="swiper view-swiper no-pd-60--top" <?= $aos_sslow ?>>
                        <ul class="swiper-wrapper">
                            <li class="swiper-slide">
                                <figure>
                                    <img src="/resource/images/sub/view-01.jpg">
                                </figure>
                            </li>
                            <li class="swiper-slide">
                                <figure>
                                    <img src="/resource/images/sub/view-02.jpg">
                                </figure>
                            </li>
                            <li class="swiper-slide">
                                <figure>
                                    <img src="/resource/images/sub/view-01.jpg">

                                </figure>
                            </li>
                            <li class="swiper-slide">
                                <figure>
                                    <img src="/resource/images/sub/view-02.jpg">

                                </figure>
                            </li>
                            <li class="swiper-slide">
                                <figure>
                                    <img src="/resource/images/sub/view-01.jpg">

                                </figure>
                            </li>
                        </ul>
                        <div class="swiper-button-prev view-prev"><i class="fa-thin fa-angle-up fa-rotate-270"></i>
                        </div>
                        <div class="swiper-button-next view-next"><i class="fa-thin fa-angle-up fa-rotate-90"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="no-pd-80--t">
                <div class="title-left">
                    <h2 class="no-heading-md fw-sm">
                        상세정보
                    </h2>

                </div>
                <div class="no-pd-48--t">
                    <div class="map-info-wrap">
                        <ul>
                            <li class="map">
                                <a href="#" class="no-body-md fw-m map-btn" target="__blank">
                                    <i class="fa-solid fa-map-location-dot"></i>네이버지도 보기
                                </a>
                                <div class="download">
                                    <a href="#" class="no-body-md fw-m" download><i
                                            class="fa-solid fa-arrow-down-to-bracket"></i>계약서 다운로드</a>
                                </div>
                            </li>
                            <li class="detail-info grid-col-3">
                                <dl>
                                    <dt class="fw-sm">방구조</dt>
                                    <dd class="fw-r">분리형</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">룸</dt>
                                    <dd class="fw-r">1</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">화장실</dt>
                                    <dd class="fw-r">1</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">수도요금</dt>
                                    <dd class="fw-r">3만원</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">인터넷/TV</dt>
                                    <dd class="fw-r">3만원</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">전기/가스</dt>
                                    <dd class="fw-r">3만원</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">주차</dt>
                                    <dd class="fw-r">협의주차</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">엘리베이터</dt>
                                    <dd class="fw-r">-</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">옵션</dt>
                                    <dd class="fw-r">풀옵션</dd>
                                </dl>
                                <dl>
                                    <dt class="fw-sm">용도</dt>
                                    <dd class="fw-r">3만원</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="no-pd-40--t">
                    <div class="notice ">
                        <h4 class="no-body-xl fw-sm no-pd-12--b">특이사항</h4>
                        <div class="content no-pd-24--y">
                            <p class="no-body-lg fw-r">
                                dsadasdsadsadsadsadsadsadasdsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsad
                                sadsadsadsadsadsadsadsadsadsadasdasddsadasdsadsadsadsadsadsadasdsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadasdasddsadasdsadsadsadsadsadsadasdsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadsadasdasd
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </section>
</main>


<?php
include_once $STATIC_ROOT . '/inc/layouts/footer.php';
?>