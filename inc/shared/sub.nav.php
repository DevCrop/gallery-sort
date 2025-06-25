<!-- sub nav -->
<section class="no-sub-nav-menu">
    <div class="no-container-xl">
        <ul class="no-sub-nav-menu__list">
            <?php foreach ($CUR_PAGE_LIST[0]['pages'] as $v) :
                $is_active = $v['isActive'] ? 'active' : '';
            ?>
                <li class="no-sub-nav-menu__list--item">
                    <a href="<?= $v['path'] ?>" class="<?= $is_active ?> no-body-md fw-m"><?= $v['title'] ?></a>
                </li>
            <?php endforeach; ?>
        </ul>
    </div>
</section>