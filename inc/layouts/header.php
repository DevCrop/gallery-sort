</head>

<body class="">
    <header class="no-header" id="header">
        <div class="no-header__inner no-container-2xl">

            <h1 class="no-header__inner--logo">
                <a href="/">
                    <img src="/resource/images/logo/logo-edit-w.svg" class="logo-w">
                    <img src="/resource/images/logo/logo-edit-c.svg" class="logo-c">
                </a>
            </h1>


            <nav class="no-header__inner--menu" data-lenis-prevent="">
                <ul class="no-header__gnb">
                    <?php foreach ($MENU_ITEMS as $di => $depthItem):
                        $depth_active = $depthItem['isActive'] ? 'active' : '';
                    ?>
                        <li class="no-header__gnb--item <?= $depth_active ?>">
                            <a href="<?= $depthItem['path'] ?>"
                                class="no-header__gnb--link no-body-lg <?= $depth_active ?> gnb-animated-text">
                                <span class="text-top  fw-sm"
                                    data-label="<?= $depthItem['title'] ?>"><?= $depthItem['title'] ?></span>
                            </a>


                            <?php if (array_key_exists('pages', $depthItem) && count($depthItem['pages']) > 0) : ?>
                                <ul class="no-header__lnb">
                                    <?php foreach ($depthItem['pages'] as $pi => $pageitem):
                                        $pageitem_active = $pageitem['isActive'] ? 'active' : '';
                                    ?>
                                        <li class="no-header__lnb--item <?= $pageitem_active ?>">
                                            <a href="<?= $pageitem['path'] ?>" class="no-header__lnb--link no-body-md">
                                                <?= $pageitem['title'] ?>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            <?php endif; ?>
                        </li>
                    <?php endforeach; ?>
                    <li class="no-header__gnb--item">
                        <a href="https://blog.naver.com/houseman842" target="__blank"  class="no-header__gnb--link no-body-lg  fw-sm">
                            관리사례
                        </a>
                    </li>
                </ul>
            </nav>

            <div class="inquire-btn">
                <a href="tel:1544-4150" class="fw-m no-body-md"><i class="fa-solid fa-phone"></i>1544-4150</a>
            </div>

            <button type="button" class="no-mobile_toggle_btn">
                <span class="no-mobile_toggle_btn--line"></span>
                <span class="no-mobile_toggle_btn--line"></span>
                <span class="no-mobile_toggle_btn--line"></span>
            </button>

            <div class="no-header-m-div">
                <nav class="no-header-m-div__inner" data-lenis-prevent="">
                    <ul class="no-header__gnb-m">
                        <?php foreach ($MENU_ITEMS as $di => $depthItem):
                            $depth_active = $depthItem['isActive'] ? 'active' : '';
                            $page_count = isset($depthItem['pages']) ? count($depthItem['pages']) : 0; // 페이지 개수 확인
                        ?>
                            <li class="no-header__gnb-m--item <?= $depth_active ?>">
                                <a href="<?= $depthItem['path'] ?>" class="no-header__gnb-m--link no-heading-xs"
                                    data-pages="<?= $page_count ?>">
                                    <?= $depthItem['title'] ?>
                                    <?php if ($page_count > 1): ?>
                                        <i class="fa-regular fa-angle-up fa-rotate-180"></i>
                                    <?php endif; ?>
                                </a>
                                <?php if ($page_count > 0): ?>
                                    <ul class="no-header-m__lnb">
                                        <?php foreach ($depthItem['pages'] as $pi => $pageitem):
                                            $pageitem_active = $pageitem['isActive'] ? 'active' : '';
                                        ?>
                                            <li class="no-header-m__lnb--item <?= $pageitem_active ?>">
                                                <a href="<?= $pageitem['path'] ?>" class="no-header-m__lnb--link">
                                                    <?= $pageitem['title'] ?>
                                                </a>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                <?php endif; ?>
                            </li>
                        <?php endforeach; ?>

                        <li class="no-header__gnb-m--item">
                            <a href="https://blog.naver.com/houseman842" target="__blank" class="no-header__gnb-m--link no-heading-xs">
                                관리사례
                            </a>
                        </li>

                    </ul>
                </nav>

            </div>
        </div>
    </header>