<?php

// 배너 위치 설정
$arr_banner_loc = [
    'site_main' => '메인 상단이미지',
	'site_view'  => '시설 이미지',	
	'site_hospital'  => '입원실 이미지',
];

// 사이트 데이터 타겟 설정
$siteDataTarget = [
    'subtitle' => '임시제목',
];

// 창 열기 방식 설정
$_targetArr = [
    '_blank' => '새창',
    '_self' => '같은창',
];

// 게시판 타입 설정
$board_type = [
    'bbs' => '게시판',
    'gal' => '갤러리',

    // 홍보센터
    'new' => '뉴스',
    'not' => '공지사항',
];

// 허용된 파일 확장자
$board_file_allow = ['jpg', 'jpeg', 'png', 'gif', 'zip', 'xls', 'xlsx', 'ppt', 'pptx', 'doc', 'docx', 'pdf', 'hwp', 'mp4', 'mov', 'avi', 'txt', 'webp'];
$employment_file_allow = ['zip', 'xls', 'xlsx', 'ppt', 'pptx', 'doc', 'docx', 'pdf', 'hwp'];
$admission_file_allow = ['jpg', 'jpeg', 'png', 'gif'];

$extra_fields = implode(", ", array_map(function($i) {
    return "a.extra{$i}";
}, range(1, 21)));

$extra_match_fields = implode(", ", array_map(function($i) {
    return "a.extra_match_field{$i}";
}, range(1, 21)));

?>