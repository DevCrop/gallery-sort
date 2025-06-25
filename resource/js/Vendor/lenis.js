// lenis.js
export function createLenisInstance() {
  const lenis = new Lenis();

  lenis.on('scroll', (e) => {});

  function raf(time) {
    lenis.raf(time);
    requestAnimationFrame(raf);
  }

  requestAnimationFrame(raf);

  return lenis;
}
