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
                <h2 class="no-heading-md fw-sm" <?= $aos_right_slow ?>>중소·중견 기업 시설 관리</h2>

                <div class="no-pd-40--t">
                      <figure class="right-ani">
                        <img src="/resource/images/sub/sv2-intro.jpg">
                    </figure>
                    <div class="desc no-pd-24--t">
                        <p class="no-body-lg fw-r" <?= $aos_sslow ?>>
                            시설 관리도, 결국은 ‘회사 이미지’입니다
                            직원에게 맡기기엔 애매하고, 전담 인력을 두기엔 부담스러운 사무공간의 유지관리 <br>
                            하지만 전등 하나, 화장실 한 칸의 청결이 회사 인상을 좌우합니다.
                            HOUSEMAN은 포르쉐 코리아, 보건복지부 산하 이브릿지 등 <br>
                            대형 기관에서 검증된 시설관리 기준과 프로세스를 바탕으로
                            중소·중견 기업에게도 합리적인 비용으로 <br>
                            높은 품질의 관리 서비스를 제공합니다.
                        </p>
                    </div>
                </div>
            </div>

            <div class="no-pd-120--y">
                <div>
                    <div class="text-wrap" <?= $aos_slow ?>>
                        <h2 class="no-heading-md fw-sm">왜 기업은 HOUSEMAN을 선택할까요?</h2>
                    </div>

                    <div class="no-pd-64--t flex-wrap">
                        <ul class="flex-contents grid-col-2">
                            <li <?= $aos_slow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-1-01.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">정기 방문 & 상시 점검</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">전등 교체, 간단 수리, 청소 등 작은 문제도 미루지 않고 즉시 해결
                                    </div>

                                </div>
                            </li>
                            <li <?= $aos_sslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-1-02.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">투명한 운영 프로세스</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">작업 이력과 비용 공개, 필요한 항목만 안내
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul class="flex-contents grid-col-2">
                            <li <?= $aos_ssslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-1-03.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">기업 이미지 상승 효과</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">방문 고객, 협력사에게 보여지는 공간의 완성도 향상
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li <?= $aos_ssslow ?>>
                                <figure class="img-drop">
                                    <img src="/resource/images/sub/sv-1-04.jpg">
                                </figure>
                                <div class="text">
                                    <div>
                                        <h4 class="no-heading-xs fw-sm">불필요한 고정 인건비 절감</h4>
                                        <p class="no-pd-10--t no-body-md fw-r">별도 인력 없이도 전문 관리를 받을 수 있는 구조
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