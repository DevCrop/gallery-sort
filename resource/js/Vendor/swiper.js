function keyVisual() {
  var autoplayDelay = 4000; // 자동 슬라이드 시간 (ms)
  var slideSpeed = 1800; // 슬라이드 전환 속도

  var mswiper = new Swiper('.key-vs_slider', {
    loop: true, // 루프 활성화
    speed: slideSpeed, // 슬라이드 전환 속도
    effect: 'fade', // 슬라이드 대신 페이드 효과 적용
    fadeEffect: {
      crossFade: true, // 슬라이드가 자연스럽게 겹쳐지도록 설정
    },
    autoplay: {
      delay: autoplayDelay, // 자동 슬라이드 시간
      disableOnInteraction: false, // 사용자가 상호작용해도 유지
    },
    navigation: {
      nextEl: '.key-vs-n',
      prevEl: '.key-vs-p',
    },
    pagination: {
      el: '.swiper-pagination',
      type: 'fraction', // 프로그레스 바 형태의 페이지네이션
    },
  });
}

function gallSwiper() {
  var pswiper = new Swiper('.gall-swiper', {
    spaceBetween: 24,
    centeredSlides: false,
    speed: 1800, // 슬라이드 전환 속도
    slidesPerView: 'auto',
    navigation: {
      nextEl: '.gall-next',
      prevEl: '.gall-prev',
    },
    breakpoints: {
      320: {
        slidesPerView: 'auto',
        spaceBetween: 32,
      },
      544: {
        slidesPerView: 'auto',
        spaceBetween: 32,
      },
      1024: {
        slidesPerView: 'auto',
        spaceBetween: 32,
      },
    },
  });
}

function viewSwiper() {
  var pswiper = new Swiper('.view-swiper', {
    spaceBetween: 24,
    centeredSlides: false,
    speed: 1200, // 슬라이드 전환 속도
    slidesPerView: '3',
    navigation: {
      nextEl: '.view-next',
      prevEl: '.view-prev',
    },
    breakpoints: {
      320: {
        slidesPerView: 'auto',
        spaceBetween: 24,
      },
      544: {
        slidesPerView: 'auto',
        spaceBetween: 24,
      },
      1024: {
        slidesPerView: '3',
        spaceBetween: 24,
      },
    },
  });
}

export { keyVisual, gallSwiper, viewSwiper };
