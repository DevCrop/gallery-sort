<?php

$_path_str = dirname(__FILE__);
$CACHE_MODIFIER = date('YmdHis');
$NO_IS_SUBDIR = "";
$NO_SITE_UNIQUE_KEY = "HOUSEM";

if (session_status() === PHP_SESSION_NONE) {
    session_cache_limiter("private");
    ini_set("session.cookie_lifetime", 86400);
    ini_set("session.cache_expire", 86400);
    ini_set("session.gc_maxlifetime", 86400);
    session_start();
}

header("Pragma: no-cache");
header("Content-Type: text/html; charset=utf-8");


$NO_CURRENT_URL = $_SERVER['HTTP_HOST'] ?? '';
$NO_MAKE_KEY = hash("sha256", $NO_CURRENT_URL . ($NO_SITE_UNIQUE_KEY ?? ''));


/*
// https일경우 주석해제
if(!isset($_SERVER["HTTPS"])) {
	header('Location: https://'.$_SERVER["HTTP_HOST"].$_SERVER['REQUEST_URI']);
}
*/

error_reporting(E_ALL & ~(E_NOTICE | E_USER_NOTICE | E_WARNING | E_COMPILE_WARNING | E_CORE_WARNING | E_USER_WARNING | E_DEPRECATED | E_USER_DEPRECATED));
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$EX_FILENAME = explode("/", $_SERVER['SCRIPT_FILENAME']);
$CURR_FILENAME = $EX_FILENAME[(sizeof($EX_FILENAME) - 1)];
$pathParts = explode('/', dirname($_SERVER['SCRIPT_NAME']));
$END_FILENAME = end($pathParts);


$PHP_SELF = $_SERVER['PHP_SELF'];



$MAX_SERVER_UPLOAD_SIZE = (ini_get('upload_max_filesize') ? ini_get('upload_max_filesize') : '���������뷮');


$BOARD_DEFAULT_LIST_SIZE = 20;
$BOARD_DEFULAT_BLOCK_SIZE = 10;


$NO_EXTRA_FIELDS_COUNT = 15;


$UPLOAD_DIR_BASE                        = $_SERVER['DOCUMENT_ROOT'] . $NO_IS_SUBDIR .  "/uploads";
$UPLOAD_WDIR_BASE                        = $NO_IS_SUBDIR . "/uploads";

$UPLOAD_DIR_BANNER                    = $UPLOAD_DIR_BASE . "/banner";
$UPLOAD_WDIR_BANNER                    = $UPLOAD_WDIR_BASE . "/banner";

$UPLOAD_DIR_POPUP                        = $UPLOAD_DIR_BASE . "/popup";
$UPLOAD_WDIR_POPUP                    = $UPLOAD_WDIR_BASE . "/popup";

$UPLOAD_DIR_BOARD                        = $UPLOAD_DIR_BASE . "/board";
$UPLOAD_WDIR_BOARD                    = $UPLOAD_WDIR_BASE . "/board";

$UPLOAD_SITEINFO_DIR_LOGO        = $UPLOAD_DIR_BASE . "/logo";
$UPLOAD_SITEINFO_WDIR_LOGO        = $UPLOAD_WDIR_BASE . "/logo";

$UPLOAD_META_DIR                        = $UPLOAD_DIR_BASE . "/meta";
$UPLOAD_META_WDIR                        = $UPLOAD_WDIR_BASE . "/meta";

$UPLOAD_DIR_EMPLOYMENT                        = $UPLOAD_DIR_BASE . "/employment";
$UPLOAD_WDIR_EMPLOYMENT                    = $UPLOAD_WDIR_BASE . "/employment";

$UPLOAD_DIR_ADMISSION                        = $UPLOAD_DIR_BASE . "/admission";
$UPLOAD_WDIR_ADMISSION                    = $UPLOAD_WDIR_BASE . "/admission";


$NO_ADMIN_GNB_BOARD_OPEN = true;
$NO_ADMIN_GNB_DESIGN_OPEN = true;
$NO_ADMIN_GNB_REQUEST_OPEN = true;
$NO_ADMIN_GNB_SMS_OPEN = false;
$NO_ADMIN_GNB_SETTING_OPEN = true;
$NO_ADMIN_GNB_LOG_OPEN = true;
$NO_ADMIN_GNB_MEMBER_OPEN = false;
$NO_ADMIN_LNB_BOARD_MENU_OPEN = false;
$NO_ADMIN_LNB_BOARD_MENU_ROLE_OPEN = false;



$devIArrIP = array("220.72.73.182", "125.128.228.224", "1.228.9.177");


if (in_array($_SERVER['REMOTE_ADDR'] ?? '', $devIArrIP ?? [])) {
    $NO_ADMIN_LNB_BOARD_MENU_OPEN = true;
    $NO_ADMIN_LNB_BOARD_MENU_ROLE_OPEN = true;
    $NO_ADMIN_GNB_MEMBER_OPEN = true;
}

/*
nb_admin
nb_siteinfo

nb_board
nb_board_manage
nb_board_lev_manage

nb_banner
nb_popup
nb_request

nb_counter
nb_counter_config
nb_counter_data
nb_counter_route


nb_member
nb_member_level
*/



$NO_USR_NO = $_SESSION['no_usr_no'] ?? 0;
$NO_USR_ID = $_SESSION['no_usr_id'] ?? '';
$NO_USR_NAME = $_SESSION['no_usr_name'] ?? '';
$NO_USR_LEV = $_SESSION['no_usr_lev'] ?? 0;

$NO_ADM_NO = $_SESSION['no_adm_login_no'] ?? 0;
$NO_ADM_ID = $_SESSION['no_adm_login_uid'] ?? '';
$NO_ADM_NAME = $_SESSION['no_adm_login_uname'] ?? '';


$NO_USR_SESSION_ID = session_id();
$NO_USR_SESSION_ID_COOKIE = $_COOKIE['cookie_session_id'] ?? "";

if ($NO_USR_SESSION_ID_COOKIE)
    $NO_USR_SESSION_ID = $NO_USR_SESSION_ID_COOKIE;

spl_autoload_register(function ($class) {
    $classPath = __DIR__ . '/classes/' . str_replace('\\', '/', $class) . '.php';

    if (file_exists($classPath)) {
        require_once $classPath;
    }
});


include_once $_path_str . '/PasswordHashClass.php';
include_once $_path_str . '/db.php';
include_once $_path_str . '/func.php';
include_once $_path_str . '/board.inc.php';
include_once $_path_str . '/board.class.php';
include_once $_path_str . '/inc.php';
include_once $_path_str . '/cache.inc.php';

include_once $_path_str . '/site.info.php';

include_once $_path_str . '/var.php';
include_once $_path_str . '/license.php';
include_once $_path_str . '/StringHelper.php';
include_once $_path_str . '/SummerNote.php';


if (strpos(dirname($_SERVER['SCRIPT_NAME']), "/admin/") !== false) {
} else {
    include_once $_path_str . '/counter.main.php';
}



if (!in_array($NO_MAKE_KEY, Lisence::getAll())) {
    echo "허용되지 않은 라이센스입니다.";
    exit;
}


include_once $_path_str . '/menu/menu.init.php';