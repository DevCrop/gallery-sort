
<?php
if ($board_no == 10) {
?>
<main class="no-sub">
    <section class="no-sub-notice no-pd-128--y">
        <div class="no-container-xl no-sub-notice__inner">
            <div class="sub-title">
                <h2 class="no-heading-lg" <?= $aos_slow ?>>공지사항</h2>
            </div>


            <div class="no-board" <?= $aos_sslow ?>>
                <div class="no-board-top no-pd-80--t">
                    <div class="no-board-total">
                        <?php
                        $totalCount = isset($arrResultSet) ? count($arrResultSet) : 0;
                        echo "총 <span>{$totalCount}</span>건";
                        ?>
                    </div>
                    <div class="no-board-search">
                        <div class="no-board-search-inp">
                            <form method="GET" action="">
                                <div class="no-form-group">
                                    <label for="search_term" class="no-form-label">
                                        <div class="no-form-search">
                                            <button type="submit" class="search_control" aria-label="search" onclick="doSearch();">
                                                <i class="fa-regular fa-magnifying-glass"></i>
                                            </button>
                                            <input type="search" class="search" placeholder="검색어를 입력해주세요." id="search" name="searchKeyword">
                                        </div>
                                    </label>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="no-skin-list no-pd-64--t" <?= $aos_sslow ?>>
                    <div class="no-skin-list-table-container">
                        <table class="no-skin-list-table">
                            <colgroup>
                                <col style="width: 10%;">
                                <col style="width: 60%">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                            </colgroup>
                            <thead>
                                <tr class="no-body-lg --fw-semibold">
                                    <th>번호</th>
                                    <th class="--tal">제목</th>
                                    <th>조회수</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
                       <?php
					// Reverse the array to ensure the latest posts appear first

					foreach ($arrResultSet as $k => $v) {
						// Your existing code here
						$title = iconv_substr($v['title'], 0, 2000, "utf-8");
						$contents = strip_tags($v['contents']);
						$contents = iconv_substr($contents, 0, 500, "utf-8");
						
						// Generate link with board_no and encoded parameters
						$link = "./board.view.php?board_no=$board_no&no={$v['no']}&searchKeyword=" . base64_encode($searchKeyword) . "&searchColumn=" . base64_encode($searchColumn) . "&page=$page&category_no=$category_no";
						
						// Determine image source
						$imgSrc = "";
						if ($v['thumb_image']) {
							$imgSrc = $UPLOAD_WDIR_BOARD . "/" . $v['thumb_image'];
						} else {
					
						}

						// Set target and link if direct_url is present
						$target = $v['direct_url'] ? '_blank' : '_self';
						$link = $v['direct_url'] ? $v['direct_url'] : $link;

						// Set image data attributes if not direct_url
						$imgData = 'data-pswp-width="1600" data-pswp-height="1024" class="my-image"';
						if ($v['direct_url']) {
							$imgData = '';
						}

					?>
                                    <tr>
                                        <td>
                                            <span class="no-clr-text-label"><?=$rnumber?></span>
                                            <!-- <span class="no-notice-megaphone">
                                            <i class="fa-solid fa-megaphone"></i>
                                        </span> -->
                                        </td>
                                        <td class="--tal --full">
                               		<a href="<?= $link ?>" class="no-clr-text-title no-body-lg --fw-semibold">
                                                <!-- <div class="no-skin-new">
                                                <span>N</span>
                                            </div> -->
                                                <strong>
                                                   			<?= $title?>
                                                </strong>
                                            </a>
                                        </td>
                                        <td class="no-skin-list-table__label">
                                            <span class="no-clr-text-label" data-label="조회수">
                                              	<?= $v['read_cnt']?>
                                            </span>
                                        </td>
                                        <td class="no-skin-list-table__label">
                                            <span class="no-clr-text-label" data-label="등록일">
                                               	<?= date("Y.m.d", strtotime($v['regdate'])) ?>
                                            </span>
                                        </td>
                                    </tr>
                               	<?php
										$rnumber--;
									}
									?>
                            </tbody>
                        </table>
                    </div>
                </div>
				
				<div class="no-pd-64--t">
					    <?php include_once $STATIC_ROOT . "/pages/board/components/pagination.php"; ?>
				</div>
        
            </div>
        </div>
        </div>
    </section>
</main>


<?php
}
?>
