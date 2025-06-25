const HEADER_SELECTOR = "header";
const DRAG_CLASS = "sort-dragging";
const TOGGLE_BUTTONS = ".no-state-btn > button";
const STATE_API_URL = "/api/state.php";

const headerEl = document.querySelector(HEADER_SELECTOR);
const sortList = document.getElementById("sort-gallery");

const headerDrag = {
  add: () => headerEl?.classList.add(DRAG_CLASS),
  remove: () => headerEl?.classList.remove(DRAG_CLASS),
  toggle: () => headerEl?.classList.toggle(DRAG_CLASS),
};

const updateApiUrl = "/api/update_order.php";

if (sortList) {
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

    onEnd: () => {
      const sortOrder = [...sortList.querySelectorAll(".no-gallery-item")].map(
        (item, index) => {
          return {
            id: item.getAttribute("data-no"),
            sort_no: index + 1,
          };
        }
      );

      afterFetchSort(updateApiUrl, sortOrder);
    },
  });
}

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

const stateToggle = () => {
  const toggleButtons = document.querySelectorAll(".no-state-btn > button");

  toggleButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const parent = button.closest(".no-state-btn");
      const options = parent.querySelector(".no-state-options");

      if (options) {
        options.classList.add("visible");
      }
    });
  });

  const optionButtons = document.querySelectorAll(".no-state-options button");

  optionButtons.forEach((optBtn) => {
    optBtn.addEventListener("click", async function () {
      const value = this.dataset.value;
      const btnWrap = this.closest(".no-state-btn");
      const options = this.closest(".no-state-options");
      const button = btnWrap.querySelector("button");

      const id = btnWrap.dataset.id;
      const type = btnWrap.dataset.type;

      if (!id || !type) {
        console.error("data-id 또는 data-type 누락");
        return;
      }

      try {
        const res = await fetch(STATE_API_URL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            id: id,
            type: type,
            value: value,
          }),
        });

        const data = await res.json();

        if (data.success) {
          options.classList.remove("visible");

          const label = this.textContent.trim();
          button.childNodes[0].nodeValue = label + " ";

          if (type === "is_contract") {
            button.classList.remove(
              "no-state-contract-done",
              "no-state-contract-available"
            );
            button.classList.add(
              value === "1"
                ? "no-state-contract-done"
                : "no-state-contract-available"
            );
          }

          if (type === "is_visible") {
            button.classList.remove(
              "no-state-visible-true",
              "no-state-visible-false"
            );
            button.classList.add(
              value === "1" ? "no-state-visible-true" : "no-state-visible-false"
            );
          }
        } else {
          alert("상태 변경 실패: " + (data.message || ""));
        }
      } catch (err) {
        console.error("요청 실패:", err);
        alert("서버 오류가 발생했습니다.");
      }
    });
  });

  document.addEventListener("click", function (e) {
    if (!e.target.closest(".no-state-btn")) {
      document.querySelectorAll(".no-state-options.visible").forEach((opt) => {
        opt.classList.remove("visible");
      });
    }
  });
};

stateToggle();
