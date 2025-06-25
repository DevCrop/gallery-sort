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
                <h2 class="no-heading-md fw-sm"  <?= $aos_right_slow ?>>중소형 주택 관리</h2>

                <div class="no-pd-40--t">
                      <figure class="right-ani">
                        <img src="/resource/images/sub/sv4-intro.jpg">
                    </figure>
                    <div class="desc no-pd-24--t">
                        <p class="no-body-lg fw-r"  <?= $aos_sslow ?>>
                            운영은 복잡하고, 직접 하기엔 너무 번거롭습니다.
                            중소형 주택은 규모는 작아도 손이 많이 갑니다. <br>
                            층간소음, 시설 고장, 민원 대응, 수금, 계약·퇴실 정산 등
                            직접 하다 보면 시간과 감정이 모두 소모되죠. <br>
                            HOUSEMAN은 이런 번거롭고 민감한 운영을 건물주 대신 맡아
                            입주자는 만족하고, <br>
                            건물주는 수익에만 집중할 수 있는 구조를 만듭니다.
                        </p>
                    </div>
                </div>
            </div>

            <div class="no-pd-120--y">
                <div>
                    <div class="text-wrap"  <?= $aos_slow ?>>
                        <h2 class="no-heading-md fw-sm">HOUSEMAN이 대신합니다</h2>
                    </div>

                    <div class="no-pd-64--t flex-wrap">
                        <ul class="flex-contents grid-col-2">
                            <li  <?= $aos_slow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-4-01.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">세입자 민원 응대</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">층간소음, 청소, 고장 수리 등 즉시 처리</p>
                                    </div>

                                </div>
                            </li>
                            <li  <?= $aos_sslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-4-02.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">시설 유지보수</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">
                                            정기 점검 & 긴급 대응
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="flex-contents grid-col-2">
                            <li  <?= $aos_slow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-4-03.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">공실 대응</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">
                                            단기·장기 병행 운영 전략, 빠른 계약 유도
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li  <?= $aos_sslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-4-04.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">임대료 수금 & 퇴실 정산</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">
                                            체계적 수납 관리 + 원상복구까지 완벽 마무리
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