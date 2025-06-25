import { keyVisual, gallSwiper, viewSwiper } from './Vendor/swiper.js';
import { header } from './Components/header.js';
import { footer } from './Components/footer.js';
import { createLenisInstance } from './Vendor/lenis.js';

$(document).ready(function () {
  const lenis = createLenisInstance();
  refreshFsLightbox();
  keyVisual();
  gallSwiper();
  viewSwiper();
  eventHandle();
  imgAniRight();
  header();
  footer();
  gsap.registerPlugin(ScrollTrigger);
  AOS.init();
});

// 이벤트 핸들러
function eventHandle() {
  mainimgDownAni();
}

// 메인페이지 이미지 드랍
function mainimgDownAni() {
  gsap.to('.drop-img', {
    clipPath: 'inset(0 0 0 0)', // 완전히 보이게
    ease: 'power2.out',
    scrollTrigger: {
      trigger: '.no-main--about',
      start: 'top 80%', // 요소가 뷰포트 80% 지점에 들어올 때 시작
    },
  });
}

function imgAniRight(){

document.querySelectorAll(".right-ani").forEach((el) => {
  const img = el.querySelector("img");

  // 초기 상태 설정
  gsap.set(img, {
    clipPath: "inset(0 100% 0 0)", // 왼쪽에서 오른쪽으로 가려진 상태
    scale: 1.14
  });

  gsap.to(img, {
    clipPath: "inset(0% 0% 0% 0%)",
    scale: 1,
    ease: "power2.out",
    duration: 1.8,
    scrollTrigger: {
      trigger: el,
      start: "top 80%",
      toggleActions: "play none none reverse"
    }
  });
});
}
