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
    <section class="no-sub--about no-pd-120--y">
        <div class="no-container-xl">
            <div class="title" <?= $aos_slow?>>
                <h2 class="no-heading-lg fw-sm">HOUSEMAN 소개</h2>
            </div>

            <div class="about-contents no-pd-64--t grid-col-2" >
                <figure <?= $aos_right_sslow ?>>
                    <img src="/resource/images/sub/about-img.jpg">
                </figure>
                <div class="text" <?= $aos_left_sslow ?>>
                    <span class="no-body-xl primary-c fw-sm">About</span>
                    <h3 class="no-heading-sm fw-sm no-pd-4--t">
                       실전에서 증명된 운영 전문 기업, HOUSEMAN
                    </h3>

                    <div class="desc no-pd-48--t">
                        <p>
                         HOUSEMAN은 단순히 스타트업이 아니라,
						14년간 현장을 누비며 건물 운영의 본질을 지켜온 실전형 전문가 조직입니다.

						건물 관리는 단순히 시스템을 도입하거나
						IT 기술을 흉내낸다고 해서 운영이 되는 일이 아닙니다.
						실제 현장 경험 없이 접근하면, 운영의 신뢰는 쉽게 무너질 수밖에 없습니다.
                        </p>

                        <p>
                          HOUSEMAN은
						2012년 설립 이후 수많은 건물을 직접 관리하며 축적한 현장 중심의 노하우를 바탕으로,
						운영 프로세스 개선, 기술 도입, 문제 해결력 강화를 멈추지 않고 이어가고 있습니다.

						인공지능이 아무리 발달해도,
						건물 관리라는 일은 결국 사람의 경험과 감각, 축적된 맨파워가 뒷받침되어야 합니다.

						기술도 경험도 함께 갖춘,
						가장 현실적이고 신뢰할 수 있는 운영 파트너, 그 이름이 바로 HOUSEMAN입니다.
                        </p>

                        <p>
                            2025년 기준, 서울 전역에 50개 이상의 거래처,
                            10건 이상의 기업·기관 시설관리,
                            다수의 소형 단지 관리사무소 운영을 안정적으로 수행 중입니다.
                            HOUSEMAN은 지금도 강남을 기반으로
                            현장을 이해하는 진짜 관리 전문가 집단으로 계속 성장하고 있습니다.
                        </p>
                    </div>
					
					<div class="point no-pd-32--t">
						<p class="no-body-md fw-m">대표 <span class="no-body-xl fw-sm">박종호</span></p>
					</div>
                </div>
            </div>
        </div>

    </section>
</main>


<?php
include_once $STATIC_ROOT . '/inc/layouts/footer.php';
?>