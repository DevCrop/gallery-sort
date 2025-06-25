const HEADER_SELECTOR = "header";
const DRAG_CLASS = "sort-dragging";
const headerEl = document.querySelector(HEADER_SELECTOR);
const sortList = document.getElementById("sort-gallery");

const headerDrag = {
  add: () => headerEl?.classList.add(DRAG_CLASS),
  remove: () => headerEl?.classList.remove(DRAG_CLASS),
  toggle: () => headerEl?.classList.toggle(DRAG_CLASS),
};

const updateApiUrl = "/app/update_order.php";

new Sortable(sortList, {
  preventOnFilter: false,
  group: {
    name: "shared",
    pull: "clone",
  },
  forceFallback: true,
  fallbackOnBody: true,
  scroll: true,
  scrollSensitivity: 1000,
  scrollSpeed: 10,
  scrollElement: window,
  animation: 150,
  onStart: headerDrag.add,
  onEnd: headerDrag.remove,
  /*
  onEnd: () => {
    const sortOrder = [...sortList.querySelectorAll("tr")].map((row, index) => {
      return {
        id: row.getAttribute("data-no"),
        sort_no: index + 1,
      };
    });

    //afterFetchSort(updateApiUrl, sortOrder);
  },*/
});

/*
const afterFetchSort = async (url, sortOrder) => {
  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ sortOrder: sortOrder }),
    });

    if (!response.ok) {
      throw new Error(`서버 오류: ${response.status}`);
    }

    const data = await response.json();
    console.log("서버 응답:", data);
  } catch (error) {
    console.error("정렬 순서 전송 중 오류 발생:", error);
  }
};*/
