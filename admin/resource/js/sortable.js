const sortList = document.getElementById("sort-gallery");
const updateApiUrl = "/app/update_order.php";

export const sortable = new Sortable(sortList, {
  handle: ".handle",
  preventOnFilter: false,
  group: {
    name: "shared",
    pull: "clone",
  },
  animation: 150,
  onEnd: () => {
    const sortOrder = [...sortList.querySelectorAll("tr")].map((row, index) => {
      return {
        id: row.getAttribute("data-no"),
        sort_no: index + 1,
      };
    });

    afterFetchSort(updateApiUrl, sortOrder);
  },
});

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
};
