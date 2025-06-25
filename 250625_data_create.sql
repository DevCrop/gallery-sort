CREATE TABLE `nb_admin` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`uid` VARCHAR(25) NOT NULL COMMENT '아이디' COLLATE 'utf8mb3_general_ci',
	`upwd` VARCHAR(64) NOT NULL COMMENT '패스워드' COLLATE 'utf8mb3_general_ci',
	`uname` VARCHAR(25) NOT NULL COMMENT '관리자명' COLLATE 'utf8mb3_general_ci',
	`active_status` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '사용여부' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE
)
COMMENT='관리자 계정 관리'
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=2
;


CREATE TABLE `nb_banner` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`b_loc` VARCHAR(64) NOT NULL COMMENT '노출위치 main, main_top_right 등' COLLATE 'utf8mb3_general_ci',
	`b_img` VARCHAR(64) NOT NULL COMMENT '이미지파일명' COLLATE 'utf8mb3_general_ci',
	`b_link` VARCHAR(128) NOT NULL COMMENT '배너링크' COLLATE 'utf8mb3_general_ci',
	`b_target` ENUM('_none','_self','_blank') NOT NULL DEFAULT '_self' COMMENT '링크 형식' COLLATE 'utf8mb3_general_ci',
	`b_view` ENUM('Y','N') NOT NULL DEFAULT 'Y' COMMENT '관리자명' COLLATE 'utf8mb3_general_ci',
	`b_title` VARCHAR(200) NOT NULL COMMENT '배너 제목' COLLATE 'utf8mb3_general_ci',
	`b_idx` INT NOT NULL DEFAULT '0' COMMENT '순서',
	`b_none_limit` ENUM('Y','N') NOT NULL DEFAULT 'N' COMMENT '무기한 배너여부(Y:무기한, 기한)' COLLATE 'utf8mb3_general_ci',
	`b_sdate` DATE NULL DEFAULT NULL COMMENT '시작일 - 00 시부터 시작',
	`b_edate` DATE NULL DEFAULT NULL COMMENT '종료일 - 23시 59분 59초까지',
	`b_rdate` DATETIME NULL DEFAULT NULL COMMENT '배너등록일',
	`b_desc` VARCHAR(256) NULL DEFAULT NULL COMMENT '배너설명(필요한경우)' COLLATE 'utf8mb3_general_ci',
	`b_img_mobile` VARCHAR(64) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`b_contents` TEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE,
	INDEX `b_loc` (`b_loc`) USING BTREE
)
COMMENT='배너 관리'
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=14
;


CREATE TABLE `nb_board` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`board_no` INT NOT NULL COMMENT '게시판 고유번호',
	`user_no` INT NOT NULL DEFAULT '0' COMMENT '회원 고유번호',
	`category_no` INT NOT NULL DEFAULT '0' COMMENT '게시판 카테고리 번호',
	`comment_cnt` INT NOT NULL DEFAULT '0' COMMENT '등록된 댓글수',
	`title` VARCHAR(200) NOT NULL COMMENT '제목' COLLATE 'utf8mb3_general_ci',
	`contents` TEXT NOT NULL COMMENT '내용' COLLATE 'utf8mb3_general_ci',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	`read_cnt` INT NOT NULL DEFAULT '0' COMMENT '조회수',
	`thumb_image` VARCHAR(125) NULL DEFAULT NULL COMMENT '썸네일 이미지(게시판에 따라 필요한 경우)' COLLATE 'utf8mb3_general_ci',
	`is_admin_writed` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '관리자작성 여부' COLLATE 'utf8mb3_general_ci',
	`is_notice` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '공지여부' COLLATE 'utf8mb3_general_ci',
	`is_secret` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '비밀글여부' COLLATE 'utf8mb3_general_ci',
	`secret_pwd` VARCHAR(64) NULL DEFAULT NULL COMMENT '비밀글 비밀번호' COLLATE 'utf8mb3_general_ci',
	`write_name` VARCHAR(25) NULL DEFAULT NULL COMMENT '작성자' COLLATE 'utf8mb3_general_ci',
	`isFile` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '첨부파일이 있는지 여부' COLLATE 'utf8mb3_general_ci',
	`file_attach_1` VARCHAR(125) NULL DEFAULT NULL COMMENT '파일첨부' COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_1` VARCHAR(125) NULL DEFAULT NULL COMMENT '원래 파일명' COLLATE 'utf8mb3_general_ci',
	`file_attach_2` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_2` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_3` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_3` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_4` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_4` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_5` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_6` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_7` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_8` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_9` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_10` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_11` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_5` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_6` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_7` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_8` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_9` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_10` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`file_attach_origin_11` VARCHAR(125) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`is_admin_comment_yn` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '관리자가 댓글 달았는지 여부 ' COLLATE 'utf8mb3_general_ci',
	`direct_url` VARCHAR(255) NULL DEFAULT NULL COMMENT '바로연결할 URL' COLLATE 'utf8mb3_general_ci',
	`filedown_pwd` VARCHAR(64) NULL DEFAULT NULL COMMENT '파일다운로드 비밀번' COLLATE 'utf8mb3_general_ci',
	`extra1` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra2` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra3` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra4` VARCHAR(2100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra5` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra6` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra7` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra8` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra9` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra10` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra11` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra12` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra13` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra14` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra15` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra16` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra17` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra18` VARCHAR(2500) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra19` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra20` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra21` VARCHAR(2500) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`is_visible` VARCHAR(2500) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE,
	INDEX `IDX_NB_BOARD4` (`sitekey`, `board_no`) USING BTREE
)
COMMENT='통합 게시판'
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=126
;


CREATE TABLE `nb_board_category` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`board_no` INT NOT NULL COMMENT '게시판 고유번호',
	`name` VARCHAR(125) NOT NULL COMMENT '카테고리명' COLLATE 'utf8mb3_general_ci',
	`sort_no` INT NOT NULL DEFAULT '0' COMMENT '정렬번호',
	PRIMARY KEY (`no`) USING BTREE,
	INDEX `IDX_NB_BOARD_CATEGORY` (`board_no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=7
;


CREATE TABLE `nb_board_comment` (
	`no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`parent_no` INT NOT NULL COMMENT '게시물 부모 번호',
	`user_no` INT NOT NULL DEFAULT '0' COMMENT '회원 고유번호',
	`write_name` VARCHAR(25) NULL DEFAULT NULL COMMENT '작성자' COLLATE 'utf8mb3_general_ci',
	`regdate` DATETIME NOT NULL COMMENT '등록일',
	`contents` TEXT NOT NULL COMMENT '내용' COLLATE 'utf8mb3_general_ci',
	`isAdmin` VARCHAR(1) NOT NULL DEFAULT 'N' COLLATE 'utf8mb3_general_ci',
	`pwd` VARCHAR(64) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE,
	INDEX `IDX_NB_BOARD_COMMENT` (`parent_no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=2
;


CREATE TABLE `nb_board_lev_manage` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`board_no` INT NOT NULL COMMENT '게시판 고유번호',
	`lev_no` INT NOT NULL COMMENT '등급 번호',
	`role_write` ENUM('N','Y') NOT NULL DEFAULT 'Y' COMMENT '메뉴 쓰기 권한' COLLATE 'utf8mb3_general_ci',
	`role_edit` ENUM('N','Y') NOT NULL DEFAULT 'Y' COMMENT '메뉴 수정 권한' COLLATE 'utf8mb3_general_ci',
	`role_view` ENUM('N','Y') NOT NULL DEFAULT 'Y' COMMENT '메뉴 상세보기 권한' COLLATE 'utf8mb3_general_ci',
	`role_list` ENUM('N','Y') NOT NULL DEFAULT 'Y' COMMENT '메뉴 목록보기 권한' COLLATE 'utf8mb3_general_ci',
	`role_delete` ENUM('N','Y') NOT NULL DEFAULT 'Y' COMMENT '삭제 권한' COLLATE 'utf8mb3_general_ci',
	`role_comment` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '댓글쓰기 권한' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE,
	INDEX `IDX_NB_BOARD_LEV_MANAGE` (`board_no`, `lev_no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=2
;


CREATE TABLE `nb_board_manage` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`title` VARCHAR(50) NOT NULL COMMENT '게시판명' COLLATE 'utf8mb3_general_ci',
	`skin` VARCHAR(3) NOT NULL COMMENT '게시판종류(bbs : 일반, img : 갤러리 , web : 웹진)' COLLATE 'utf8mb3_general_ci',
	`regdate` DATETIME NOT NULL COMMENT '등록일',
	`top_banner_image` VARCHAR(255) NULL DEFAULT NULL COMMENT '상단배너 이미지' COLLATE 'utf8mb3_general_ci',
	`contents` TEXT NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`view_yn` ENUM('N','Y') NOT NULL DEFAULT 'Y' COMMENT '사용여부' COLLATE 'utf8mb3_general_ci',
	`secret_yn` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '비밀글기능 활성화' COLLATE 'utf8mb3_general_ci',
	`sort_no` INT NOT NULL DEFAULT '0' COMMENT '정렬번호',
	`list_size` INT NOT NULL DEFAULT '20' COMMENT '목록출력수',
	`block_size` INT NOT NULL DEFAULT '0' COMMENT '페이지 카운',
	`fileattach_yn` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '파일첨부 여부' COLLATE 'utf8mb3_general_ci',
	`fileattach_cnt` INT NOT NULL DEFAULT '0' COMMENT '파일첨부 갯수',
	`comment_yn` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '댓글기능 활성화' COLLATE 'utf8mb3_general_ci',
	`depth1` VARCHAR(20) NULL DEFAULT NULL COMMENT '1뎁스' COLLATE 'utf8mb3_general_ci',
	`depth2` VARCHAR(20) NULL DEFAULT NULL COMMENT '2뎁스' COLLATE 'utf8mb3_general_ci',
	`depth3` VARCHAR(20) NULL DEFAULT NULL COMMENT '3뎁스' COLLATE 'utf8mb3_general_ci',
	`lnb_path` VARCHAR(50) NULL DEFAULT NULL COMMENT '좌측 메뉴 경로' COLLATE 'utf8mb3_general_ci',
	`category_yn` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '카테고리 사용여부' COLLATE 'utf8mb3_general_ci',
	`extra_match_field1` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field2` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field3` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field4` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field5` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field6` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field7` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field8` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field9` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field10` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field11` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field12` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field13` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field14` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field15` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field16` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field17` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field18` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field19` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field20` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`extra_match_field21` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`isOpen` VARCHAR(1) NOT NULL DEFAULT 'Y' COMMENT '공개게시판 여부 ' COLLATE 'utf8mb3_general_ci',
	`view_skin` VARCHAR(4) NOT NULL DEFAULT 'init' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=12
;


CREATE TABLE `nb_counter` (
	`uid` INT NOT NULL AUTO_INCREMENT,
	`Connect_IP` VARCHAR(30) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`id` VARCHAR(30) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`Time` INT NOT NULL DEFAULT '0',
	`Year` INT NOT NULL DEFAULT '0',
	`Month` INT NOT NULL DEFAULT '0',
	`Day` INT NOT NULL DEFAULT '0',
	`Hour` INT NOT NULL DEFAULT '0',
	`Week` CHAR(3) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`OS` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`Browser` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`Connect_Route` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`uid`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
;


CREATE TABLE `nb_counter_config` (
	`uid` INT NOT NULL AUTO_INCREMENT,
	`Cookie_Use` ENUM('A','T','O') NOT NULL DEFAULT 'A' COMMENT '중복 카운터 적용 여부' COLLATE 'utf8mb3_general_ci',
	`Cookie_Term` INT NOT NULL DEFAULT '0' COMMENT '쿠키 지속 시간',
	`Counter_Use` ENUM('Y','N') NOT NULL DEFAULT 'Y' COMMENT '카운터 사용여부' COLLATE 'utf8mb3_general_ci',
	`Now_Connect_Use` ENUM('Y','N') NOT NULL DEFAULT 'Y' COLLATE 'utf8mb3_general_ci',
	`Route_Use` ENUM('Y','N') NOT NULL DEFAULT 'Y' COMMENT '접속경로 저장여부' COLLATE 'utf8mb3_general_ci',
	`Now_Connect_Term` INT NOT NULL DEFAULT '0',
	`Total_Num` INT NOT NULL DEFAULT '0' COMMENT '총 접속자 수',
	`Admin_Check_Use` ENUM('Y','N') NOT NULL DEFAULT 'N' COMMENT '관리자 접속 카운터 여부' COLLATE 'utf8mb3_general_ci',
	`Admin_IP` CHAR(30) NOT NULL COMMENT '관리자 아이피' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`uid`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
;


CREATE TABLE `nb_counter_data` (
	`uid` INT NOT NULL AUTO_INCREMENT,
	`Year` INT NOT NULL DEFAULT '0',
	`Month` INT NOT NULL DEFAULT '0',
	`Day` INT NOT NULL DEFAULT '0',
	`Hour00` INT NOT NULL DEFAULT '0',
	`Hour01` INT NOT NULL DEFAULT '0',
	`Hour02` INT NOT NULL DEFAULT '0',
	`Hour03` INT NOT NULL DEFAULT '0',
	`Hour04` INT NOT NULL DEFAULT '0',
	`Hour05` INT NOT NULL DEFAULT '0',
	`Hour06` INT NOT NULL DEFAULT '0',
	`Hour07` INT NOT NULL DEFAULT '0',
	`Hour08` INT NOT NULL DEFAULT '0',
	`Hour09` INT NOT NULL DEFAULT '0',
	`Hour10` INT NOT NULL DEFAULT '0',
	`Hour11` INT NOT NULL DEFAULT '0',
	`Hour12` INT NOT NULL DEFAULT '0',
	`Hour13` INT NOT NULL DEFAULT '0',
	`Hour14` INT NOT NULL DEFAULT '0',
	`Hour15` INT NOT NULL DEFAULT '0',
	`Hour16` INT NOT NULL DEFAULT '0',
	`Hour17` INT NOT NULL DEFAULT '0',
	`Hour18` INT NOT NULL DEFAULT '0',
	`Hour19` INT NOT NULL DEFAULT '0',
	`Hour20` INT NOT NULL DEFAULT '0',
	`Hour21` INT NOT NULL DEFAULT '0',
	`Hour22` INT NOT NULL DEFAULT '0',
	`Hour23` INT NOT NULL DEFAULT '0',
	`Week` CHAR(3) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`Visit_Num` INT NOT NULL DEFAULT '0',
	`Counter_ID` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`uid`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
;


CREATE TABLE `nb_counter_route` (
	`uid` INT NOT NULL AUTO_INCREMENT,
	`Connect_Route` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`Time` INT NOT NULL DEFAULT '0',
	`BookMark` CHAR(1) NOT NULL DEFAULT '' COLLATE 'utf8mb3_general_ci',
	`Visit_Num` INT NOT NULL DEFAULT '0',
	PRIMARY KEY (`uid`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
;


CREATE TABLE `nb_data` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`target` VARCHAR(25) NOT NULL COMMENT '데이터가 사용될 곳 아이디 구분값' COLLATE 'utf8mb3_general_ci',
	`contents` TEXT NOT NULL COLLATE 'utf8mb3_general_ci',
	`regdate` DATETIME NOT NULL,
	PRIMARY KEY (`no`) USING BTREE,
	INDEX `IDX_NB_DATA1` (`sitekey`, `target`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=2
;


CREATE TABLE `nb_member` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`lev` INT NOT NULL DEFAULT '0' COMMENT '회원등급(코드 별도로 있음)기본 0',
	`campus` INT NOT NULL DEFAULT '0' COMMENT '캠퍼스 코드 (별도 테이블)',
	`gubun` VARCHAR(3) NOT NULL COMMENT '가입구분 (재학생, 학부모)' COLLATE 'utf8mb3_general_ci',
	`grade` VARCHAR(4) NOT NULL COMMENT '학년 KIN, G1~G12' COLLATE 'utf8mb3_general_ci',
	`uid` VARCHAR(30) NOT NULL COMMENT '아이디' COLLATE 'utf8mb3_general_ci',
	`upwd` VARCHAR(64) NOT NULL COMMENT '패스워드' COLLATE 'utf8mb3_general_ci',
	`uname` VARCHAR(30) NOT NULL COMMENT '이름' COLLATE 'utf8mb3_general_ci',
	`name_first` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`phone` VARCHAR(15) NULL DEFAULT NULL COMMENT '연락처' COLLATE 'utf8mb3_general_ci',
	`hp` VARCHAR(15) NOT NULL COMMENT '휴대폰번호' COLLATE 'utf8mb3_general_ci',
	`hp_recieve_yn` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '휴대폰 광고 동의' COLLATE 'utf8mb3_general_ci',
	`email` VARCHAR(125) NOT NULL COMMENT '이메일 주소' COLLATE 'utf8mb3_general_ci',
	`email_recieve_yn` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '이메일 수신 동의' COLLATE 'utf8mb3_general_ci',
	`zipcode` VARCHAR(6) NULL DEFAULT NULL COMMENT '우편번호' COLLATE 'utf8mb3_general_ci',
	`addr1` VARCHAR(50) NULL DEFAULT NULL COMMENT '주소' COLLATE 'utf8mb3_general_ci',
	`addr2` VARCHAR(100) NULL DEFAULT NULL COMMENT '상세 주소' COLLATE 'utf8mb3_general_ci',
	`regdate` DATETIME NOT NULL COMMENT '등록일',
	`child_name` VARCHAR(20) NULL DEFAULT NULL COMMENT '자녀이' COLLATE 'utf8mb3_general_ci',
	`child_no` INT NOT NULL DEFAULT '-1' COMMENT '자녀 회원 테이블 no 맵핑용 ',
	`name_last` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE,
	INDEX `IDX_NB_MEMBER` (`lev`, `campus`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
;


CREATE TABLE `nb_member_level` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`lev_name` VARCHAR(125) NOT NULL COMMENT '등급명' COLLATE 'utf8mb3_general_ci',
	`is_join` ENUM('N','Y') NOT NULL DEFAULT 'N' COMMENT '회원가입시 부여 등급' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
;


CREATE TABLE `nb_popup` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
  `p_title` VARCHAR(50) NOT NULL COMMENT '팝업 제목' COLLATE 'utf8mb3_general_ci',
  `p_img` VARCHAR(128) NOT NULL COMMENT '팝업 이미지' COLLATE 'utf8mb3_general_ci',
  `p_target` ENUM('_self','_blank') NULL DEFAULT '_self' COMMENT '링크 오픈 형식' COLLATE 'utf8mb3_general_ci',
  `p_link` VARCHAR(128) NULL DEFAULT NULL COMMENT '팝업 링크' COLLATE 'utf8mb3_general_ci',
  `p_is_link` ENUM('Y','N') NOT NULL DEFAULT 'Y' COMMENT '팝업 링크 사용 여부 (Y: 사용, N: 미사용)' COLLATE 'utf8mb3_general_ci',
  `p_view` ENUM('Y','N') NULL DEFAULT 'Y' COMMENT '노출 여부' COLLATE 'utf8mb3_general_ci',
  `p_left` VARCHAR(4) NULL DEFAULT NULL COMMENT '노출위치(px) 왼쪽으로부터' COLLATE 'utf8mb3_general_ci',
  `p_top` VARCHAR(4) NULL DEFAULT NULL COMMENT '노출위치(px) 위쪽으로부터' COLLATE 'utf8mb3_general_ci',
  `p_idx` INT NULL DEFAULT '0' COMMENT '순서',
  `p_sdate` DATE NULL DEFAULT NULL COMMENT '시작일 - 00 시부터 시작',
  `p_edate` DATE NULL DEFAULT NULL COMMENT '종료일 - 23시 59분 59초까지',
  `p_rdate` DATETIME NOT NULL COMMENT '등록일',
  `p_none_limit` ENUM('N','Y') NULL DEFAULT 'N' COMMENT '기한설정 Y:무기한 N:기한설' COLLATE 'utf8mb3_general_ci',
  `p_loc` ENUM('P','M') NULL DEFAULT 'P' COMMENT '노출위치 P : PC M : 모바일' COLLATE 'utf8mb3_general_ci',
  PRIMARY KEY (`no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=7;



CREATE TABLE `nb_request` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`type` VARCHAR(50) NULL DEFAULT NULL COMMENT '문의 유형' COLLATE 'utf8mb3_general_ci',
	`name` VARCHAR(30) NULL DEFAULT NULL COMMENT '이름' COLLATE 'utf8mb3_general_ci',
	`phone` VARCHAR(13) NULL DEFAULT NULL COMMENT '연락처' COLLATE 'utf8mb3_general_ci',
	`birth` VARCHAR(50) NULL DEFAULT NULL COMMENT '생년월일' COLLATE 'utf8mb3_general_ci',
	`region` VARCHAR(50) NULL DEFAULT NULL COMMENT '지역' COLLATE 'utf8mb3_general_ci',
	`contents` VARCHAR(4000) NULL DEFAULT NULL COMMENT '내용' COLLATE 'utf8mb3_general_ci',
	`regdate` DATETIME NULL DEFAULT NULL COMMENT '등록일',
	`gender` VARCHAR(255) NULL DEFAULT NULL COMMENT '성별' COLLATE 'utf8mb3_general_ci',
	`city` VARCHAR(255) NULL DEFAULT NULL COMMENT '지점' COLLATE 'utf8mb3_general_ci',
	`answer` VARCHAR(255) NULL DEFAULT NULL COMMENT '수신방법' COLLATE 'utf8mb3_general_ci',
	`major` VARCHAR(255) NULL DEFAULT NULL COMMENT '분야' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=27
;


CREATE TABLE `nb_siteinfo` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`sitekey` VARCHAR(6) NOT NULL COMMENT '사이트 유니크 키' COLLATE 'utf8mb3_general_ci',
	`title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`phone` VARCHAR(50) NULL DEFAULT NULL COMMENT '대표 연락처' COLLATE 'utf8mb3_general_ci',
	`hp` VARCHAR(13) NULL DEFAULT NULL COMMENT '대표 휴대폰' COLLATE 'utf8mb3_general_ci',
	`fax` VARCHAR(13) NULL DEFAULT NULL COMMENT '대표 팩스' COLLATE 'utf8mb3_general_ci',
	`email` VARCHAR(50) NULL DEFAULT NULL COMMENT '대표 이메일' COLLATE 'utf8mb3_general_ci',
	`customercenter_able_time` VARCHAR(50) NULL DEFAULT NULL COMMENT '상담가능시간' COLLATE 'utf8mb3_general_ci',
	`company_able_time` VARCHAR(50) NULL DEFAULT NULL COMMENT '회사운영시간' COLLATE 'utf8mb3_general_ci',
	`google_map_key` VARCHAR(256) NULL DEFAULT NULL COMMENT '구글 지도 키' COLLATE 'utf8mb3_general_ci',
	`logo_top` VARCHAR(50) NULL DEFAULT NULL COMMENT '상단 로고 이미지' COLLATE 'utf8mb3_general_ci',
	`logo_footer` VARCHAR(50) NULL DEFAULT NULL COMMENT '하단 로고 이미지' COLLATE 'utf8mb3_general_ci',
	`footer_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '하단 사이트명' COLLATE 'utf8mb3_general_ci',
	`footer_address` VARCHAR(125) NULL DEFAULT NULL COMMENT '하단 주소' COLLATE 'utf8mb3_general_ci',
	`footer_phone` VARCHAR(13) NULL DEFAULT NULL COMMENT '하단 연락처' COLLATE 'utf8mb3_general_ci',
	`footer_hp` VARCHAR(50) NULL DEFAULT NULL COMMENT '하단 휴대폰' COLLATE 'utf8mb3_general_ci',
	`footer_fax` VARCHAR(13) NULL DEFAULT NULL COMMENT '하단 팩스' COLLATE 'utf8mb3_general_ci',
	`footer_email` VARCHAR(50) NULL DEFAULT NULL COMMENT '하단 이메일' COLLATE 'utf8mb3_general_ci',
	`footer_owner` VARCHAR(15) NULL DEFAULT NULL COMMENT '하단 대표자' COLLATE 'utf8mb3_general_ci',
	`footer_ssn` VARCHAR(13) NULL DEFAULT NULL COMMENT '하단 사업자번호' COLLATE 'utf8mb3_general_ci',
	`footer_policy_charger` VARCHAR(50) NULL DEFAULT NULL COMMENT '하단 개인정보책임자' COLLATE 'utf8mb3_general_ci',
	`meta_keywords` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`meta_description` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`meta_thumb` VARCHAR(50) NULL DEFAULT NULL COMMENT '메타 이미지 파일' COLLATE 'utf8mb3_general_ci',
	`meta_favicon_ico` VARCHAR(50) NULL DEFAULT NULL COMMENT 'ico 파' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`no`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=MyISAM
AUTO_INCREMENT=5
;
