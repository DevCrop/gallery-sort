<?php
	if ($board_no == 9) {
?>

<main class="no-sub">
    <section class="no-sub--gall no-pd-120--y">
        <div class="no-container-xl" <?= $aos_slow ?>>
            <div class="title">
                <h2 class="no-heading-lg fw-sm">공실현황</h2>
            </div>

            <div class="no-board-top no-pd-80--t">
                <div>
                    <ul class="cate_tab">
                        <li class="cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=9" class="active">단기임대</a>
                        </li>
                        <li class="cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=10">근생</a>
                        </li>
                        <li class=" cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=11">일반주택</a>
                        </li>
                    </ul>
                </div>
                <div class="no-board-search">
                    <div class="no-board-search-inp">
                        <form>
                            <div class="no-form-group">
                                <label for="search_term" class="no-form-label">
                                    <div class="no-form-search">
                                        <button type="submit" class="search_control" aria-label="search"
                                            onclick="doSearch();"><i
                                                class="fa-regular fa-magnifying-glass"></i></button>
                                        <input type="text" class="search" placeholder="검색어를 입력해주세요." id="search"
                                            name="searchKeyword">
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
                        <?php
						foreach ($arrResultSet as $k => $v) {

							// ✅ 비노출이면 건너뜀
							if (isset($v['is_visible']) && $v['is_visible'] === 'N') continue;

							// Get and truncate title and contents
							$title = iconv_substr($v['title'], 0, 2000, "utf-8");
							$contents = strip_tags($v['contents']);
							$contents = iconv_substr($contents, 0, 500, "utf-8");

							// Generate link with board_no and encoded parameters
							$link = "./board.view.php?board_no=$board_no&no={$v['no']}&searchKeyword=" . base64_encode($searchKeyword) . "&searchColumn=" . base64_encode($searchColumn) . "&page=$page&category_no=$category_no";

							// Determine image source
							$imgSrc = "";
							if (!empty($v['thumb_image'])) {
								$imgSrc = $UPLOAD_WDIR_BOARD . "/" . $v['thumb_image'];
							} else {
								$imgSrcArray = getImageTag($v['contents'], "src");
								$imgSrc = $imgSrcArray[0] ?? '';
							}

							// Set target and link if direct_url is present
							$target = !empty($v['direct_url']) ? '_blank' : '_self';
							$link = !empty($v['direct_url']) ? $v['direct_url'] : $link;
						?>
                        <li>
                            <a href="<?= $link ?>" class="grid-col-2">
                                <figure>
                                    <?php $isContractComplete = (trim($v['extra7']) === '계약완료'); ?>
                                    <img src="<?= $imgSrc ?>" alt="<?= $title ?>" <?= $imgData ?>
                                        class="<?= $isContractComplete ? 'grayscale2' : '' ?>">

                                    <?php
											$price = (int) str_replace([",", "원", " "], "", $v['extra20']);
											$priceClass = $price >= 300000 ? 'price-over-300k' : '';
										?>

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


                                <div class="info-wrap">
                                    <span class="cate no-body-md">
                                        <?= $v['extra1'] ?>
                                    </span>
                                    <div class="title">
                                        <h3 class="no-heading-md fw-sm"><?= $title ?></h3>
                                        <p class="no-body-lg"><?= $v['extra2'] ?></p>
                                    </div>
                                    <div class="desc no-pd-32--t">
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-location-dot"></i>주소</dt>
                                            <dd><?= $v['extra3'] ?></dd>
                                        </dl>


                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-sack-dollar"></i>예치금</dt>
                                            <dd><?= $v['extra4'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-calendar"></i>월세</dt>
                                            <dd><?= $v['extra5'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-square-plus"></i>관리비</dt>
                                            <dd><?= $v['extra6'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-tags"></i>불가사항</dt>
                                            <dd><?= $v['extra21'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-file-lines"></i>계약유무</dt>
                                            <dd><?= $v['extra7'] ?></dd>
                                        </dl>
                                    </div>

                                </div>
                            </a>
                        </li>
                        <?php
						$rnumber--;
						}
					?>
                    </ul>
                </div>
            </div>

            <?php include_once $STATIC_ROOT."/pages/board/components/pagination.php"; ?>
        </div>

    </section>
</main>

<?php
	}
?>

<?php
	if ($board_no == 10) {
?>

<main class="no-sub">
    <section class="no-sub--gall no-pd-120--y">
        <div class="no-container-xl" <?= $aos_slow ?>>
            <div class="title">
                <h2 class="no-heading-lg fw-sm">공실현황</h2>
            </div>

            <div class="no-board-top no-pd-80--t">
                <div>
                    <ul class="cate_tab">
                        <li class="cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=9">단기임대</a>
                        </li>
                        <li class="cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=10" class="active">근생</a>
                        </li>
                        <li class=" cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=11">일반주택</a>
                        </li>
                    </ul>
                </div>
                <div class="no-board-search">
                    <div class="no-board-search-inp">
                        <form>
                            <div class="no-form-group">
                                <label for="search_term" class="no-form-label">
                                    <div class="no-form-search">
                                        <button type="submit" class="search_control" aria-label="search"
                                            onclick="doSearch();"><i
                                                class="fa-regular fa-magnifying-glass"></i></button>
                                        <input type="text" class="search" placeholder="검색어를 입력해주세요." id="search"
                                            name="searchKeyword">
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
                        <?php
						foreach ($arrResultSet as $k => $v) {

							// ✅ 비노출(N)인 게시글은 출력하지 않음
							if (isset($v['is_visible']) && $v['is_visible'] === 'N') {
								continue;
							}

							// Get and truncate title and contents
							$title = iconv_substr($v['title'], 0, 2000, "utf-8");
							$contents = strip_tags($v['contents']);
							$contents = iconv_substr($contents, 0, 500, "utf-8");
							
							// Generate link with board_no and encoded parameters
							$link = "./board.view.php?board_no=$board_no&no={$v['no']}&searchKeyword=" . base64_encode($searchKeyword) . "&searchColumn=" . base64_encode($searchColumn) . "&page=$page&category_no=$category_no";
							
							// Determine image source
							$imgSrc = "";
							if (!empty($v['thumb_image'])) {
								$imgSrc = $UPLOAD_WDIR_BOARD . "/" . $v['thumb_image'];
							} else {
								$imgSrcArray = getImageTag($v['contents'], "src");
								$imgSrc = $imgSrcArray[0] ?? '';
							}

							// Set target and link if direct_url is present
							$target = !empty($v['direct_url']) ? '_blank' : '_self';
							$link = !empty($v['direct_url']) ? $v['direct_url'] : $link;

							// Set image data attributes if not direct_url
							$imgData = !empty($v['direct_url']) ? '' : 'data-pswp-width="1600" data-pswp-height="1024" class="my-image"';
						?>
                        <li>
                            <a href="<?= $link ?>" class="grid-col-2">
                                <figure>
                                    <?php $isContractComplete = (trim($v['extra7']) === '계약완료'); ?>
                                    <img src="<?= $imgSrc ?>" alt="<?= $title ?>" <?= $imgData ?>
                                        class="<?= $isContractComplete ? 'grayscale2' : '' ?>">
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

                                <div class="info-wrap">
                                    <span class="cate no-body-md">
                                        <?= $v['extra1'] ?>
                                    </span>
                                    <div class="title">
                                        <h3 class="no-heading-md fw-sm"><?= $title ?></h3>
                                        <p class="no-body-lg"><?= $v['extra2'] ?></p>
                                    </div>
                                    <div class="desc no-pd-32--t">
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-location-dot"></i>주소</dt>
                                            <dd><?= $v['extra3'] ?></dd>
                                        </dl>


                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-sack-dollar"></i>보증금</dt>
                                            <dd><?= $v['extra4'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-calendar"></i>월세</dt>
                                            <dd><?= $v['extra5'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-square-plus"></i>관리비</dt>
                                            <dd><?= $v['extra6'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-tags"></i>불가사항</dt>
                                            <dd><?= $v['extra21'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-file-lines"></i>계약유무</dt>
                                            <dd><?= $v['extra7'] ?></dd>
                                        </dl>
                                    </div>

                                </div>
                            </a>
                        </li>
                        <?php
						$rnumber--;
						}
					?>
                    </ul>
                </div>
            </div>

            <?php include_once $STATIC_ROOT."/pages/board/components/pagination.php"; ?>
        </div>

    </section>
</main>

<?php
	}
?>


<?php
	if ($board_no == 11) {
?>

<main class="no-sub">
    <section class="no-sub--gall no-pd-120--y">
        <div class="no-container-xl" <?= $aos_slow ?>>
            <div class="title">
                <h2 class="no-heading-lg fw-sm">공실현황</h2>
            </div>

            <div class="no-board-top no-pd-80--t">
                <div>
                    <ul class="cate_tab">
                        <li class="cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=9">단기임대</a>
                        </li>
                        <li class="cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=10">근생</a>
                        </li>
                        <li class=" cate_tab--item">
                            <a href="/pages/board/board.list.php?board_no=11" class="active">일반주택</a>
                        </li>
                    </ul>
                </div>
                <div class="no-board-search">
                    <div class="no-board-search-inp">
                        <form>
                            <div class="no-form-group">
                                <label for="search_term" class="no-form-label">
                                    <div class="no-form-search">
                                        <button type="submit" class="search_control" aria-label="search"
                                            onclick="doSearch();"><i
                                                class="fa-regular fa-magnifying-glass"></i></button>
                                        <input type="text" class="search" placeholder="검색어를 입력해주세요." id="search"
                                            name="searchKeyword">
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
                        <?php
						foreach ($arrResultSet as $k => $v) {

							// ✅ 비노출인 경우 출력 안 함
							if (isset($v['is_visible']) && $v['is_visible'] === 'N') continue;

							// Get and truncate title and contents
							$title = iconv_substr($v['title'], 0, 2000, "utf-8");
							$contents = strip_tags($v['contents']);
							$contents = iconv_substr($contents, 0, 500, "utf-8");
							
							// Generate link with board_no and encoded parameters
							$link = "./board.view.php?board_no=$board_no&no={$v['no']}&searchKeyword=" . base64_encode($searchKeyword) . "&searchColumn=" . base64_encode($searchColumn) . "&page=$page&category_no=$category_no";
							
							// Determine image source
							$imgSrc = "";
							if (!empty($v['thumb_image'])) {
								$imgSrc = $UPLOAD_WDIR_BOARD . "/" . $v['thumb_image'];
							} else {
								$imgSrcArray = getImageTag($v['contents'], "src");
								$imgSrc = $imgSrcArray[0] ?? '';
							}

							// Set target and link if direct_url is present
							$target = !empty($v['direct_url']) ? '_blank' : '_self';
							$link = !empty($v['direct_url']) ? $v['direct_url'] : $link;

							// Set image data attributes if not direct_url
							$imgData = !empty($v['direct_url']) ? '' : 'data-pswp-width="1600" data-pswp-height="1024" class="my-image"';
						?>
                        <li>
                            <a href="<?= $link ?>" class="grid-col-2">
                                <figure>
                                    <?php $isContractComplete = (trim($v['extra7']) === '계약완료'); ?>
                                    <img src="<?= $imgSrc ?>" alt="<?= $title ?>" <?= $imgData ?>
                                        class="<?= $isContractComplete ? 'grayscale2' : '' ?>">
                                    <div class="payment">
                                        <h4 class="no-body-lg fw-sm">중개수수료</h4>
                                        <p class="no-body-lg fw-r">
                                            <?= $v['extra20'] ?>
                                        </p>
                                    </div>
                                </figure>

                                <div class="info-wrap">
                                    <span class="cate no-body-md">
                                        <?= $v['extra1'] ?>
                                    </span>
                                    <div class="title">
                                        <h3 class="no-heading-md fw-sm"><?= $title ?></h3>
                                        <p class="no-body-lg"><?= $v['extra2'] ?></p>
                                    </div>
                                    <div class="desc no-pd-32--t">
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-location-dot"></i>주소</dt>
                                            <dd><?= $v['extra3'] ?></dd>
                                        </dl>


                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-sack-dollar"></i>보증금</dt>
                                            <dd><?= $v['extra4'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-calendar"></i>월세</dt>
                                            <dd><?= $v['extra5'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-square-plus"></i>관리비</dt>
                                            <dd><?= $v['extra6'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-tags"></i>불가사항</dt>
                                            <dd><?= $v['extra21'] ?></dd>
                                        </dl>
                                        <dl>
                                            <dt><i class="fa-solid gall-icon fa-file-lines"></i>계약유무</dt>
                                            <dd><?= $v['extra7'] ?></dd>
                                        </dl>
                                    </div>

                                </div>
                            </a>
                        </li>
                        <?php
						$rnumber--;
						}
					?>
                    </ul>
                </div>
            </div>

            <?php include_once $STATIC_ROOT."/pages/board/components/pagination.php"; ?>
        </div>

    </section>
</main>

<?php
	}
?>