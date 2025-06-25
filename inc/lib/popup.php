<?php

// "오늘 하루 그만 보기" 쿠키 확인
$popupClosed = isset($_COOKIE['popupClosed']) && $_COOKIE['popupClosed'] === 'true';
$db = DB::getInstance(); 

if (!$popupClosed) {
    // 데이터베이스에서 팝업 데이터 가져오기
    $sql = "SELECT * FROM nb_popup WHERE p_view = 'Y' ORDER BY p_idx ASC"; // 필요한 조건에 맞게 수정
	$stmt = $db->query($sql);
	$popups = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
    if (!empty($popups)) {
        ?>
        <div class="main-popup-wrap">
            <div class="main-popup">
                <div class="main-popup-top">
                    <ul class="swiper-component">
                        <li class="swiper-button-prev arrow">
                            <i class="fa-duotone fa-thin fa-angle-up fa-rotate-270" style="--fa-primary-color: #ffffff; --fa-secondary-color: #ffffff; --fa-secondary-opacity: 1;"></i>
                        </li>
                        <li class="swiper-button-next arrow">
                            <i class="fa-duotone fa-thin fa-angle-up fa-rotate-90" style="--fa-primary-color: #ffffff; --fa-secondary-color: #ffffff; --fa-secondary-opacity: 1;"></i>
                        </li>
                    </ul>
                </div>

                <div class="main-popup-mid main-popup-slide">
                    <ul class="swiper-wrapper">
                        <?php foreach ($popups as $popup): ?>
                            <li class="swiper-slide">
                                <figure class="img-box">
                                    <a href="<?php echo htmlspecialchars($popup['p_link'], ENT_QUOTES, 'UTF-8'); ?>" target="<?=$popup['p_target'] === '_none' ? '_self' : '_blank'?>">
                                        <img src="<?= htmlspecialchars('/uploads/popup/'.$popup['p_img'], ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars($popup['p_title'], ENT_QUOTES, 'UTF-8'); ?>">
                                    </a>
                                </figure>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </div>

                <div class="main-popup-bottom">
                    <label for="closeCheck" id="toggleLabel">
					  <input type="checkbox" id="closeCheck">
					  <img src="/resource/images/icon/popupcheck.svg" alt="popup check icon" id="popupImage">
					  <img src="/resource/images/icon/popupcheck-on.svg" alt="popup check icon on" id="popupImage-on">
					  오늘 하루 그만 보기
					</label>

                    <button type="button" class="popup-close">
                        닫기
                        <i class="fa-light fa-xmark" style="color: #ffffff;"></i>
                    </button>
                </div>
            </div>

            <div class="main-popup-bg"></div>
        </div>

        <script>

            // 팝업 닫기 동작
            const closeButton = document.querySelector(".popup-close");
            const popupWrap = document.querySelector(".main-popup-wrap");
            closeButton.addEventListener("click", () => {
                popupWrap.style.display = "none";

                // "오늘 하루 그만 보기" 처리
                const closeCheck = document.querySelector("#closeCheck").checked;
                if (closeCheck) {
                    const today = new Date();
                    const expires = new Date(today.setHours(23, 59, 59, 999));
                    document.cookie = `popupClosed=true; expires=${expires.toUTCString()}; path=/`;
                }
            });
        </script>
        <?php
    }
}
?>
