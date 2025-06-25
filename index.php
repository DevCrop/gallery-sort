<?php include_once $_SERVER['DOCUMENT_ROOT'] . '/inc/lib/base.class.php'; ?>

<!-- dev -->

<?php include_once $STATIC_ROOT . '/inc/layouts/head.php'; ?>
<?php include_once $STATIC_ROOT . '/inc/layouts/header.php'; ?>
<!-- css, js  -->
<!-- contents -->
<main class="no-main">
    <section class="no-main--visual">
        <div class="swiper key-vs_slider">
            <ul class="swiper-wrapper key-vs_slider-wrapper">
                <?php 
				 $arrBanner = getBanner("site_main",5,"data"); 
			?>
                <?php foreach($arrBanner as $k => $v) : 
				$link = "javascript:void(0);";
				  $target = "";
				  if($v['b_link']){
				   $link = $v['b_link'];
				   if($v['b_target'] == "_self")
					$target = "_self";
				   else if($v['b_target'] == "_blank")
					$target = "_blank";
				 }

				 $b_image = $UPLOAD_WDIR_BANNER."/".$v['b_img'];
                 
				 $b_title =$v['b_title'];
				 $b_desc =$v['b_desc'];
				?>
                <li class="swiper-slide key-vs_slider-item">
                    <figure>
                        <img src=<?= $b_image ?>>
                    </figure>
                    <div class="txt_wrap no-container-2xl">
                        <div class="text-ani">
                            <h2 class="no-heading-xl fw-ex">
                                <?=$b_title?>
                            </h2>
                            <p class="no-pd-16--t no-heading-xs fw-r">
                                <?=  $b_desc ?>
                            </p>
                        </div>
                    </div>
                </li>
                <?php endforeach; ?>
            </ul>
            <div class="control no-container-2xl">
                <div class="inner">
                    <div class="swiper-button-prev key-vs-p"><i class="fa-regular fa-angle-up fa-rotate-270"></i></div>
                    <div class="swiper-pagination key-pagi"></div>
                    <div class="swiper-button-next key-vs-n"><i class="fa-regular fa-angle-up fa-rotate-90"></i></div>
                </div>
            </div>
        </div>
    </section>

    <section class="no-main--about no-pd-120--y">
        <div class="bg"></div>
        <div class="no-container-xl">
            <div class="flex-box">
                <div class="text-wrap">
                    <h2 class="no-heading-xl fw-sm font-en" <?= $aos_right_slow ?>>About Housman</h2>
                    <div class="desc" <?= $aos_left_slow ?>>
                        <p class="no-heading-sm fw-sm">운영은 기술이 아니라 경험입니다</p>
                        <div class="no-pd-12--t">
                            <p class="no-body-xl fw-r">
                                HOUSEMAN은 단순히 스타트업처럼 시스템만을 흉내 내는 기업이 아닙니다.
                                2012년 신축·리모델링에서 출발해,
                                14년간 건물 현장을 직접 뛰며 운영해온 실전형 전문가 조직입니다. <br>
                            </p>
                            <p class="no-body-xl fw-r  no-pd-8--t">
                                운영은 단순한 IT 기술로는 결코 완성되지 않습니다.
                                주택·빌딩·기업시설·공공기관까지,
                                서울 전역 50여 곳의 건물을 안정적으로 관리하며 쌓아온
                                현장 경험과 실질적 문제 해결력이 HOUSEMAN의 진짜 경쟁력입니다.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="img-wrap">
                    <figure>
                        <img src="/resource/images/main/cont02-01.jpg" class="drop-img">
                    </figure>
                </div>
            </div>
        </div>
    </section>

    <section class="no-main--service no-pd-120--y">
        <div class="no-container-xl">
            <div class="title-wrap" <?= $aos_slow ?>>
                <h2 class="no-heading-xl font-en fw-sm">Our Services</h2>
                <p class="no-body-xl fw-r no-pd-14--t">
                    기업 공간부터 주거 건물까지, <br>
                    운영의 모든 과정을 하우스맨이 대신합니다
                </p>
            </div>

            <div class="no-pd-64--t">
                <div class="img-grid--container">
                    <ul class="img-grid">
                        <li <?= $aos_right_slow ?>>
                            <figure>
                                <img src="/resource/images/main/cont3-03.jpg">
                            </figure>
                            <div class="text-btn-wrap no-pd-24--t">
                                <h4 class="no-heading-sm fw-sm">중소형 빌딩 관리</h4>
                                <p class="no-body-lg fw-r no-pd-12--t">
                                    "하우스맨은 중개보수를 쉐어하지 않습니다." <br>
                                    그래서 더 많은 중개사가 움직이고,
                                    공실은 더 빨리 사라집니다.
                                </p>
                                <div class="btn-wrap no-pd-48--t">
                                    <a href="/pages/sv/sv-3.php">자세히 보기 <i
                                            class="fa-light fa-arrow-up-long fa-rotate-90"></i></a>
                                </div>
                            </div>
                        </li>
                        <li <?= $aos_left_slow ?>>
                            <figure>
                                <img src="/resource/images/main/cont3-04.jpg">
                            </figure>
                            <div class="text-btn-wrap no-pd-24--t">
                                <h4 class="no-heading-sm fw-sm">중소형 주택 관리</h4>
                                <p class="no-body-lg fw-r no-pd-12--t">
                                    중소형 주택 운영은 번거롭고 감정 소모도 큽니다. <br>
                                    하우스맨은 민원, 수금, 정산까지 대신 관리해 입주자 <br>
                                    만족과 건물주 수익을 동시에 책임집니다.
                                </p>
                                <div class="btn-wrap no-pd-48--t">
                                    <a href="/pages/sv/sv-4.php">자세히 보기 <i
                                            class="fa-light fa-arrow-up-long fa-rotate-90"></i></a>
                                </div>
                            </div>
                        </li>
                        <li <?= $aos_right_sslow ?>>
                            <figure>
                                <img src="/resource/images/main/cont3-01.jpg">
                            </figure>
                            <div class="text-btn-wrap no-pd-24--t">
                                <h4 class="no-heading-sm fw-sm">단기임대</h4>
                                <p class="no-body-lg fw-r no-pd-12--t">단기임대는 수익이 높지만 전략 없이 시작하면 실패합니다. <br>
                                    하우스맨은 수익성과 운영 적합성을 먼저 진단하고,<br>
                                    검증된 건물만 전략적으로 운영합니다.
                                </p>

                                <div class="btn-wrap no-pd-48--t">
                                    <a href="/pages/sv/sv-1.php">자세히 보기 <i
                                            class="fa-light fa-arrow-up-long fa-rotate-90"></i></a>
                                </div>
                            </div>
                        </li>
                        <li <?= $aos_left_sslow ?>>
                            <figure>
                                <img src="/resource/images/main/cont3-02.jpg">
                            </figure>
                            <div class="text-btn-wrap no-pd-24--t">
                                <h4 class="no-heading-sm fw-sm">중소·중견 기업 시설 관리</h4>
                                <p class="no-body-lg fw-r no-pd-12--t">
                                    시설 관리는 곧 회사의 이미지입니다. <br>
                                    하우스맨은 포르쉐 코리아 등 대형 기관에서 검증된 기준으로, <br>
                                    중소·중견 기업에도 합리한 비용의 고품질 유지관리
                                    서비스를 제공합니다.
                                </p>
                                <div class="btn-wrap no-pd-48--t">
                                    <a href="/pages/sv/sv-2.php">자세히 보기 <i
                                            class="fa-light fa-arrow-up-long fa-rotate-90"></i></a>
                                </div>
                            </div>
                        </li>

                        <li <?= $aos_right_sslow ?>>
                            <figure>
                                <img src="/resource/images/main/cont3-05.jpg">
                            </figure>
                            <div class="text-btn-wrap no-pd-24--t">
                                <h4 class="no-heading-sm fw-sm">비상주 관리사무소</h4>
                                <p class="no-body-lg fw-r no-pd-12--t">
                                    150세대 미만 공동주택도 관리가 필요합니다. <br>
                                    하우스맨은 전담 인력의 순회 관리로, <br>
                                    관리사무소 없이도 체계적인 운영을 실현합니다.
                                </p>
                                <div class="btn-wrap no-pd-48--t">
                                    <a href="/pages/sv/sv-5.php">자세히 보기 <i
                                            class="fa-light fa-arrow-up-long fa-rotate-90"></i></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </section>

    <section class="no-main--gallSlide no-pd-120--y">
        <div class="bg">
            <img src="/resource/images/icon/main-gall-bg.svg">
        </div>
        <div class="no-container-xl">
            <div class="title-wrap">
                <div class="text" <?= $aos_right_slow ?>>
                    <h2 class="no-heading-xl fw-sm">공실현황</h2>
                    <p class="no-body-xl fw-r no-pd-14--t">
                        하우스맨은 실시간 공실 정보를 기반으로 신뢰도 높은 임대 전략을 제안합니다. <br>
                        800여 부동산과의 긴밀한 네트워크를 통해 검증된 매물과 수요 데이터를 확보하고, <br>
                        공실 기간을 최소화해 건물주의 수익과 안정성 모두를 보장합니다.
                    </p>
                </div>


                <div class="btn-wrap" <?= $aos_right_slow ?>>
                    <div class="swiper-button-prev gall-prev"><i class="fa-thin fa-angle-up fa-rotate-270"></i></div>
                    <div class="swiper-button-next gall-next"><i class="fa-thin fa-angle-up fa-rotate-90"></i></div>
                </div>
            </div>
            <div class="no-pd-64--t" <?= $aos_right_slow ?>>
                <div class="swiper gall-swiper no-pd-60--top">
                    <ul class="swiper-wrapper">
                        <?php
								$boardNames = [
									"공실현황 - 일반주택",
									"공실현황 - 근생",
									"공실현황 - 단기임대"
								];

								$allLenders = [];

								foreach ($boardNames as $boardName) {
									$boardInfo = getBoardInfoByName($boardName);
									$boardNo = $boardInfo[0]['no'] ?? null;

									if ($boardNo) {
										$lenders = getBoardLimit($boardNo, 99, "");

										foreach ($lenders as $v) {
											$v['board_no'] = $boardNo;
											$allLenders[] = $v;
										}
									}
								}

								foreach ($allLenders as $k => $v) {
									$tvTitle = mb_substr($v['title'] ?? '', 0, 150, "utf-8");
									$tvBoardNo = $v['board_no'];
									$tvLink = "/pages/board/board.view.php?board_no=$tvBoardNo&no={$v['no']}&searchKeyword=" . base64_encode($searchKeyword ?? '') . "&searchColumn=" . base64_encode($searchColumn ?? '') . "&page=" . ($page ?? 1);

									// 이미지 경로 지정
									if (!empty($v['thumb_image'])) {
										$tvImgSrc = "/uploads/board/" . ltrim($v['thumb_image'], '/');
									} else {
										$tvImgSrc = "/resource/images/common/no_image.svg";
									}
							?>
                        <li class="swiper-slide">
                            <a href="<?= $tvLink ?>">
                                <figure>
                                    <img src="<?= $tvImgSrc ?>" alt="<?= htmlspecialchars($tvTitle) ?>">
                                    <div class="payment">
                                        <div class="circle">
                                            <i class="fa-solid fa-sack-dollar"></i>
                                        </div>
                                        <div class="text">
                                            <h4 class="no-body-lg fw-sm">중개수수료</h4>
                                            <p class="no-body-lg fw-r">
                                                <?= $v['extra20'] ?>
                                            </p>
                                        </div>
                                    </div>
                                </figure>
                                <div class="text no-pd-24--t">
                                    <h3 class="no-base-mainDesc fw-b"><?= htmlspecialchars($tvTitle) ?></h3>
                                    <span class="no-body-lg"><?= $v['extra1'] ?></p>
                                </div>
                            </a>
                        </li>
                        <?php } ?>
                    </ul>

                </div>
            </div>
        </div>
    </section>

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
</main>



<?php include_once $STATIC_ROOT . '/inc/layouts/footer.php'; ?>