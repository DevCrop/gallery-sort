<?php 
	$imgSrc = $UPLOAD_WDIR_BOARD . '/' . $data['thumb_image'];
?>

<div class="no-skin">

<main class="no-sub">
    <section class="no-sub--gall">
        <div>
            <div class="gallery-cont--view no-pd-120--b">
                <ul>
                    <li class="grid-col-2">
                        <figure>
                          <img src="<?=$imgSrc?>" alt="<?=$data['title']?>" class="view-pd">
						<div class="payment">
							<div class="circle">
							<i class="fa-solid fa-sack-dollar"></i>
							</div>
							<div class="text">
								<h4 class="no-body-lg fw-sm">중개수수료</h4>
								<p class="no-body-lg fw-r">
									<?= $data['extra20'] ?>
								</p>
							</div>
						</div>
                        </figure>

                        <div class="info-wrap">
                            <span class="cate no-body-md">
                                <?= $data['extra1']?>
                            </span>
                            <div class="title">
                                <h3 class="no-heading-md fw-sm"><?= $data['title']?></h3>
                                <p class="no-body-lg"><?= $data['extra2']?></p>
                            </div>
                            <div class="desc no-pd-32--t">
                                <dl>
                                    <dt><i class="fa-solid fa-location-dot"></i>주소</dt>
                                    <dd><?= $data['extra3']?></dd>
                                </dl>


                                <dl>
                                    <dt><i class="fa-solid fa-sack-dollar"></i>보증금</dt>
                                    <dd><?= $data['extra4']?></dd>
                                </dl>
                                <dl>
                                    <dt><i class="fa-solid fa-calendar"></i>월세</dt>
                                    <dd><?= $data['extra5']?></dd>
                                </dl>
                                <dl>
                                    <dt><i class="fa-solid fa-square-plus"></i>관리비</dt>
                                    <dd><?= $data['extra6']?></dd>
                                </dl>
                                <dl>
                                    <dt><i class="fa-solid fa-tags"></i>불가사항</dt>
                                    <dd><?= $data['extra21']?></dd>
                                </dl>
                                <dl>
                                    <dt><i class="fa-solid fa-file-lines"></i>계약유무</dt>
                                    <dd><?= $data['extra7']?></dd>
                                </dl>
                                <div class="btn-wrap no-pd-24--t">
                                    <div class="tel">
                                        <a href="tel:1544-4150" class="no-body-lg fw-sm p-color"><i class="fa-solid fa-phone"></i>전화문의</a>
                                    </div>
                                    <div class="list">
										<a href="/pages/board/board.list.php?board_no=9" class="no-body-lg fw-sm g-color">목록</a>
                                    </div>
                                </div>
								<div class="download">
									<?php if (!empty($data['file_attach_1'])): ?>
										<a href="/inc/lib/board.file.download.php?no=<?= $data['no'] ?>&fld=attach1"
										   class="no-body-md fw-m"
										   download>
											<i class="fa-solid fa-arrow-down-to-bracket"></i> 계약서 다운로드
										</a>
									<?php else: ?>
										<span class="no-body-md fw-m text-muted">첨부된 계약서가 없습니다.</span>
									<?php endif; ?>
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
						<?php
							for ($i = 2; $i <= 10; $i++) {
								$file = $data["file_attach_$i"] ?? '';
								if ($file) {
									$imgPath = $UPLOAD_WDIR_BOARD . '/' . $file;
									echo '
									<li class="swiper-slide">
										<figure>
											<img src="' . $imgPath . '" alt="첨부 이미지 ' . $i . '">
										</figure>
									</li>';
								}
							}
						?>
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

							<li class="detail-info grid-col-3">
								<dl>
									<dt class="fw-sm">방구조</dt>
									<dd class="fw-r"><?= $data['extra8'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">룸</dt>
									<dd class="fw-r"><?= $data['extra9'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">화장실</dt>
									<dd class="fw-r"><?= $data['extra10'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">수도</dt>
									<dd class="fw-r"><?= $data['extra11'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">인터넷/TV</dt>
									<dd class="fw-r"><?= $data['extra12'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">전기/가스</dt>
									<dd class="fw-r"><?= $data['extra13'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">주차</dt>
									<dd class="fw-r"><?= $data['extra14'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">엘리베이터</dt>
									<dd class="fw-r"><?= $data['extra15'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">옵션</dt>
									<dd class="fw-r"><?= $data['extra16'] ?: '-' ?></dd>
								</dl>
								<dl>
									<dt class="fw-sm">퇴실청소비</dt>
									<dd class="fw-r"><?= $data['extra17'] ?: '-' ?></dd>
								</dl>
							</li>

							<li>
								<div class="notice ">
									<h4 class="no-body-xl fw-sm no-pd-12--b">특이사항</h4>
									<div class="content no-pd-24--y">
										<p class="no-body-lg fw-r">
												<?= $data['extra18']?>
										</p>
									</div>
								</div>
							</li>

							<li>
								<div class="notice ">
									<h4 class="no-body-xl fw-sm no-pd-12--b">상세설명</h4>
									<div class="content no-pd-24--y">
										<p class="no-body-lg fw-r">
												<?= strip_tags(htmlspecialchars_decode($data['contents'])) ?>

										</p>
									</div>
								</div>
							</li>

                            <li class="map">
                                <a href="<?= $data['extra19']?>" class="no-body-md fw-m map-btn" target="__blank">
                                    <i class="fa-solid fa-map-location-dot"></i>네이버지도 보기
                                </a>
                            </li>



							<li class="map-iframe">
								<iframe 
								  src="<?= preg_replace('/^http:/', 'https:', $data['extra19']) ?>" 
								  width="100%" 
								  height="400" 
								  style="border:0; min-height: 300px;"  
								  allowfullscreen>
								</iframe>
							</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </section>
</main>

<script>
document.addEventListener("DOMContentLoaded", function () {
  if (window.innerWidth <= 544) {
    var mapIframe = document.querySelector('.no-sub--gall .map-info-wrap ul li.map-iframe');
    if (mapIframe) {
      mapIframe.remove();
    }
  }
});
</script>




</div>