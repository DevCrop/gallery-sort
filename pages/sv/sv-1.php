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
                <h2 class="no-heading-md fw-sm" <?= $aos_right_slow ?>>단기임대</h2>

                <div class="no-pd-40--t">
                    <figure class="right-ani">
                        <img src="/resource/images/sub/sv1-intro.jpg">
                    </figure>
                    <div class="desc no-pd-24--t">
                        <p class="no-body-lg fw-r" <?= $aos_sslow ?>>
                            수익은 극대화되지만, 전략 없이 시작하면 실패합니다.
                            단기임대는 기존 장기임대 대비 수익이 월등히 높은 구조입니다. <br>
                            HOUSEMAN이 운영하는 강남·서초·관악·동작·강동·광진 지역의 사례들에서는
                            최대 50% 이상 수익이 상승한 사례도 있을 만큼, <br>
                            제대로만 운영하면 결과는 압도적입니다.
                            하지만 모든 건물이 단기임대에 적합한 것은 아닙니다. <br>
                            입지, 구조, 시장 수요, 세팅 상태 등 여러 조건이 맞아야
                            공실 없이 안정적인 수익을 기대할 수 있습니다.
                        </p>
                    </div>
                </div>
            </div>

            <div class="no-pd-120--y">
                <div class="icon-layout">
                    <div class="text-between" <?= $aos_slow ?>>
                        <h2 class="no-heading-md fw-sm">HOUSEMAN은 수익 가능성부터 <span class="primary-c fw-b"> <br>
                                진단</span>합니다</h2>

                        <p class="no-body-lg fw-r">
                            HOUSEMAN은 단순 위탁 운영이 아니라 운영 적합성과 수익성을 먼저 검토하고, <br>실행 가능한 건물에만 전략적으로 운영을 시작합니다.
                        </p>
                    </div>

                    <div class="no-pd-64--t" <?= $aos_sslow ?>>
                        <ul class="grid-col-4 grid-icon">
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/dznelzdk.json" trigger="loop" delay="2000"
                                        colors="primary:#2e5e4e,secondary:#2e5e4e" class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        강남·서초·관악·동작 등 주요 지역<br>
                                        실전 운영 경험 다수</h3>
                                </div>
                            </li>
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/onpktcxg.json" trigger="loop" delay="2000"
                                        class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        수익성 시뮬레이션 <br>+ 유사 건물 비교 사례 제공</h3>
                                </div>
                            </li>
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/pxglrdrs.json" trigger="loop" delay="2000"
                                        class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        공실 관리, 민원, 수금, <br>계약까지 All-in-One 대행</h3>
                                </div>
                            </li>
                            <li>
                                <figure class="icon">
                                    <lord-icon src="https://cdn.lordicon.com/enykpmxx.json" trigger="loop" delay="2000"
                                        class="lord">
                                    </lord-icon>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-body-lg fw-sm">
                                        3개월 단위 계약 <br>+ 100% 수금 책임제</h3>
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