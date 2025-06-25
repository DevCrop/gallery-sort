function footer() {}

const topBtn = document.querySelector('.quick_menu');

// 스크롤 이벤트 감지
window.addEventListener('scroll', function () {
  if (window.scrollY > 80) {
    topBtn.classList.add('show');
  } else {
    topBtn.classList.remove('show');
  }
});

// 클릭 시 스크롤 맨 위로
topBtn.addEventListener('click', function () {
  window.scrollTo({ top: 0, behavior: 'smooth' });
});

export { footer };
