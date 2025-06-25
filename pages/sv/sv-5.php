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
            <div class="sv-intro no-pd-120--y" >
                <h2 class="no-heading-md fw-sm"  <?= $aos_right_slow ?>>비상주 관리사무소</h2>

                <div class="no-pd-40--t">
                      <figure class="right-ani">
                        <img src="/resource/images/sub/sv5-intro.jpg">
                    </figure>
                    <div class="desc no-pd-24--t">
                        <p class="no-body-lg fw-r"  <?= $aos_sslow ?>>
                            관리사무소 없이도, 체계적인 운영이 가능합니다.
                            150세대 미만의 공동주택은 전담 관리사무소를 두기엔 비용이 부담스럽지만, <br>
                            입주민 민원 대응, 공용시설 관리, 관리비 정산 등은 여전히 필요합니다.
                            HOUSEMAN은 독립된 관리사무소 없이도, <br>
                            전담 인력이 정기적으로 순회 방문하며, 실제 관리사무소 수준의 역할을 대신합니다.

                        </p>
                    </div>
                </div>
            </div>

            <div class="no-pd-120--y">
                <div class="icon-layout">
                    <div class="text-between">
                        <h2 class="no-heading-md fw-sm"  <?= $aos_slow ?>>필요한 관리, 꼭 맞는 방식으로</h2>
                    </div>

                    <div class="no-pd-64--t">
                        <ul class="grid-col-4 grid-icon"  <?= $aos_sslow ?>>
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/komlvdbl.json" trigger="loop" delay="2000"
                                        colors="primary:#2e5e4e,secondary:#2e5e4e" class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        순회 방문 관리</h3>
                                    <p class="no-pd-10--t no-body-md fw-r">
                                        민원 처리, 공용시설 점검, <br> 입퇴실 관리 등 직접 수행
                                    </p>
                                </div>
                            </li>
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/flfgginf.json" trigger="loop" delay="2000"
                                        class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        입주민 만족도 향상
                                    </h3>
                                    <p class="no-pd-10--t no-body-md fw-r">
                                        친절하고 빠른 응대,<br> 생활 불편 최소화
                                    </p>
                                </div>
                            </li>
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/skvwpjvd.json" trigger="loop" delay="2000"
                                        class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        합리적인 비용 구조
                                    </h3>
                                    <p class="no-pd-10--t no-body-md fw-r">
                                        전담 인력 없이도 <br>전문 관리 가능
                                    </p>
                                </div>
                            </li>
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/zqfagoml.json" trigger="loop" delay="2000"
                                        class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        맞춤형 서비스 선택 가능
                                    </h3>
                                    <p class="no-pd-10--t no-body-md fw-r">
                                        꼭 필요한 항목만 선택해서 <br>효율적 운영 가능
                                    </p>
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