function header() {}
const $header = $('.no-header');

$('.no-header__gnb').mouseover(function () {
  $('.no-header').addClass('active');
});

$('.no-header__gnb').mouseleave(function () {
  $('.no-header').removeClass('active');
});

// 모바일 햄버거 버튼 클릭 시
$('.no-mobile_toggle_btn').click(function () {
  $('.no-header-m-div').toggleClass('add');
  $('.no-header').addClass('bg');
  // 기존 toggle 기능 (햄버거 버튼과 메뉴 보이기/숨기기)
  $('.no-mobile_toggle_btn--line').toggleClass('active');
  $('body').css('overflow', 'hidden');
});

// 모바일 gnb 클릭 시 lnb visible
$('.no-header__gnb-m > li, .no-footer__gnb-m > li').click(function (e) {
  const $this = $(this);
  const subMenu = $this.find('ul').first(); // 하위 ul
  const arrowIcon = $this.find('.fa-angle-up').first();

  // 2depth 내부를 클릭한 경우엔 아무것도 하지 않음 → 기본 링크 이동
  if ($(e.target).closest('ul').is(subMenu)) {
    return;
  }

  // 하위 메뉴가 없으면 아무것도 하지 않음
  if (subMenu.length === 0) return;

  const subItemCount = subMenu.children('li').length;

  if (subItemCount >= 2) {
    e.preventDefault(); // 슬라이드할 경우에만 링크 막음

    const isOpen = subMenu.is(':visible');

    $('.no-header__gnb-m ul, .no-footer__gnb-m ul').slideUp();
    $('.fa-angle-up').removeClass('active');

    if (!isOpen) {
      subMenu.slideDown();
      arrowIcon.addClass('active');
    }
  }
  // subItemCount가 1개 이하일 경우 → 링크 이동 (e.preventDefault() 안 함)
});



const isMainPage = $('.no-sub-visual').length > 0;
if (!isMainPage) {
  $('.no-header__gnb').mouseover(function () {
    $('.no-header').addClass('active');
  });

  $('.no-header__gnb').mouseleave(function () {
    $('.no-header').removeClass('active');
    if ($('.no-header-m-div').hasClass('add')) {
      $header.addClass('bg');
      // ✅ 하지만 메뉴가 열려 있으면 active 유지
    }
  });
  $(window).on('scroll', function () {
    let scrollTop = $(window).scrollTop(); // 현재 스크롤 위치 확인
    const $header = $('.no-header'); // 헤더 선택
    const $menu = $('.no-header-m-div'); // 메뉴 선택

    if (scrollTop > 80) {
      // 스크롤이 80px 이상이면 bg 추가
      $header.addClass('bg');

      // 메뉴가 열려 있으면 active 유지
    } else if ($menu.hasClass('add')) {
      $header.addClass('bg');
      // ✅ 하지만 메뉴가 열려 있으면 active 유지
    } else {
      $header.removeClass('bg');
    }
  });
} else {
  // 서브 페이지일 경우 항상 active 상태 유지
  $('.no-header').addClass('bg');
}

export { header };
