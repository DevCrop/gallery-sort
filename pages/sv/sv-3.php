<?php include_once $_SERVER['DOCUMENT_ROOT'] . '/inc/lib/base.class.php'; ?>

<!-- dev -->

<?php include_once $STATIC_ROOT . '/inc/layouts/head.php'; ?>

<!-- css, js  -->
<?php
include_once $STATIC_ROOT . '/inc/layouts/header.php';
?>
<!-- contents -->
<?php include_once $STATIC_ROOT . '/inc/shared/sub.visual.php'; ?>
<?php include_once $STATIC_ROOT . '/inc/shared/sub.nav.php'; ?>
<main class="no-sub">
    <section class="no-sub--sv">
        <div class="no-container-xl">
            <div class="sv-intro no-pd-120--y">
                <h2 class="no-heading-md fw-sm" <?= $aos_right_slow ?>>중소형 빌딩 관리</h2>

                <div class="no-pd-40--t">
                    <figure class="right-ani">
                        <img src="/resource/images/sub/sv3-intro.jpg">
                    </figure>
                    <div class="desc no-pd-24--t">
                        <p class="no-body-lg fw-r"  <?= $aos_sslow ?>>
                            ‘건물 운영’, 생각보다 복잡하고 중요합니다. 세입자 관리, 임대료 수금, 계약 연장, 민원 대응, 시설 유지보수까지 <br>
                            건물을 직접 운영한다는 건 생각보다 훨씬 많은
                            시간과 스트레스를 요구합니다. <br>
                            그리고 소홀한 운영은 결국 공실과 수익 손실로 이어집니다.
                        </p>
                    </div>
                </div>
            </div>

            <div class="no-pd-120--y">
                <div>
                    <div class="text-wrap"  <?= $aos_slow ?>>
                        <h2 class="no-heading-md fw-sm">HOUSEMAN 전반 통합 관리</h2>
                    </div>

                    <div class="no-pd-64--t flex-wrap">
                        <ul class="flex-contents grid-col-2">
                            <li  <?= $aos_slow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-3-01.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">공실 관리</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">임대 광고, 임대료 책정, 부동산 연계</p>
                                    </div>

                                </div>
                            </li>
                            <li  <?= $aos_sslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-3-02.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">수금·계약 관리</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">
                                            체계적인 수납 시스템 + 연체 시 법적 대응
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="flex-contents grid-col-2">
                            <li  <?= $aos_sslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-3-03.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">시설 유지보수</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">
                                            정기 점검으로 장기 비용 절감 & 긴급 상황 대응
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li  <?= $aos_sslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-3-04.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">세입자 민원 대응</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">
                                            건물주 대신 빠르고 깔끔하게 처리
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <article class="contact-banner">
            <figure>
                <img src="/resource/images/main/contact-bg.jpg">
            </figure>
            <div class="text-btn-wrap no-container-xl">
                <h2 class="no-heading-lg fw-b" <?= $aos_right_slow ?>>당신의 건물, 하우스맨이 책임집니다</h2>
            <p class="no-body-xl fw-r no-pd-18--t" <?= $aos_right_slow ?>>
							임대료 수금, 행정, 시설관리를 표준화된 매뉴얼로 운영하며, <br>
							 AI 기반 지역 중개 네트워크 통합 시스템으로
							공실 없는 건물, <br>수익 중심의 운영을 실현합니다.
			</p>

            <div class="btn-wrap no-pd-40--t" <?= $aos_right_slow ?>>
                <a href="tel:1544-4150" class="fw-m"><i class="fa-solid fa-phone"></i>관리문의 1544-4150</i></a>
            </div>
            </div>
        </article>
    </section>
</main>


<?php
include_once $STATIC_ROOT . '/inc/layouts/footer.php';
?>