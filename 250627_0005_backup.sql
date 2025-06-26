-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- 호스트: db:3306
-- 생성 시간: 25-06-26 15:04
-- 서버 버전: 8.0.42
-- PHP 버전: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `nineonelabs`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_admin`
--

CREATE TABLE `nb_admin` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `uid` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '아이디',
  `upwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '패스워드',
  `uname` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '관리자명',
  `active_status` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '사용여부'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='관리자 계정 관리';

--
-- 테이블의 덤프 데이터 `nb_admin`
--

INSERT INTO `nb_admin` (`no`, `sitekey`, `uid`, `upwd`, `uname`, `active_status`) VALUES
(1, 'HOUSEM', 'tmaster', '937e8d5fbb48bd4949536cd65b8d35c426b80d2f830c5c308e2cdec422ae2244', '관리자', 'Y');

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_banner`
--

CREATE TABLE `nb_banner` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `b_loc` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '노출위치 main, main_top_right 등',
  `b_img` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '이미지파일명',
  `b_link` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '배너링크',
  `b_target` enum('_none','_self','_blank') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '_self' COMMENT '링크 형식',
  `b_view` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '관리자명',
  `b_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '배너 제목',
  `b_idx` int NOT NULL DEFAULT '0' COMMENT '순서',
  `b_none_limit` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '무기한 배너여부(Y:무기한, 기한)',
  `b_sdate` date DEFAULT NULL COMMENT '시작일 - 00 시부터 시작',
  `b_edate` date DEFAULT NULL COMMENT '종료일 - 23시 59분 59초까지',
  `b_rdate` datetime DEFAULT NULL COMMENT '배너등록일',
  `b_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '배너설명(필요한경우)',
  `b_img_mobile` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `b_contents` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='배너 관리';

--
-- 테이블의 덤프 데이터 `nb_banner`
--

INSERT INTO `nb_banner` (`no`, `sitekey`, `b_loc`, `b_img`, `b_link`, `b_target`, `b_view`, `b_title`, `b_idx`, `b_none_limit`, `b_sdate`, `b_edate`, `b_rdate`, `b_desc`, `b_img_mobile`, `b_contents`) VALUES
(12, 'HOUSEM', 'site_main', '6805aa0f3afd14.33860728.jpg', '', '_none', 'Y', '시스템만으로는 완성할 수 없습니다. <br>HOUSEMAN은 14년의 경험 위에 기술을 더합니다.', 1, 'Y', NULL, NULL, '2025-04-21 11:14:39', '하우스맨은 14년간 건물을 직접 운영하며 현장에서 해답을 찾아온 전문가입니다. <br>현실을 아는 운영, 숫자로 증명되는 결과를 만듭니다.', '', ''),
(13, 'HOUSEM', 'site_main', '6805aa23b54fb1.98361025.jpg', '', '_none', 'Y', '하우스맨은 중개보수를 쉐어하지 않습니다.', 2, 'Y', NULL, NULL, '2025-04-21 11:14:59', '그래서 더 많은 중개사가 움직이고, <br>공실은 더 빨리 사라집니다.', '', '');

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_board`
--

CREATE TABLE `nb_board` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `board_no` int NOT NULL COMMENT '게시판 고유번호',
  `user_no` int NOT NULL DEFAULT '0' COMMENT '회원 고유번호',
  `category_no` int NOT NULL DEFAULT '0' COMMENT '게시판 카테고리 번호',
  `comment_cnt` int NOT NULL DEFAULT '0' COMMENT '등록된 댓글수',
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '제목',
  `contents` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록일',
  `read_cnt` int NOT NULL DEFAULT '0' COMMENT '조회수',
  `thumb_image` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '썸네일 이미지(게시판에 따라 필요한 경우)',
  `is_admin_writed` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '관리자작성 여부',
  `is_notice` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '공지여부',
  `is_secret` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '비밀글여부',
  `secret_pwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '비밀글 비밀번호',
  `write_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '작성자',
  `isFile` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '첨부파일이 있는지 여부',
  `file_attach_1` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '파일첨부',
  `file_attach_origin_1` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '원래 파일명',
  `file_attach_2` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_2` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_3` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_3` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_4` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_4` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_5` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_6` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_7` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_8` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_9` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_10` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_11` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_5` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_6` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_7` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_8` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_9` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_10` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_attach_origin_11` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_admin_comment_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '관리자가 댓글 달았는지 여부 ',
  `direct_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '바로연결할 URL',
  `filedown_pwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '파일다운로드 비밀번',
  `extra1` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra4` varchar(2100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra6` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra7` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra8` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra9` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra10` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra11` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra12` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra13` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra14` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra15` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra16` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra17` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra18` varchar(2500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra19` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra20` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra21` varchar(2500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `sort_no` int NOT NULL DEFAULT '0',
  `is_contract` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='통합 게시판';

--
-- 테이블의 덤프 데이터 `nb_board`
--

INSERT INTO `nb_board` (`no`, `sitekey`, `board_no`, `user_no`, `category_no`, `comment_cnt`, `title`, `contents`, `regdate`, `read_cnt`, `thumb_image`, `is_admin_writed`, `is_notice`, `is_secret`, `secret_pwd`, `write_name`, `isFile`, `file_attach_1`, `file_attach_origin_1`, `file_attach_2`, `file_attach_origin_2`, `file_attach_3`, `file_attach_origin_3`, `file_attach_4`, `file_attach_origin_4`, `file_attach_5`, `file_attach_6`, `file_attach_7`, `file_attach_8`, `file_attach_9`, `file_attach_10`, `file_attach_11`, `file_attach_origin_5`, `file_attach_origin_6`, `file_attach_origin_7`, `file_attach_origin_8`, `file_attach_origin_9`, `file_attach_origin_10`, `file_attach_origin_11`, `is_admin_comment_yn`, `direct_url`, `filedown_pwd`, `extra1`, `extra2`, `extra3`, `extra4`, `extra5`, `extra6`, `extra7`, `extra8`, `extra9`, `extra10`, `extra11`, `extra12`, `extra13`, `extra14`, `extra15`, `extra16`, `extra17`, `extra18`, `extra19`, `extra20`, `extra21`, `is_visible`, `sort_no`, `is_contract`) VALUES
(48, 'HOUSEM', 9, -1, 0, 0, 'w하우스 403호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;★ 건물관리회사 하우스맨입니다 ★&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 선착순 주차 1대 (스타렉스,탑차 주차불가)&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;span style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 전입신고 불가&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 계약 진행 시 기본 3개월 (1,2개월 불가)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 법인, 외국인, 50세 이상 계약 불가&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 12:41:57', 146, '6822e4bb4b63e9.94815420.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3b5624a424.58784001.hwp', 'w402403502503.hwp', '681c4f5db29ba2.47731049.jpg', 'KakaoTalk_20250508_141354522_02.jpg', '681c4f5db2ddf3.69564203.jpg', 'KakaoTalk_20250508_141354522_05.jpg', '681c4f5db31a13.56294474.jpg', 'KakaoTalk_20250508_141354522_09.jpg', '681c4f5db351e1.23924054.jpg', '681c4f5db38b41.64046178.jpg', '681c4f5db3c147.83683217.jpg', '681c4f5db40455.28241511.jpg', '681c4f5db44726.32074063.jpg', '', '', 'KakaoTalk_20250508_141354522_11.jpg', 'KakaoTalk_20250508_141354522_12.jpg', 'KakaoTalk_20250508_141354522_17.jpg', 'KakaoTalk_20250508_141354522_03.jpg', 'KakaoTalk_20250508_141354522.jpg', '', '', 'N', NULL, NULL, '논현동', '', '논현동 197-19', '230만원', '230만원', '15만', '계약가능', '분리형', '2룸', '1개', '3만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능 (스타렉스,탑차 주차 불가)', 'https://naver.me/xk1MpgO8', '25만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 4, 0),
(47, 'HOUSEM', 9, -1, 0, 0, 'w하우스 305호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 09:31:44', 151, '6822e2ee88b4b6.24944420.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3b78a186e8.83366980.hwp', 'W하우스(3층).hwp', '681c33048cd018.01800184.jpg', 'KakaoTalk_20241204_105839805_10.jpg', '681c33048d0b71.07248901.jpg', 'KakaoTalk_20250502_144115648_08.jpg', '681c33048d47b1.65209777.jpg', 'KakaoTalk_20241204_105839805_11.jpg', '681c4163177bd8.16382506.jpg', '681c416317bee2.97198358.jpg', '681c41631802c4.02468833.jpg', '681c41631847e7.46404573.jpg', NULL, NULL, NULL, 'KakaoTalk_20250508_141734897_05.jpg', 'KakaoTalk_20250508_141734897_08.jpg', 'KakaoTalk_20241204_105839805_04.jpg', 'KakaoTalk_20241204_105839805_06.jpg', NULL, NULL, NULL, 'N', NULL, NULL, '논현동', '', '논현동 197-19', '135만원', '135만원', '8만원 (수도요금 2.5만원, 인터넷 2.5만원)', '계약가능', '오픈형', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능 (스타렉스,탑차 주차 불가)', 'https://naver.me/xk1MpgO8', '15만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 5, 0),
(58, 'HOUSEM', 9, -1, 0, 0, '다존하우스 302호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-09 09:34:46', 178, '681da8fd73c508.22893128.png', 'N', 'N', 'N', NULL, '관리자', 'N', '682c398046b190.91034942.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완료', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 11, 0),
(57, 'HOUSEM', 9, -1, 0, 0, '다존하우스 201호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-09 09:34:46', 178, '681da8d8743c57.57531792.png', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3a7006d3a7.74063227.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 1, 0),
(49, 'HOUSEM', 9, -1, 0, 0, '에덴빌 203호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 13:41:10', 154, '6822e3b467f6d3.69534709.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3b1b33f054.18796533.hwp', '에덴빌계약서.hwp', '681c5aefe61363.19768136.jpg', 'KakaoTalk_20250508_145702852_09.jpg', '681c5aefe652c3.63547542.jpg', 'KakaoTalk_20250508_145702852_02.jpg', '681c5aefe68de0.76654332.jpg', 'KakaoTalk_20250508_145702852_03.jpg', '681c5aefe6bf75.33308061.jpg', '681c5aefe6f9c4.14978024.jpg', '681c5aefe73984.84478894.jpg', '', '', '', '', 'KakaoTalk_20250508_145702852_04.jpg', 'KakaoTalk_20250508_145702852_07.jpg', 'KakaoTalk_20250508_145702852.jpg', '', '', '', '', 'N', NULL, NULL, '삼성동', '', '삼성동 125-14번지 ', '95만원', '95만원', '8만원', '계약가능', '오픈형', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '주차불가', '없음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/xk1MCLiy', '15만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 8, 0),
(50, 'HOUSEM', 11, -1, 0, 0, '에덴빌 201호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 13:41:10', 232, '6822e3ca3ade46.55446118.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3b0ac8b915.39564301.hwp', '에덴빌계약서.hwp', '681c5c38c71544.75214544.jpg', 'KakaoTalk_20250508_144941070_04.jpg', '681c5c38c75984.34768014.jpg', 'KakaoTalk_20250508_144941070_02.jpg', '681c5c38c79517.31592226.jpg', 'KakaoTalk_20250508_144941070_03.jpg', '681c5c38c7c677.99891568.jpg', '681c5c38c7fe98.72654500.jpg', '681c5c38c83b95.52388123.jpg', '', '', '', '', 'KakaoTalk_20250508_144941070_05.jpg', 'KakaoTalk_20250508_144941070_07.jpg', 'KakaoTalk_20250508_144941070_10.jpg', '', '', '', '', 'N', NULL, NULL, '삼성동', '', '삼성동 125-14번지', '1,5000만원', '0만원', '15만원', '계약가능', '오픈형', '1개', '1개', '개별', '개별', '개별', '주차불가', '없음', '풀옵션', '', '애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', '', '', '법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 2, 0),
(51, 'HOUSEM', 9, -1, 0, 0, '지앤지 204호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 13:41:10', 186, '6822e46d878c01.31158379.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '683010785440a0.06326060.hwp', '지앤지2계약서.hwp', '681c557a09f804.47604918.jpg', 'KakaoTalk_20250508_154456302_04.jpg', '681c557a0a5619.26492337.jpg', 'KakaoTalk_20250508_154456302_01.jpg', '681c557a0aaf27.33197446.jpg', 'KakaoTalk_20250508_154456302_03.jpg', '681c557a0afbc9.76492207.jpg', '681c557a0b50c4.11187987.jpg', '681c557a0b9ae5.49727879.jpg', '681c557a0bd9a7.62565552.jpg', '681c557a0c0601.76349625.jpg', '681c557a0c41a1.65323365.jpg', '681c557a0c87b2.56191622.jpg', 'KakaoTalk_20250508_154456302_05.jpg', 'KakaoTalk_20250508_154456302_06.jpg', 'KakaoTalk_20250508_154456302_11.jpg', 'KakaoTalk_20250508_155320646.jpg', 'KakaoTalk_20250508_154456302_13.jpg', 'KakaoTalk_20250508_154456302_17.jpg', 'KakaoTalk_20250508_154456302_10.jpg', 'N', NULL, NULL, '논현동', '', '논현동 76-2', '185만원', '185만원', '10만원', '계약완료', '원룸원거실', '1룸', '1개', '3만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차', '없음', '풀옵션', '20만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능 (주차보증금 10만원)', 'https://naver.me/FY3QNtaY', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 6, 0),
(55, 'HOUSEM', 9, -1, 0, 0, '스타빌 405호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 13:41:10', 170, '6822e55d39aef3.87182084.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3a7f64ea40.30491830.hwp', '스타빌계약서.hwp', '6822e55d39e821.57857659.jpg', 'KakaoTalk_20250508_153542737_01 (1).jpg', '681c5f3915e4d5.77788853.jpg', 'KakaoTalk_20250508_153542737_02.jpg', '681c5f391620f6.80034067.jpg', 'KakaoTalk_20250508_153542737_03.jpg', '681c5f391659d3.62067560.jpg', '681c5f39168e42.62961065.jpg', '681c5daa2a0b1.jpg', '', '', '', '', 'KakaoTalk_20250508_153542737_04.jpg', 'KakaoTalk_20250508_153542737_06.jpg', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '역삼동 663-23번지', '75만원', '75만원', '8만원', '계약완료', '오픈형', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '주차불가', '없음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/FK5wYCqu', '10만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 10, 0),
(54, 'HOUSEM', 9, -1, 0, 0, '에덴빌 302호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-17 00:00:00', 146, '6822e3a070d167.70768567.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3addf01803.71028719.hwp', '에덴빌계약서.hwp', '681c5cb83dbaa7.99417464.jpg', 'KakaoTalk_20250508_150217743_05.jpg', '681c5cb83df964.26947919.jpg', 'KakaoTalk_20250508_150217743_02.jpg', '681c5cb83e3d48.47557232.jpg', 'KakaoTalk_20250508_150217743_04.jpg', '681c5cb83e7a62.76457603.jpg', '681c5cb83eb180.41719903.jpg', '681c5cb83ef092.38352634.jpg', '', '', '', '', 'KakaoTalk_20250508_150217743_01.jpg', 'KakaoTalk_20250508_150217743_07.jpg', 'KakaoTalk_20250508_150217743_09.jpg', '', '', '', '', 'N', NULL, NULL, '삼성동', '', '삼성동 125-14번지 ', '100만원', '100만원', '8만원', '계약완료', '오픈형', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '주차불가', '없음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/xk1MCLiy', '15만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 9, 0),
(52, 'HOUSEM', 9, -1, 0, 0, '토브미하우스 202호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 13:41:10', 192, '6822e3b8b09e85.76406544.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3af4aea824.33653962.hwp', '토브미하우스계약서.hwp', '681c528c4d0864.68692016.jpg', 'KakaoTalk_20250508_152751805_01.jpg', '681c528c4d4927.54758241.jpg', 'KakaoTalk_20250508_152751805_02.jpg', '681c528c4d8a82.88987018.jpg', 'KakaoTalk_20250508_152751805_03.jpg', '681c528c4dcb50.52648198.jpg', '681c528c4e05a6.58324639.jpg', '681c528c4e3c32.66847811.jpg', '681c528c4e7844.55602125.jpg', '681c528c4ec712.60161300.jpg', '681c528c4f1237.61126105.jpg', '', 'KakaoTalk_20250508_152751805_04.jpg', 'KakaoTalk_20250508_152751805_07.jpg', 'KakaoTalk_20250508_152751805_05.jpg', 'KakaoTalk_20250508_152751805_08.jpg', 'KakaoTalk_20250508_152751805_09.jpg', 'KakaoTalk_20250508_152751805.jpg', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 219-26', '170만원', '170만원', '10만원', '계약가능', '원룸원거실', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/GpCZKrZQ', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 20, 0),
(53, 'HOUSEM', 11, -1, 0, 0, '지앤지 401호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 13:41:10', 198, '6822e3af1065d9.12391273.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '681c55f899e96.hwp', '', '681c584b8e9048.42508151.jpg', 'KakaoTalk_20250508_155400557_01.jpg', '681c584b8ee408.20735059.jpg', 'KakaoTalk_20250508_155400557_02.jpg', '681c584b8f32f9.01763202.jpg', 'KakaoTalk_20250508_155400557_03.jpg', '681c584b8f7e57.94928736.jpg', '681c584b8fbfc2.62567616.jpg', '681c584b8fff38.68152163.jpg', '681c584b903404.63228502.jpg', '681c584b909a45.31970357.jpg', '681c584b90e992.15415850.jpg', '681c584b915976.39147088.jpg', 'KakaoTalk_20250508_155400557_04.jpg', 'KakaoTalk_20250508_155400557_08.jpg', 'KakaoTalk_20250508_155400557_09.jpg', 'KakaoTalk_20250508_155400557_11.jpg', 'KakaoTalk_20250508_155400557_07.jpg', 'KakaoTalk_20250508_155400557_22.jpg', 'KakaoTalk_20250508_155400557_16.jpg', 'N', NULL, NULL, '논현동', '', '논현동 76-2', '7000만원', '390만원', '20만원', '계약가능', '복층형', '3개', '2개', '개별', '개별', '개별', '선착순 주차', '없음', '에어컨, 싱크대, 가스레인지', '', '넓은 테라스, 옥상 사용<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 'https://naver.me/F1r7cxEG', '0.6%', '법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 3, 0),
(59, 'HOUSEM', 9, -1, 0, 0, '다존하우스 606호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-09 09:34:46', 184, '681da8eb6f1711.17233239.png', 'N', 'N', 'N', NULL, '관리자', 'N', '682c398cc7a821.20774971.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완료', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 12, 0),
(60, 'HOUSEM', 9, -1, 0, 0, '다존하우스 510호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-01 00:00:00', 162, '681da9057bcfe9.73642405.png', 'N', 'N', 'N', NULL, '관리자', 'N', '682c39997480b4.19007432.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '45만원', '8만원', '계약가능', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 13, 0),
(75, 'HOUSEM', 9, -1, 0, 0, '모던라이프 304호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;★ 건물관리회사 하우스맨입니다 ★&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 선착순 주차 1대 (주차리모컨 보증금 5만원)&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;span style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 전입신고 불가&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 계약 진행 시 기본 3개월 (1,2개월 불가)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 법인, 외국인, 50세 이상 계약 불가&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-08 12:41:57', 127, '6822e31499fd94.68130266.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c39a9b29359.50459271.hwp', '모던라이프계약서.hwp', '68219f8d15c083.96688473.jpg', 'KakaoTalk_20250512_160426567_11.jpg', '68219f8d160887.50466192.jpg', 'KakaoTalk_20250512_160426567_06.jpg', '68219f8d164702.70635764.jpg', 'KakaoTalk_20250512_160426567_02.jpg', '68219f8d1682d4.74639678.jpg', '68219f8d16b618.04178577.jpg', NULL, NULL, NULL, '', '', 'KakaoTalk_20250512_160426567_03.jpg', 'KakaoTalk_20250512_160426567_09.jpg', 'KakaoTalk_20250508_141354522_17.jpg', 'KakaoTalk_20250508_141354522_03.jpg', 'KakaoTalk_20250508_141354522.jpg', '', '', 'N', NULL, NULL, '논현동', '', '논현동 68-19', '195만원', '195만원', '12만원', '계약완료', '분리형', '1룸', '1개', '3만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '주차가능', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/xk1MpgO8', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 14, 0),
(76, 'HOUSEM', 10, -1, 0, 0, '우진빌딩 5층', '&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-13 00:00:01', 177, '6822ea270e7006.24279097.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '6822ea270ee406.23840880.jpg', 'KakaoTalk_20250508_145630711.jpg', '6822ea270f4cd2.08597076.jpg', 'KakaoTalk_20250508_145630711_02.jpg', '6822ea270fab72.52616609.jpg', 'KakaoTalk_20250508_145630711_05.jpg', '6822ea27101146.13075330.jpg', '6822ea27108f62.73327899.jpg', '', '', '', '', '', 'KakaoTalk_20250508_145630711_07.jpg', 'KakaoTalk_20250508_145630711_08.jpg', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '5층', '강남구 역삼동 637-18 우진빌딩', '3200만', '250만', '10만', '계약가능', '전층 사용', '0', '1개', '별도', '별도', '별도', '1대 가능(지정 주차 x)', '있음', '냉난방', '', '공실(즉시입주 가능)', 'https://naver.me/II4sII77', '0.6%', '', 0, 15, 0),
(77, 'HOUSEM', 10, -1, 0, 0, '어반그레이 B01호', '&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-13 00:00:02', 210, '6822ed28af7a52.27818139.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '6822ed28afd2e0.28484913.jpg', '어반1.jpg', '6822ed28b02121.83427373.jpg', '어반2.jpg', '6822ed28b067a8.23323486.jpg', '어반3.jpg', '6822ed28b0ad49.16452906.jpg', '6822ed28b0f5d7.43481706.jpg', '6822ed28b13c62.22496880.jpg', '6822ed28b18ee2.71987396.jpg', '6822ed28b1f1f6.41720863.jpg', '', '', '어반4.jpg', '어반5.jpg', '어반6.jpg', '어반7.jpg', '어반8.jpg', '', '', 'N', NULL, NULL, '논현동', '지하 1층', '강남구 논현동 194-6 어반그레이', '6000만', '400만', '50만', '계약가능', '전층 사용', '0', '내부 화장실', '별도', '별도', '별도', '무료 1대 [협의 가능]', '있음', '냉난방', '', '★중개 수수료 0.9%★<br/>리모델링 첫 입주<br/>렌트프리 가능[협의]<br/>금액 협의 가능<br/>추가 주차 필요 시 문의', 'https://naver.me/FvQULJvi', '0.9%', '', 0, 16, 0),
(78, 'HOUSEM', 10, -1, 0, 0, '어반그레이 1층', '&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;', '2025-05-13 00:00:03', 181, '6822f0c89e46d7.73508984.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '6822f0c89ea865.38754207.jpg', '어반1-2.jpg', '6822f0c89ef955.38846545.jpg', '어반1-3.jpg', '6822f0c89f4272.59232381.jpg', '어반1-4.jpg', '6822f0c89f9cc4.70503976.jpg', '6822f0c89fe5a0.06719944.jpg', '6822f0c8a04546.72781080.jpg', '6822ed580b437.jpg', '6822ed580b96d.jpg', '', '', '어반1-5.jpg', '어반1-6.jpg', '어반1-7.jpg', '어반7.jpg', '어반8.jpg', '', '', 'N', NULL, NULL, '논현동', '1층', '강남구 논현동 194-6 어반그레이', '7000만', '490만', '50만', '계약가능', '전층 사용', '0', '2개', '별도', '별도', '별도', '무료 1대 [협의 가능]', '있음', '냉난방', '', '★중개 수수료 0.9%★<br/>리모델링 첫 입주<br/>렌트프리 가능[협의]<br/>금액 협의 가능<br/>추가 주차 필요 시 문의', 'https://naver.me/FvQULJvi', '0.9%', '', 0, 17, 0),
(79, 'HOUSEM', 10, -1, 0, 0, '어반그레이 2층', '&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;', '2025-05-13 00:00:04', 187, '6822f403837624.83301787.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '6822f40383d470.78676054.jpg', '어반2-1.jpg', '6822f403842700.60715555.jpg', '어반2-2.jpg', '6822f403847075.43361073.jpg', '어반2-3.jpg', '6822f40384bba5.97385193.jpg', '6822f403850559.40841744.jpg', '6822f403856ac5.44756038.jpg', '6822f40385c698.02136976.jpg', '6822f10908232.jpg', '', '', '어반2-4.jpg', '어반2-5.jpg', '어반2-6.jpg', '어반2-7.jpg', '어반8.jpg', '', '', 'N', NULL, NULL, '논현동', '2층', '강남구 논현동 194-6 어반그레이', '7000만', '490만', '50만', '계약가능', '전층 사용', '0', '2개', '별도', '별도', '별도', '무료 1대 [협의 가능]', '있음', '냉난방', '', '★중개 수수료 0.9%★<br/>리모델링 첫 입주<br/>렌트프리 가능[협의]<br/>금액 협의 가능<br/>추가 주차 필요 시 문의', 'https://naver.me/FvQULJvi', '0.9%', '', 0, 18, 0),
(80, 'HOUSEM', 10, -1, 0, 0, '어반그레이 3층', '&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-13 00:00:05', 207, '6822f77dc8b976.89353622.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '6822f77dc90e17.64003073.jpg', '어반3-2.jpg', '6822f77dc96222.74966965.jpg', '어반3-3.jpg', '6822f77dc9aaa8.38867292.jpg', '어반3-4.jpg', '6822f77dca0816.01965569.jpg', '6822f77dca68a7.20951021.jpg', '6822f41c05173.jpg', '6822f41c05631.jpg', '6822f41c05b64.jpg', '', '', '어반3-5.jpg', '어반3-6.jpg', '어반2-6.jpg', '어반2-7.jpg', '어반8.jpg', '', '', 'N', NULL, NULL, '논현동', '3', '강남구 논현동 194-6 어반그레이', '4000만', '310만', '40만', '계약가능', '전층 사용', '0', '2개', '별도', '별도', '별도', '무료 1대 [협의 가능]', '있음', '냉난방', '', '★중개 수수료 0.9%★<br/>리모델링 첫 입주<br/>렌트프리 가능[협의]<br/>금액 협의 가능<br/>추가 주차 필요 시 문의', 'https://naver.me/FvQULJvi', '0.9%', '', 0, 7, 1),
(82, 'HOUSEM', 9, -1, 0, 0, '아페이론 204호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-13 18:18:25', 157, '68230e61369866.50950087.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6823ffd0bd41c0.83816162.hwp', '아페이론 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 610-2 아페이론', '125만원', '125만원', '10만원', '계약가능', '원룸 [세미 분리형]', '원룸', '1개', '별도', '2.5만원', '2.5만원', '선착순 1대', '없음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/F0Ai3WWv', '15만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 19, 0),
(83, 'HOUSEM', 10, -1, 0, 0, '우영빌딩 2층', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-14 00:00:01', 178, '6823e8942adc30.90580111.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '2층', '강남구 논현동 163-18 우영빌딩', '1억원', '600만원', '100만원', '계약가능', '일부층사용', '1개', '내부화장실', '별도', '별도', '별도', '무료 1대', '있음', '개별냉난방', '원상복구', '★렌트프리 가능★<br/>즉시 입주 가능<br/>주차 1대 무료', 'https://naver.me/FPUVwUdg', '0.6%', '', 0, 21, 0),
(84, 'HOUSEM', 10, -1, 0, 0, '우영빌딩 4층', '&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;', '2025-05-14 00:00:02', 181, '6823e8983097e.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '4층', '강남구 논현동 163-18 우영빌딩', '7000만원', '300만원', '50만원', '계약가능', '일부층사용', '1개', '내부화장실', '별도', '별도', '별도', '무료 1대', '있음', '개별냉난방', '원상복구', '★렌트프리 가능★<br/>즉시 입주 가능<br/>주차 1대 무료', 'https://naver.me/FPUVwUdg', '0.6%', '', 0, 22, 0),
(85, 'HOUSEM', 10, -1, 0, 0, '문화빌딩 2층', '&lt;div&gt;&lt;/div&gt;', '2025-05-14 11:02:34', 186, '6823f9ba6943c1.47356848.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '6823f9ba69d5e7.15059310.jpg', 'KakaoTalk_20250514_104951136.jpg', '6823f9ba6a43b3.34310941.jpg', 'KakaoTalk_20250514_104951136_01.jpg', '6823f9ba6abba6.74702520.jpg', 'KakaoTalk_20250514_104951136_04.jpg', '6823f9ba6b41a8.76240110.jpg', '6823f9ba6bb860.21573064.jpg', '6823f9ba6c26c5.32065654.jpg', '', '', '', '', 'KakaoTalk_20250514_104951136_05.jpg', 'KakaoTalk_20250514_104951136_07.jpg', 'KakaoTalk_20250514_104951136_11.jpg', '', '', '', '', 'N', '', NULL, '도화동', '2층', '마포구 도화동 201-14 문화빌딩', '1억2000만원', '790만원', '40만원', '계약가능', '전층사용', '0', '내부화장실', '별도', '별도', '별도', '가능', '있음', '', '', '권리금 없음<br/>즉시 입주 가능<br/>주차 1대 무료', 'https://naver.me/5v3Pn7EA', '0.6%', '', 0, 23, 0),
(86, 'HOUSEM', 9, -1, 0, 0, '제이앤제이 301호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-14 16:34:23', 152, '68244889459270.93348744.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '68254acb7cef35.11591637.hwp', '제이앤제이 계약서.hwp', '6824488945ffd9.99825021.jpg', '제이1.jpg', '68244889466222.30174179.jpg', '제이2.jpg', '6824488946d971.22051371.jpg', '제이3.jpg', '682448894749f0.18144179.jpg', '', '', '', '', '', '', '제이5.jpg', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 124-25 제이앤제이', '165만원', '165만원', '12만원', '계약가능', '세미분리형', '원룸', '1개', '2.5만원', '2.5만원', '별도', '불가', '없음', '풀옵션', '20만원', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', '', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 24, 0),
(87, 'HOUSEM', 9, -1, 0, 0, '미래홈 304호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-15 11:00:37', 168, '68254ac505e807.15172044.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3a12ef46e1.25418161.hwp', '미래홈 계약서.hwp', '68254ac5062ee3.18096302.jpg', '1.jpg', '68254ac5064298.50165320.jpg', '2.jpg', '68254ac5065396.64376552.jpg', '3.jpg', '68254ac50666a9.36758886.jpg', '68254ac5067b04.46003995.jpg', '68254ac5068c84.65651270.jpg', '', '', '', '', '4.jpg', '5.jpg', '6.jpg', '', '', '', '', 'N', NULL, NULL, '봉천동', '', '관악구 봉천동 934-15 미래홈', '70만원', '50만원', '7만원', '계약완료', '오픈형', '원룸', '1개', '관리비 포함', '관리비 포함', '별도', '불가', '없음', '풀옵션', '8만원', '기본 3개월 계약(1,2개월 불가) / 1인 1거주 원칙<br/>전입신고 불가<br/>애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 'https://naver.me/Fr0sr8ob', '11만원', '애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>전입신고 불가', 0, 25, 0),
(88, 'HOUSEM', 9, -1, 0, 0, '서우하우스 401호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-15 15:59:39', 161, '6825911e760243.06279820.png', 'N', 'N', 'N', NULL, '관리자', 'N', '682c38ac2bcbf5.47699634.hwp', '서우하우스 계약서.hwp', '682590dbc07279.51945250.jpg', '1.jpg', '682590dbc0d8b8.80996814.jpg', '2.jpg', '682590e88ebcc0.08097450.jpg', '3.jpg', '682590e88f2436.10520709.jpg', '682590e88f8515.20197810.jpg', '682590efe953e5.30922162.jpg', '', '', '', '', '4.jpg', '5.jpg', '6.jpg', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 704-18 서우하우스', '155만원', '155만원', '12만원', '계약가능', '분리형', '원룸', '1개', '3만원', '2.5만원', '별도', '선착순 1대', '있음', '풀옵션', '20만원', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>선착순 주차 1대<br/>4K TV 구비[넷플릭스, 유튜브 시청 가능]', 'https://naver.me/IM4Srtt3', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 26, 0),
(92, 'HOUSEM', 9, -1, 0, 0, '토브미하우스 301호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-16 13:30:00', 154, '6826c130146f23.04235752.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c3a46c2c876.29325071.hwp', '토브미하우스계약서.hwp', '6826c14c617922.00125178.jpg', 'KakaoTalk_20210405_152756119_06.jpg', NULL, 'KakaoTalk_20250508_152751805_02.jpg', NULL, 'KakaoTalk_20250508_152751805_03.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '', 'KakaoTalk_20250508_152751805_04.jpg', 'KakaoTalk_20250508_152751805_07.jpg', 'KakaoTalk_20250508_152751805_05.jpg', 'KakaoTalk_20250508_152751805_08.jpg', 'KakaoTalk_20250508_152751805_09.jpg', 'KakaoTalk_20250508_152751805.jpg', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 219-26', '170만원', '170만원', '10만원', '계약완료', '원룸원거실', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/GpCZKrZQ', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 27, 0),
(93, 'HOUSEM', 9, -1, 0, 0, '스타빌 305호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-19 00:00:01', 153, '682ae93594fcc.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c38e6e6e6a9.55321336.hwp', '스타빌계약서.hwp', NULL, 'KakaoTalk_20250508_153542737_01 (1).jpg', NULL, 'KakaoTalk_20250508_153542737_02.jpg', NULL, 'KakaoTalk_20250508_153542737_03.jpg', NULL, NULL, '682ae935a7654.jpg', '', '', '', '', 'KakaoTalk_20250508_153542737_04.jpg', 'KakaoTalk_20250508_153542737_06.jpg', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '역삼동 663-23번지', '75만원', '75만원', '8만원', '계약완료', '오픈형', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '주차불가', '없음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/FK5wYCqu', '10만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 28, 0),
(94, 'HOUSEM', 9, -1, 0, 0, '다존하우스 203호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-19 00:00:00', 179, '682aea11af2b3.png', 'N', 'N', 'N', NULL, '관리자', 'N', '682c39e5e53584.31556002.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완료', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 29, 0),
(95, 'HOUSEM', 9, -1, 0, 0, '모던라이프 601호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;★ 건물관리회사 하우스맨입니다 ★&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 테라스 사용 금지&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;span style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 전입신고 불가&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 계약 진행 시 기본 3개월 (1,2개월 불가)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 법인, 외국인, 50세 이상 계약 불가&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-18 00:00:00', 177, '682c358e34bc08.14581246.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682c392f926ca1.13084521.hwp', '모던라이프계약서.hwp', '682c358e350647.83238914.jpg', '1.jpg', '682c358e354923.03686561.jpg', '2.jpg', '682c358e358be7.41646777.jpg', '3.jpg', '682c358e35bfe8.70362980.jpg', '682c358e3613d6.31405504.jpg', '', '', '', '', '', '4.jpg', '5.jpg', 'KakaoTalk_20250508_141354522_17.jpg', 'KakaoTalk_20250508_141354522_03.jpg', 'KakaoTalk_20250508_141354522.jpg', '', '', 'N', NULL, NULL, '논현동', '', '논현동 68-19', '145만원', '145만원', '10만', '계약가능', '분리형', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '협의', '있음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 'https://naver.me/xk1MpgO8', '20만원', '테라스 사용 금지<br/>전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 30, 0),
(107, 'HOUSEM', 9, -1, 0, 0, '다존하우스 301호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-27 00:00:00', 150, '684002c2492d3.png', 'N', 'N', 'N', NULL, '관리자', 'N', '684002c2496db.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완료', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 42, 0),
(96, 'HOUSEM', 9, -1, 0, 0, '포유빌 501호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-18 00:00:00', 164, '682d8f65ba67a6.82307527.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682d8f65ba8b82.04364410.hwp', '포유빌 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 697-52 포유빌', '130만원', '130만원', '8만원', '계약가능', '오픈형', '원룸', '1개', '2.5만원', '2.5만원', '별도', '선착순 1대', '없음', '풀옵션', '20만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/xZjvLpUk', '15만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가(적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 1, 31, 0),
(97, 'HOUSEM', 9, -1, 0, 0, '리트코하우스 603호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-22 13:28:55', 206, '682ea807e87e50.08938400.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682ea807e8a8b6.21085866.hwp', '리트코 계약서.hwp', '682ea807e8cb39.13462893.jpg', 'KakaoTalk_20250521_161612781_03.jpg', '682ea807e8ef40.44309173.jpg', 'KakaoTalk_20250521_161612781_04.jpg', '682ea807e91585.56789313.jpg', 'KakaoTalk_20250521_161612781_07.jpg', '682ea807e93648.18154760.jpg', '682ea807e958a7.58142563.jpg', '', '', '', '', '', 'KakaoTalk_20250521_161612781_23.jpg', 'KakaoTalk_20250521_161612781_27.jpg', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 840-5 리트코빌딩', '130만원', '130만원', '10만원', '계약완료', '오픈형', '원룸', '1개', '2.5만원', '2.5만원', '별도', '문의', '있음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/xydPYqq1', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 32, 0),
(98, 'HOUSEM', 9, -1, 0, 0, '다존하우스 502호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-22 00:00:00', 178, '682edcd84d7fb.png', 'N', 'N', 'N', NULL, '관리자', 'N', '682edcd84dc42.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완료', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 33, 0);
INSERT INTO `nb_board` (`no`, `sitekey`, `board_no`, `user_no`, `category_no`, `comment_cnt`, `title`, `contents`, `regdate`, `read_cnt`, `thumb_image`, `is_admin_writed`, `is_notice`, `is_secret`, `secret_pwd`, `write_name`, `isFile`, `file_attach_1`, `file_attach_origin_1`, `file_attach_2`, `file_attach_origin_2`, `file_attach_3`, `file_attach_origin_3`, `file_attach_4`, `file_attach_origin_4`, `file_attach_5`, `file_attach_6`, `file_attach_7`, `file_attach_8`, `file_attach_9`, `file_attach_10`, `file_attach_11`, `file_attach_origin_5`, `file_attach_origin_6`, `file_attach_origin_7`, `file_attach_origin_8`, `file_attach_origin_9`, `file_attach_origin_10`, `file_attach_origin_11`, `is_admin_comment_yn`, `direct_url`, `filedown_pwd`, `extra1`, `extra2`, `extra3`, `extra4`, `extra5`, `extra6`, `extra7`, `extra8`, `extra9`, `extra10`, `extra11`, `extra12`, `extra13`, `extra14`, `extra15`, `extra16`, `extra17`, `extra18`, `extra19`, `extra20`, `extra21`, `is_visible`, `sort_no`, `is_contract`) VALUES
(99, 'HOUSEM', 9, -1, 0, 0, 'w하우스 502호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;★ 건물관리회사 하우스맨입니다 ★&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 선착순 주차 1대 (스타렉스,탑차 주차불가)&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;span style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 전입신고 불가&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 계약 진행 시 기본 3개월 (1,2개월 불가)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 법인, 외국인, 50세 이상 계약 불가&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-23 00:00:00', 173, '682fc9669029f1.74214228.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682fc767751c0.hwp', 'w402403502503.hwp', '682fc966905c02.54273363.jpg', '2.jpg', '682fc966908679.48835260.jpg', '3.jpg', '682fc96690aa77.40428281.jpg', '4.jpg', '682fc96690d368.53186508.jpg', NULL, NULL, NULL, NULL, '', '', '5.jpg', 'KakaoTalk_20250508_141354522_12.jpg', 'KakaoTalk_20250508_141354522_17.jpg', 'KakaoTalk_20250508_141354522_03.jpg', 'KakaoTalk_20250508_141354522.jpg', '', '', 'N', NULL, NULL, '논현동', '', '논현동 197-19', '230만원', '230만원', '15만', '계약완료', '분리형', '2룸', '1개', '3만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능 (스타렉스,탑차 주차 불가)', 'https://naver.me/xk1MpgO8', '25만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 34, 0),
(100, 'HOUSEM', 9, -1, 0, 0, '와이원빈티지 302호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-23 10:22:10', 178, '682fcdc28350a3.07503794.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '682fcdc2836f98.61373071.hwp', '와이원빈티지 계약서_유병수님.hwp', '682fcdc283bb67.41436974.jpg', '1.jpg', '682fcdc283d598.83755424.jpg', '2.jpg', '682fcdc283ee04.92349929.jpg', '3.jpg', '682fcdc28405d9.00205743.jpg', '', '', '', '', '', '', '4.jpg', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 189-21', '95만원', '95만원', '8만원', '계약완료', '오픈형', '원룸', '1개', '2.5만원', '2.5만원', '별도', '선착순 1대', '있음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 'https://naver.me/5dAqR3wa', '15만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 35, 0),
(101, 'HOUSEM', 9, -1, 0, 0, '와이원빈티지 502호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-24 00:00:00', 159, '68301b8144abc3.67840889.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '68301a7f638d5.hwp', '와이원빈티지 계약서_유병수님.hwp', NULL, '1.jpg', NULL, '2.jpg', NULL, '3.jpg', NULL, '', '', '', '', '', '', '4.jpg', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 189-21', '100만원', '100만원', '8만원', '계약완료', '복층형', '원룸', '1개', '2.5만원', '2.5만원', '별도', '선착순 1대', '있음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 'https://naver.me/5dAqR3wa', '15만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 36, 0),
(102, 'HOUSEM', 9, -1, 0, 0, '다존하우스 501호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-27 00:00:00', 129, '683574449b8a2.png', 'N', 'N', 'N', NULL, '관리자', 'N', '683574449e8dc.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완료', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 37, 0),
(103, 'HOUSEM', 9, -1, 0, 0, '미래홈 103호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-27 00:00:00', 135, '6837d2649b894.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6837d2649b9e1.hwp', '미래홈 계약서.hwp', NULL, '1.jpg', NULL, '2.jpg', NULL, '3.jpg', NULL, NULL, NULL, '', '', '', '', '4.jpg', '5.jpg', '6.jpg', '', '', '', '', 'N', NULL, NULL, '봉천동', '', '관악구 봉천동 934-15 미래홈', '50만원', '35만원', '7만원', '계약완료', '오픈형', '원룸', '1개', '관리비 포함', '관리비 포함', '별도', '불가', '없음', '풀옵션', '8만원', '기본 3개월 계약(1,2개월 불가) / 1인 1거주 원칙<br/>전입신고 불가<br/>애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 'https://naver.me/Fr0sr8ob', '11만원', '애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>전입신고 불가', 0, 38, 0),
(104, 'HOUSEM', 9, -1, 0, 0, 'w하우스 603호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;★ 건물관리회사 하우스맨입니다 ★&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 선착순 주차 1대 (스타렉스,탑차 주차불가)&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;span style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 전입신고 불가&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 계약 진행 시 기본 3개월 (1,2개월 불가)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 법인, 외국인, 50세 이상 계약 불가&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-29 00:00:00', 144, '6837decabd3246.73606838.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6837de91f251a3.33383170.hwp', 'w하우스 6층 계약서.hwp', NULL, '2.jpg', NULL, '3.jpg', NULL, '4.jpg', NULL, '', '', '', '', '', '', '5.jpg', 'KakaoTalk_20250508_141354522_12.jpg', 'KakaoTalk_20250508_141354522_17.jpg', 'KakaoTalk_20250508_141354522_03.jpg', 'KakaoTalk_20250508_141354522.jpg', '', '', 'N', NULL, NULL, '논현동', '', '논현동 197-19', '165만원', '165만원', '15만', '계약완료', '분리', '원룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능 (스타렉스,탑차 주차 불가)', 'https://naver.me/xk1MpgO8', '15만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 39, 0),
(105, 'HOUSEM', 9, -1, 0, 0, '아페이론 201호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-13 18:18:25', 81, '683d696d95667.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '683d696d9b957.hwp', '아페이론 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 610-2 아페이론', '125만원', '125만원', '10만원', '계약완료', '원룸 [세미 분리형]', '원룸', '1개', '별도', '2.5만원', '2.5만원', '선착순 1대', '없음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/F0Ai3WWv', '15만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 40, 0),
(106, 'HOUSEM', 9, -1, 0, 0, '모닝빌 204호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-13 18:18:25', 89, '683d6f9caee2c4.49951941.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '683d6f9caf09b5.67615597.hwp', '모닝빌계약서).hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 184-9 모닝빌', '115만원', '115만원', '8만원', '계약완료', '원룸 ', '원룸', '1개', '별도', '2.5만원', '2.5만원', '선착순 1대', '없음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/F0Ai3WWv', '15만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 41, 0),
(108, 'HOUSEM', 9, -1, 0, 0, '메종빌 202호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-04 17:42:27', 114, '68400730ef5279.43858678.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6840e661898da8.43830701.hwp', '메종빌 계약서_2 라인 및 6층.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 229-1', '195만원', '195만원', '13만원', '계약완료', '오픈형', '투룸', '1개', '3', '2.5', '별도', '불가', '있음', '풀옵션', '25만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/5NMjTBLy', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 43, 0),
(109, 'HOUSEM', 9, -1, 0, 0, '메종빌 402호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-04 17:42:27', 119, '68400722df8403.21490392.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6840e668b73935.06480109.hwp', '메종빌 계약서_2 라인 및 6층.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 229-1', '195만원', '195만원', '13만원', '계약완료', '오픈형', '투룸', '1개', '3', '2.5', '별도', '불가', '있음', '풀옵션', '25만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/5NMjTBLy', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 44, 0),
(110, 'HOUSEM', 9, -1, 0, 0, '모던라이프 203호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;★ 건물관리회사 하우스맨입니다 ★&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 선착순 주차 1대 (주차리모컨 보증금 5만원)&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;span style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 전입신고 불가&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 계약 진행 시 기본 3개월 (1,2개월 불가)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 법인, 외국인, 50세 이상 계약 불가&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; font-size: 16px; font-family: &#039;Noto Sans KR&#039;, sans-serif;&quot;&gt;- 애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)&lt;/p&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-05 15:37:00', 126, '68413cb9e878c7.44501511.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '68413b15a393a.hwp', '모던라이프계약서.hwp', '68413cb9e8acc4.28481809.jpg', 'KakaoTalk_20250605_151749043_20.jpg', '68413cb9e8d9c5.43066393.jpg', 'KakaoTalk_20250605_151749043_26.jpg', '68413cb9e8fa07.73995320.jpg', 'KakaoTalk_20250605_151749043_11.jpg', '68413cb9e91c72.91072599.jpg', '68413cb9e93b36.68423262.jpg', '', '', '', '', '', 'KakaoTalk_20250605_151749043_10.jpg', 'KakaoTalk_20250605_151749043_05.jpg', 'KakaoTalk_20250508_141354522_17.jpg', 'KakaoTalk_20250508_141354522_03.jpg', 'KakaoTalk_20250508_141354522.jpg', '', '', 'N', NULL, NULL, '논현동', '', '논현동 68-19', '185만원', '185만원', '12만원', '계약완료', '분리형', '1룸', '1개', '3만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '무료 1대 (보증금 5만)', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/xk1MpgO8', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 45, 0),
(111, 'HOUSEM', 11, -1, 0, 0, '미래홈 2차 205호', '&lt;div&gt;&lt;p&gt;- 호실 확인 가능(세입자 거주 중)&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;- 7~8월 입주 가능&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;- 수도/인터넷/케이블 관리비 포함&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;- 퇴실 청소비 없음 ( 입주 시 상태로 원상복구 해야 함)&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: &#039;Noto Sans KR&#039;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;&quot;&gt;-&lt;/span&gt;&lt;span style=&quot;font-family: &#039;Noto Sans KR&#039;, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;애완동물 사육 금지&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;/div&gt;', '2025-06-05 15:52:43', 110, '68413ebbb04088.01985941.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '봉천동', '전세', '관악구 봉천동 934-15', '17,500 만원', '0만원', '8 만원', '계약가능', '투룸', '2개', '1개', '포함', '포함', '별도', '불가', '없음', '개별 냉난방, 에어컨, 세탁기, 냉장고, TV, 인덕션, 싱크대', '없음', '전세자금 대출 가능', 'https://naver.me/FRupVmGO', '법정수수료 지급', '애완동물 사육 절대 금지', 1, 46, 0),
(112, 'HOUSEM', 9, -1, 0, 0, '모던하우스 501호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-05 17:17:33', 127, '6841529d0e2244.66437149.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6841529d0e3f11.70977804.hwp', '모던하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 159-10', '125만원', '125만원', '10만원', '계약완료', '오픈형', '원룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/GtJcMRzc', '', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가(적발 시 바로 강제 퇴실 및 특수청소비 50만원 부과)', 0, 47, 0),
(113, 'HOUSEM', 11, -1, 0, 0, '신림프리미어 901호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;p&gt;계약서 대면 작성&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-09 13:57:47', 102, '684669cb7cfd67.35531351.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '684669cb8089b5.00900263.jpg', '1.jpg', '684669cb80afe5.96204136.jpg', '2.jpg', '684669cb80d1f5.80232439.jpg', '3.jpg', '684669cb813154.21325198.jpg', '684669cb8157f0.79994879.jpg', '684669cb818170.01915495.jpg', '684669cb81a061.57697737.jpg', '684669cb81c1f8.56664376.jpg', '684669cb81e365.37323349.jpg', '684669cb8205b5.59466679.jpg', '4.jpg', '5.jpg', '6.jpg', '7.jpg', '8.jpg', '9.jpg', '10.jpg', 'N', NULL, NULL, '신림동', '', '관악구 신림동 1432-84', '3,000만원', '105만원', '9만원', '계약완료', '분리형 룸', '2', '1개', '별도', '별도', '별도', '유료 1대 (7만원)', '있음', '에어컨, 세탁기, 냉장고, 인덕션 등', '18만원', '2년 계약 진행<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>1인 추가 관리비 3만', 'https://naver.me/G1mjq3r3', '15만원', '애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>법인, 외국인, 50세 이상 계약 불가', 1, 48, 0),
(114, 'HOUSEM', 9, -1, 0, 0, '모닝빌 305호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-09 00:00:00', 125, '68469b244d711.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '68469b244d8d8.hwp', '모닝빌계약서).hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 184-9', '120만원', '115만원', '8만원', '계약완료', '원룸 ', '원룸', '1개', '별도', '2.5만원', '2.5만원', '선착순 1대', '없음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/F0Ai3WWv', '15만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 49, 0),
(115, 'HOUSEM', 10, -1, 0, 0, '집현전빌딩 6층', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-10 09:59:59', 74, '6847838f3e9102.16491012.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '삼성동', '6층', '강남구 삼성동 25-3', '2500만원', '180만원', '20만원', '계약가능', '', '', '1개', '별도', '별도', '별도', '불가', '있음', '개별 냉난방기', '원상복구', '필라테스 등 업종 자유<br/>권리금 없음<br/> 입주 협의(즉시 입주 가능)<br/>배란다 있', 'https://naver.me/5lfupRWP', '0.9%', '', 0, 50, 0),
(116, 'HOUSEM', 9, -1, 0, 0, '메종빌 602호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-10 00:00:00', 93, '6847983ec1254.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6847983ec13a0.hwp', '메종빌 계약서_2 라인 및 6층.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 229-1', '175만원', '175만원', '13만원', '계약완료', '오픈형', '투룸', '1개', '3', '2.5', '별도', '불가', '있음', '풀옵션', '20만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/5NMjTBLy', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 51, 0),
(117, 'HOUSEM', 9, -1, 0, 0, '미래홈 102호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-11 00:00:00', 90, '6848c9be7e687.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6848c9be7e7dc.hwp', '미래홈 계약서.hwp', '', '1.jpg', '', '2.jpg', '', '3.jpg', '', '', '', '', '', '', '', '4.jpg', '5.jpg', '6.jpg', '', '', '', '', 'N', NULL, NULL, '봉천동', '', '관악구 봉천동 934-15 미래홈', '50만원', '30만원', '7만원', '계약완료', '오픈형', '원룸', '1개', '관리비 포함', '관리비 포함', '별도', '불가', '없음', '풀옵션', '8만원', '기본 3개월 계약(1,2개월 불가) / 1인 1거주 원칙<br/>전입신고 불가<br/>애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 30만원 청구)', 'https://naver.me/Fr0sr8ob', '11만원', '애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 30만원)<br/>전입신고 불가', 1, 52, 0),
(118, 'HOUSEM', 9, -1, 0, 0, '아페이론 202호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-05-13 18:18:25', 72, '6849228e01c27.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6849228e0234d.hwp', '아페이론 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 610-2 아페이론', '125만원', '125만원', '10만원', '계약완료', '오픈', '원룸', '1개', '별도', '2.5만원', '2.5만원', '선착순 1대', '없음', '풀옵션', '18만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/F0Ai3WWv', '15만', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 0, 53, 0),
(119, 'HOUSEM', 9, -1, 0, 0, '서우하우스 402호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;- 바로 앞&amp;nbsp; K타워 주차장 유료 이상시 50% 지원(월정액 15만원) ( 카니발,suv 등 대형 차량 주차 불가)&lt;/div&gt;\r\n&lt;br&gt;&lt;br&gt;\r\n&lt;div&gt;- 넷플릭스,유트브 시청 가능&amp;nbsp; 4K TV&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: &#039;Noto Sans KR&#039;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;- 신발장은 입구 왼쪽에 따로 있음&lt;/div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-12 00:00:00', 129, '684a6bdfa8bf13.61636035.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '684a6b524b313.hwp', '서우하우스 계약서.hwp', '684a6bc6c2e6d7.98476850.jpg', '1.jpg', '684a6bc6c30ea4.78924161.jpg', '2.jpg', '684a6bc6c32d19.08710448.jpg', '3.jpg', '684a6bc6c34d93.83416511.jpg', '684a6bc6c36b23.44510238.jpg', '684a6bc6c39282.08339594.jpg', '684a6bc6c3b6d3.35574487.jpg', '684a6bc6c3cfe1.48788184.jpg', '684a6bc6c3eb51.29136955.jpg', '', '4.jpg', '6.jpg', '7.jpg', '8.jpg', '9.jpg', '10.jpg', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 704-18 서우하우스', '285만원', '285만원', '15만원', '계약가능', '분리형', '투룸룸', '1개', '3.5만원', '3.5만원', '별도', '선착순 1대', '있음', '풀옵션', '30만원', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>선착순 주차 1대<br/>4K TV 구비[넷플릭스, 유튜브 시청 가능]', 'https://naver.me/IM4Srtt3', '25만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 54, 0),
(120, 'HOUSEM', 9, -1, 0, 0, '한스텔303호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-11 00:00:00', 99, '684bc7d1809025.28660812.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '684bc8ed04e2c1.49132106.hwp', '한스텔계약서.hwp', '', '1.jpg', '', '2.jpg', '', '3.jpg', '', '', '', '', '', '', '', '4.jpg', '5.jpg', '6.jpg', '', '', '', '', 'N', NULL, NULL, '신사동', '', '강남구 신사동 624-21번지', '105만원', '105만원', '8만원', '계약완료', '오픈형', '원룸', '1개', '2.5만원', '2.5만원', '별도', '불가', '없음', '풀옵션', '15만원', '기본 3개월 계약(1,2개월 불가) / 1인 1거주 원칙<br/>전입신고 불가<br/>애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 30만원 청구)', 'https://naver.me/5EnTSZ5Y', '15만원', '애완동물 사육 절대금지 (적발 시 바로 강제 퇴실 및 특수청소비 30만원)<br/>전입신고 불가', 0, 55, 0),
(121, 'HOUSEM', 9, -1, 0, 0, '서우하우스 301호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;- 바로 앞&amp;nbsp; K타워 주차장 유료 이상시 50% 지원(월정액 15만원) ( 카니발,suv 등 대형 차량 주차 불가)&lt;/div&gt;\r\n&lt;br&gt;&lt;br&gt;\r\n&lt;div&gt;- 넷플릭스,유트브 시청 가능&amp;nbsp; 4K TV&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-family: &#039;Noto Sans KR&#039;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;- 신발장은 입구 왼쪽에 따로 있음&lt;/div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-18 00:00:00', 74, '68521bbe669235.33663638.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '68521b2c97fbd.hwp', '서우하우스 계약서.hwp', '68521bcf220cd7.77508250.jpg', '1.jpg', '68521bcf22c1c6.31799923.jpg', '2.jpg', '68521bcf23d009.19542258.jpg', '3.jpg', '68521bcf24ac88.80652284.jpg', '68521bdce2bb97.96181314.jpg', '68521bdce33a77.63352391.jpg', '68521bdce3ec71.38551649.jpg', '68521bdce49962.07807808.jpg', NULL, '', '4.jpg', '5.jpg', '6.jpg', '7.jpg', '8.jpg', '10.jpg', '', 'N', NULL, NULL, '역삼동', '', '강남구 역삼동 704-18 서우하우스', '285만원', '285만원', '15만원', '계약가능', '분리형', '투룸룸', '1개', '3.5만원', '3.5만원', '별도', '선착순 1대', '있음', '풀옵션', '30만원', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>선착순 주차 1대<br/>4K TV 구비[넷플릭스, 유튜브 시청 가능]', 'https://naver.me/IM4Srtt3', '25만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 56, 0),
(122, 'HOUSEM', 9, -1, 0, 0, '다존하우스 309호', '&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;', '2025-06-20 00:00:00', 78, '6854e56326b48.png', 'N', 'N', 'N', NULL, '관리자', 'N', '6854e56326f80.hwp', '다존하우스 계약서.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '신대방동', '', '신대방동 690-21번지', '50만원', '40만원', '7만원', '계약완료', '오픈형', '1룸', '1개', '포함', '포함', '전기/가스 별도 (개인 신청 불가)', '주차불가', '있음', '풀옵션', '8만원', '기본 3개월 계약(1,2개월 불가)<br/>전입신고 절대 불가<br/>1인 1거주 원칙', 'https://naver.me/xk1MCLiy', '10만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 57, 0),
(123, 'HOUSEM', 9, -1, 0, 0, '메종빌 101호', '&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;', '2025-06-23 00:00:00', 26, '6858eccfb6ff5.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '6858ef549a3888.88049053.hwp', '메종빌_101호.hwp', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 229-1', '250만원', '250만', '15만원', '계약완료', '오픈형', '투룸', '1개', '3', '2.5', '별도', '외부 건물 주차', '있음', '풀옵션', '20만원', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)', 'https://naver.me/5NMjTBLy', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 58, 1),
(124, 'HOUSEM', 9, -1, 0, 0, '스타빌 301호', '&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', '2025-06-24 00:00:00', 3, '685a4500bebfa7.34438253.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '685a389dc0392.hwp', '스타빌계약서.hwp', '', 'KakaoTalk_20250508_153542737_01 (1).jpg', '', 'KakaoTalk_20250508_153542737_02.jpg', '', 'KakaoTalk_20250508_153542737_03.jpg', '', '', NULL, '', '', '', '', 'KakaoTalk_20250508_153542737_04.jpg', 'KakaoTalk_20250508_153542737_06.jpg', '', '', '', '', '', 'N', NULL, NULL, '역삼동', '', '역삼동 663-23번지', '75만원', '75만원', '8만원', '계약가능', '오픈형', '1룸', '1개', '2.5만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '주차불가', '없음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>주차 불가', 'https://naver.me/FK5wYCqu', '10만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 59, 1),
(125, 'HOUSEM', 9, -1, 0, 0, '토브미하우스 203호', '&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;div&gt;&lt;div&gt;\r\n&lt;!--?xml encoding=&quot;utf-8&quot; ?--&gt;&lt;div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;\r\n&lt;/div&gt;&lt;/div&gt;', '2025-06-24 00:00:00', 8, '685a44b6d5bb22.27420497.jpg', 'N', 'N', 'N', NULL, '관리자', 'N', '685a44681f6e9.hwp', '토브미하우스계약서.hwp', NULL, 'KakaoTalk_20250508_152751805_01.jpg', NULL, 'KakaoTalk_20250508_152751805_02.jpg', NULL, 'KakaoTalk_20250508_152751805_03.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '', 'KakaoTalk_20250508_152751805_04.jpg', 'KakaoTalk_20250508_152751805_07.jpg', 'KakaoTalk_20250508_152751805_05.jpg', 'KakaoTalk_20250508_152751805_08.jpg', 'KakaoTalk_20250508_152751805_09.jpg', 'KakaoTalk_20250508_152751805.jpg', '', 'N', NULL, NULL, '논현동', '', '강남구 논현동 219-26', '175만원', '175만원', '10만원', '계약가능', '원룸원거실', '1룸', '1개', '3만원', '2.5만원', '전기/가스 별도 (개인 신청 불가)', '선착순 주차 1대', '있음', '풀옵션', '', '계약 진행 시 기본 3개월 (1,2개월 불가)<br/>애완동물 사육 절대 금지 (적발 시 바로 강제 퇴실 및 특수청소비 50만원)<br/>선착순 주차 1대 가능', 'https://naver.me/GpCZKrZQ', '20만원', '전입신고 불가<br/>법인, 외국인, 50세 이상 계약 불가<br/>애완동물 사육 불가', 1, 60, 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_board_category`
--

CREATE TABLE `nb_board_category` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `board_no` int NOT NULL COMMENT '게시판 고유번호',
  `name` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '카테고리명',
  `sort_no` int NOT NULL DEFAULT '0' COMMENT '정렬번호'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_board_comment`
--

CREATE TABLE `nb_board_comment` (
  `no` int UNSIGNED NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `parent_no` int NOT NULL COMMENT '게시물 부모 번호',
  `user_no` int NOT NULL DEFAULT '0' COMMENT '회원 고유번호',
  `write_name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '작성자',
  `regdate` datetime NOT NULL COMMENT '등록일',
  `contents` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '내용',
  `isAdmin` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `pwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_board_lev_manage`
--

CREATE TABLE `nb_board_lev_manage` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `board_no` int NOT NULL COMMENT '게시판 고유번호',
  `lev_no` int NOT NULL COMMENT '등급 번호',
  `role_write` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '메뉴 쓰기 권한',
  `role_edit` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '메뉴 수정 권한',
  `role_view` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '메뉴 상세보기 권한',
  `role_list` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '메뉴 목록보기 권한',
  `role_delete` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '삭제 권한',
  `role_comment` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '댓글쓰기 권한'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 테이블의 덤프 데이터 `nb_board_lev_manage`
--

INSERT INTO `nb_board_lev_manage` (`no`, `sitekey`, `board_no`, `lev_no`, `role_write`, `role_edit`, `role_view`, `role_list`, `role_delete`, `role_comment`) VALUES
(1, 'HOUSEM', 3, 0, 'Y', 'N', 'Y', 'N', 'N', 'N'),
(3, 'HOUSEM', 12, 0, 'Y', 'N', 'Y', 'Y', 'N', 'N');

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_board_manage`
--

CREATE TABLE `nb_board_manage` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '게시판명',
  `skin` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '게시판종류(bbs : 일반, img : 갤러리 , web : 웹진)',
  `regdate` datetime NOT NULL COMMENT '등록일',
  `view_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `secret_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '비밀글기능 활성화',
  `sort_no` int NOT NULL DEFAULT '0' COMMENT '정렬번호',
  `list_size` int NOT NULL DEFAULT '20' COMMENT '목록출력수',
  `block_size` int NOT NULL DEFAULT '0' COMMENT '페이지 카운',
  `fileattach_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '파일첨부 여부',
  `fileattach_cnt` int NOT NULL DEFAULT '0' COMMENT '파일첨부 갯수',
  `comment_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '댓글기능 활성화',
  `category_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '카테고리 사용여부',
  `extra_match_field1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field4` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field6` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field7` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field8` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field9` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field10` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field11` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field12` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field13` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field14` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field15` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field16` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field17` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field18` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field19` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field20` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `extra_match_field21` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isOpen` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '공개게시판 여부 ',
  `view_skin` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'init'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 테이블의 덤프 데이터 `nb_board_manage`
--

INSERT INTO `nb_board_manage` (`no`, `sitekey`, `title`, `skin`, `regdate`, `view_yn`, `secret_yn`, `sort_no`, `list_size`, `block_size`, `fileattach_yn`, `fileattach_cnt`, `comment_yn`, `category_yn`, `extra_match_field1`, `extra_match_field2`, `extra_match_field3`, `extra_match_field4`, `extra_match_field5`, `extra_match_field6`, `extra_match_field7`, `extra_match_field8`, `extra_match_field9`, `extra_match_field10`, `extra_match_field11`, `extra_match_field12`, `extra_match_field13`, `extra_match_field14`, `extra_match_field15`, `extra_match_field16`, `extra_match_field17`, `extra_match_field18`, `extra_match_field19`, `extra_match_field20`, `extra_match_field21`, `isOpen`, `view_skin`) VALUES
(9, 'HOUSEM', '공실현황 - 단기임대', 'gal', '2025-04-18 14:15:44', 'Y', 'N', 0, 9, 0, 'N', 0, 'N', 'N', '동', '방 구분', '주소', '예치금', '월세', '관리비', '계약유무', '방구조', '룸', '화장실', '수도요금', '인터넷/TV', '전기/가스', '주차', '엘리베이터', '옵션', '퇴실청소비', '특이사항', '네이버지도링크', '중개수수료', '불가사항', 'Y', 'init'),
(10, 'HOUSEM', '공실현황 - 근생', 'gal', '2025-04-18 14:39:52', 'Y', 'N', 0, 9, 0, 'N', 0, 'N', 'N', '동', '층수', '주소', '보증금', '월세', '관리비', '계약유무', '방구조', '룸', '화장실', '수도요금', '인터넷/TV', '전기/가스', '주차', '엘리베이터', '옵션', '퇴실청소비', '특이사항', '네이버지도링크', '중개수수료', '불가사항', 'Y', 'init'),
(11, 'HOUSEM', '공실현황 - 일반주택', 'gal', '2025-04-18 14:42:32', 'Y', 'N', 0, 9, 0, 'N', 0, 'N', 'N', '동', '방 구분', '주소', '보증금', '월세', '관리비', '계약유무', '방구조', '룸', '화장실', '수도요금', '인터넷/TV', '전기/가스', '주차', '엘리베이터', '옵션', '퇴실청소비', '특이사항', '네이버지도링크', '중개수수료', '불가사항', 'Y', 'init'),
(12, 'HOUSEM', '뉴스', 'gal', '2025-06-26 14:45:11', 'Y', 'Y', 0, 1111, 0, 'Y', 0, 'Y', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'init');

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_counter`
--

CREATE TABLE `nb_counter` (
  `uid` int NOT NULL,
  `Connect_IP` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Time` int NOT NULL DEFAULT '0',
  `Year` int NOT NULL DEFAULT '0',
  `Month` int NOT NULL DEFAULT '0',
  `Day` int NOT NULL DEFAULT '0',
  `Hour` int NOT NULL DEFAULT '0',
  `Week` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `OS` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Connect_Route` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_counter_config`
--

CREATE TABLE `nb_counter_config` (
  `uid` int NOT NULL,
  `Cookie_Use` enum('A','T','O') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'A' COMMENT '중복 카운터 적용 여부',
  `Cookie_Term` int NOT NULL DEFAULT '0' COMMENT '쿠키 지속 시간',
  `Counter_Use` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '카운터 사용여부',
  `Now_Connect_Use` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y',
  `Route_Use` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '접속경로 저장여부',
  `Now_Connect_Term` int NOT NULL DEFAULT '0',
  `Total_Num` int NOT NULL DEFAULT '0' COMMENT '총 접속자 수',
  `Admin_Check_Use` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '관리자 접속 카운터 여부',
  `Admin_IP` char(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '관리자 아이피'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_counter_data`
--

CREATE TABLE `nb_counter_data` (
  `uid` int NOT NULL,
  `Year` int NOT NULL DEFAULT '0',
  `Month` int NOT NULL DEFAULT '0',
  `Day` int NOT NULL DEFAULT '0',
  `Hour00` int NOT NULL DEFAULT '0',
  `Hour01` int NOT NULL DEFAULT '0',
  `Hour02` int NOT NULL DEFAULT '0',
  `Hour03` int NOT NULL DEFAULT '0',
  `Hour04` int NOT NULL DEFAULT '0',
  `Hour05` int NOT NULL DEFAULT '0',
  `Hour06` int NOT NULL DEFAULT '0',
  `Hour07` int NOT NULL DEFAULT '0',
  `Hour08` int NOT NULL DEFAULT '0',
  `Hour09` int NOT NULL DEFAULT '0',
  `Hour10` int NOT NULL DEFAULT '0',
  `Hour11` int NOT NULL DEFAULT '0',
  `Hour12` int NOT NULL DEFAULT '0',
  `Hour13` int NOT NULL DEFAULT '0',
  `Hour14` int NOT NULL DEFAULT '0',
  `Hour15` int NOT NULL DEFAULT '0',
  `Hour16` int NOT NULL DEFAULT '0',
  `Hour17` int NOT NULL DEFAULT '0',
  `Hour18` int NOT NULL DEFAULT '0',
  `Hour19` int NOT NULL DEFAULT '0',
  `Hour20` int NOT NULL DEFAULT '0',
  `Hour21` int NOT NULL DEFAULT '0',
  `Hour22` int NOT NULL DEFAULT '0',
  `Hour23` int NOT NULL DEFAULT '0',
  `Week` char(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Visit_Num` int NOT NULL DEFAULT '0',
  `Counter_ID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_counter_route`
--

CREATE TABLE `nb_counter_route` (
  `uid` int NOT NULL,
  `Connect_Route` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Time` int NOT NULL DEFAULT '0',
  `BookMark` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `Visit_Num` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_data`
--

CREATE TABLE `nb_data` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `target` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '데이터가 사용될 곳 아이디 구분값',
  `contents` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `regdate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_inputs`
--

CREATE TABLE `nb_inputs` (
  `id` int NOT NULL,
  `type_id` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_input_options`
--

CREATE TABLE `nb_input_options` (
  `id` int NOT NULL,
  `input_id` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_input_types`
--

CREATE TABLE `nb_input_types` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `has_options` tinyint(1) NOT NULL DEFAULT '0',
  `is_textarea` tinyint(1) NOT NULL DEFAULT '0',
  `html_input_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_member`
--

CREATE TABLE `nb_member` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `lev` int NOT NULL DEFAULT '0' COMMENT '회원등급(코드 별도로 있음)기본 0',
  `campus` int NOT NULL DEFAULT '0' COMMENT '캠퍼스 코드 (별도 테이블)',
  `gubun` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '가입구분 (재학생, 학부모)',
  `grade` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '학년 KIN, G1~G12',
  `uid` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '아이디',
  `upwd` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '패스워드',
  `uname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '이름',
  `name_first` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '연락처',
  `hp` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '휴대폰번호',
  `hp_recieve_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '휴대폰 광고 동의',
  `email` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '이메일 주소',
  `email_recieve_yn` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '이메일 수신 동의',
  `zipcode` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '우편번호',
  `addr1` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '주소',
  `addr2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '상세 주소',
  `regdate` datetime NOT NULL COMMENT '등록일',
  `child_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '자녀이',
  `child_no` int NOT NULL DEFAULT '-1' COMMENT '자녀 회원 테이블 no 맵핑용 ',
  `name_last` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_member_level`
--

CREATE TABLE `nb_member_level` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `lev_name` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '등급명',
  `is_join` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N' COMMENT '회원가입시 부여 등급'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_popup`
--

CREATE TABLE `nb_popup` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `p_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '팝업 제목',
  `p_img` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '팝업 이미지',
  `p_target` enum('_self','_blank') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '_self' COMMENT '링크 오픈 형식',
  `p_link` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '팝업 링크',
  `p_is_link` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y' COMMENT '팝업 링크 사용 여부 (Y: 사용, N: 미사용)',
  `p_view` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'Y' COMMENT '노출 여부',
  `p_left` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '노출위치(px) 왼쪽으로부터',
  `p_top` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '노출위치(px) 위쪽으로부터',
  `p_idx` int DEFAULT '0' COMMENT '순서',
  `p_sdate` date DEFAULT NULL COMMENT '시작일 - 00 시부터 시작',
  `p_edate` date DEFAULT NULL COMMENT '종료일 - 23시 59분 59초까지',
  `p_rdate` datetime NOT NULL COMMENT '등록일',
  `p_none_limit` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'N' COMMENT '기한설정 Y:무기한 N:기한설',
  `p_loc` enum('P','M') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'P' COMMENT '노출위치 P : PC M : 모바일'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 테이블의 덤프 데이터 `nb_popup`
--

INSERT INTO `nb_popup` (`no`, `sitekey`, `p_title`, `p_img`, `p_target`, `p_link`, `p_is_link`, `p_view`, `p_left`, `p_top`, `p_idx`, `p_sdate`, `p_edate`, `p_rdate`, `p_none_limit`, `p_loc`) VALUES
(5, 'POWER9', '무료체험', '67ebcc744ec8c8.79779840.jpg', '_blank', 'http://pf.kakao.com/_xhSxoCG/chat', 'Y', 'Y', '', '', 1, NULL, NULL, '2025-03-26 18:12:29', 'Y', NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_request`
--

CREATE TABLE `nb_request` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '문의 유형',
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '이름',
  `phone` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '연락처',
  `birth` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '생년월일',
  `region` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '지역',
  `contents` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '내용',
  `regdate` datetime DEFAULT NULL COMMENT '등록일',
  `gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '성별',
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '지점',
  `answer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '수신방법',
  `major` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '분야'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- 테이블 구조 `nb_siteinfo`
--

CREATE TABLE `nb_siteinfo` (
  `no` int NOT NULL,
  `sitekey` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사이트 유니크 키',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '대표 연락처',
  `hp` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '대표 휴대폰',
  `fax` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '대표 팩스',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '대표 이메일',
  `customercenter_able_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '상담가능시간',
  `company_able_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '회사운영시간',
  `google_map_key` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '구글 지도 키',
  `logo_top` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '상단 로고 이미지',
  `logo_footer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 로고 이미지',
  `footer_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 사이트명',
  `footer_address` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 주소',
  `footer_phone` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 연락처',
  `footer_hp` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 휴대폰',
  `footer_fax` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 팩스',
  `footer_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 이메일',
  `footer_owner` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 대표자',
  `footer_ssn` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 사업자번호',
  `footer_policy_charger` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '하단 개인정보책임자',
  `meta_keywords` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `meta_description` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `meta_thumb` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '메타 이미지 파일',
  `meta_favicon_ico` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'ico 파'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 테이블의 덤프 데이터 `nb_siteinfo`
--

INSERT INTO `nb_siteinfo` (`no`, `sitekey`, `title`, `phone`, `hp`, `fax`, `email`, `customercenter_able_time`, `company_able_time`, `google_map_key`, `logo_top`, `logo_footer`, `footer_name`, `footer_address`, `footer_phone`, `footer_hp`, `footer_fax`, `footer_email`, `footer_owner`, `footer_ssn`, `footer_policy_charger`, `meta_keywords`, `meta_description`, `meta_thumb`, `meta_favicon_ico`) VALUES
(4, 'HOUSEM', 'HOUSEMAN', NULL, '', NULL, 'https://www.houseman.co.kr/', NULL, NULL, NULL, '680ed4919fdfb6.62255086.svg', '680ed4919ff1a3.35519088.svg', 'HOUSEMAN', '서울시 강남구 학동로8길 9, 5층', '1544-4150', NULL, NULL, 'rokmc842@hanmail.net', '박종호', '206-16-25497', NULL, '하우스맨 houseman 건물관리 강남건물관리 풀옵션관리 단기임대관리 건물시설관리 마포건물관리 강동건물관리 관악건물관리 서초건물관리 송파건물관리', '서울 강남 중심, 15년 노하우의 건물 관리 전문기업 하우스맨은 중소형 빌딩, 임대주택, 비상주 단지까지 종합적으로 관리합니다.', '6801dedc925243.09529731.jpg', '6801dedc926078.45473336.svg');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `nb_admin`
--
ALTER TABLE `nb_admin`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_banner`
--
ALTER TABLE `nb_banner`
  ADD PRIMARY KEY (`no`) USING BTREE,
  ADD KEY `b_loc` (`b_loc`) USING BTREE;

--
-- 테이블의 인덱스 `nb_board`
--
ALTER TABLE `nb_board`
  ADD PRIMARY KEY (`no`) USING BTREE,
  ADD KEY `IDX_NB_BOARD4` (`sitekey`,`board_no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_board_category`
--
ALTER TABLE `nb_board_category`
  ADD PRIMARY KEY (`no`) USING BTREE,
  ADD KEY `IDX_NB_BOARD_CATEGORY` (`board_no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_board_comment`
--
ALTER TABLE `nb_board_comment`
  ADD PRIMARY KEY (`no`) USING BTREE,
  ADD KEY `IDX_NB_BOARD_COMMENT` (`parent_no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_board_lev_manage`
--
ALTER TABLE `nb_board_lev_manage`
  ADD PRIMARY KEY (`no`) USING BTREE,
  ADD KEY `IDX_NB_BOARD_LEV_MANAGE` (`board_no`,`lev_no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_board_manage`
--
ALTER TABLE `nb_board_manage`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_counter`
--
ALTER TABLE `nb_counter`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 테이블의 인덱스 `nb_counter_config`
--
ALTER TABLE `nb_counter_config`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 테이블의 인덱스 `nb_counter_data`
--
ALTER TABLE `nb_counter_data`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 테이블의 인덱스 `nb_counter_route`
--
ALTER TABLE `nb_counter_route`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 테이블의 인덱스 `nb_data`
--
ALTER TABLE `nb_data`
  ADD PRIMARY KEY (`no`) USING BTREE,
  ADD KEY `IDX_NB_DATA1` (`sitekey`,`target`) USING BTREE;

--
-- 테이블의 인덱스 `nb_inputs`
--
ALTER TABLE `nb_inputs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_input_type` (`type_id`);

--
-- 테이블의 인덱스 `nb_input_options`
--
ALTER TABLE `nb_input_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_input_option_value` (`input_id`,`value`);

--
-- 테이블의 인덱스 `nb_input_types`
--
ALTER TABLE `nb_input_types`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `nb_member`
--
ALTER TABLE `nb_member`
  ADD PRIMARY KEY (`no`) USING BTREE,
  ADD KEY `IDX_NB_MEMBER` (`lev`,`campus`) USING BTREE;

--
-- 테이블의 인덱스 `nb_member_level`
--
ALTER TABLE `nb_member_level`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_popup`
--
ALTER TABLE `nb_popup`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_request`
--
ALTER TABLE `nb_request`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- 테이블의 인덱스 `nb_siteinfo`
--
ALTER TABLE `nb_siteinfo`
  ADD PRIMARY KEY (`no`) USING BTREE;

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `nb_admin`
--
ALTER TABLE `nb_admin`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 테이블의 AUTO_INCREMENT `nb_banner`
--
ALTER TABLE `nb_banner`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 테이블의 AUTO_INCREMENT `nb_board`
--
ALTER TABLE `nb_board`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- 테이블의 AUTO_INCREMENT `nb_board_category`
--
ALTER TABLE `nb_board_category`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 테이블의 AUTO_INCREMENT `nb_board_comment`
--
ALTER TABLE `nb_board_comment`
  MODIFY `no` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 테이블의 AUTO_INCREMENT `nb_board_lev_manage`
--
ALTER TABLE `nb_board_lev_manage`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 테이블의 AUTO_INCREMENT `nb_board_manage`
--
ALTER TABLE `nb_board_manage`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 테이블의 AUTO_INCREMENT `nb_counter`
--
ALTER TABLE `nb_counter`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_counter_config`
--
ALTER TABLE `nb_counter_config`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_counter_data`
--
ALTER TABLE `nb_counter_data`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_counter_route`
--
ALTER TABLE `nb_counter_route`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_data`
--
ALTER TABLE `nb_data`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 테이블의 AUTO_INCREMENT `nb_inputs`
--
ALTER TABLE `nb_inputs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_input_options`
--
ALTER TABLE `nb_input_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_input_types`
--
ALTER TABLE `nb_input_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_member`
--
ALTER TABLE `nb_member`
  MODIFY `no` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_member_level`
--
ALTER TABLE `nb_member_level`
  MODIFY `no` int NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `nb_popup`
--
ALTER TABLE `nb_popup`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 테이블의 AUTO_INCREMENT `nb_request`
--
ALTER TABLE `nb_request`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 테이블의 AUTO_INCREMENT `nb_siteinfo`
--
ALTER TABLE `nb_siteinfo`
  MODIFY `no` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `nb_inputs`
--
ALTER TABLE `nb_inputs`
  ADD CONSTRAINT `fk_input_type` FOREIGN KEY (`type_id`) REFERENCES `nb_input_types` (`id`);

--
-- 테이블의 제약사항 `nb_input_options`
--
ALTER TABLE `nb_input_options`
  ADD CONSTRAINT `fk_input_option_input` FOREIGN KEY (`input_id`) REFERENCES `nb_inputs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
