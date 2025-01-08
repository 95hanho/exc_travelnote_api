import $ from "jquery";

const popupBtnAll = document.querySelectorAll('[aria-haspopup="dialog"]');
if (popupBtnAll) {
  let currentTarget,
    focusEl = [],
    popupDepth = 0,
    popupDimmed,
    keyEscapeEvt,
    KeyEvtEl;
  const _$this = this,
    popupAll = document.querySelectorAll('[role="dialog"]'),
    popupCloseBtnAll = document.querySelectorAll("[popup-close]");
  // ESC 누름 감지
  const keyEvent = {
    get keyEscape() {
      return this._state;
    },
    set keyEscape(state) {
      this._state = state;
      if (state) escKeyEvt(KeyEvtEl, keyEscapeEvt);
    },
  };
  keyEvent;
  // popup dimmed 생성
  const createdDimmed = () => {
    const createDiv = document.createElement("div");
    createDiv.classList.add("popup-dimmed");
    document.querySelector("body").appendChild(createDiv);
  };
  // popup dimmed click 시 팝업 닫기
  const dimmedClick = (e) => {
    if (e.target.classList.contains("wrap-layer-popup")) {
      popupCloseAll();
      keyEvent.keyEscape = false;
    }
  };
  // popup open
  const popupOpen = (e) => {
    currentTarget = e.target.tagName;
    currentTarget === "BUTTON" || currentTarget === "A"
      ? (currentTarget = e.target)
      : (currentTarget = e.target.closest("button") || e.target.closest("a"));

    popupDimmed = document.querySelectorAll(".popup-dimmed");
    if (popupDimmed.length === 0) createdDimmed();

    popupAll.forEach((popupEl) => {
      if (
        popupEl.getAttribute("data-popup") ===
        currentTarget.getAttribute("data-popup")
      ) {
        popupDepth += 1; // popup depth 저장
        focusEl.splice(popupDepth - 1, 0, currentTarget); // popup focus Element 저장
        popupEl.classList.add("popup-open"); // open class add
        popupEl.setAttribute("popup-depth", popupDepth); // popup depth 설정

        // dimmed click 이벤트 할당
        //popupEl.removeEventListener('click', dimmedClick); // dimmedClick
        //popupEl.addEventListener('click', dimmedClick);

        document.body.classList.add("scroll-lock"); // popup scroll lock
        popupEl.querySelector(".wrap-layer-popup-title").focus(); // popup 오픈 시 타이틀에 포커스

        // shift+tab 또는 <- 화살표 키 키보드 동작 시 팝업 밖으로 포커스 이동 방지 이벤트 할당
        popupEl
          .querySelector(".wrap-layer-popup-title")
          .removeEventListener("keydown", titleKeyDown);
        popupEl
          .querySelector(".wrap-layer-popup-title")
          .addEventListener("keydown", titleKeyDown);

        // popup 위 팝업 케이스 dimmed 수정
        if (popupDepth > 1)
          document
            .querySelector(`[popup-depth='${popupDepth - 1}']`)
            .classList.add("prev-popup");

        KeyEvtEl = popupEl; // ESC 키 동작을 위한 현재 활성화 된 popup element 저장
      }
    });
  };
  // popup close
  const popupClose = (e) => {
    // 키보드 이벤트 ESC 일 경우 currentTarget 설정
    if (e.key == "Escape" || e.key == "Esc")
      currentTarget = KeyEvtEl.querySelector(".btn-layer-close");
    // 일반적인 클릭, 키보드 이벤트 일 경우 currentTarget 설정
    else {
      currentTarget = e.target.tagName;
      currentTarget === "BUTTON" || currentTarget === "A"
        ? (currentTarget = e.target)
        : (currentTarget = e.target.closest("button") || e.target.closest("a"));
      let popupId = currentTarget.getAttribute("popup-close");
      if (currentTarget.getAttribute("popup-close-all") === "true")
        return popupCloseAll();
      if (currentTarget.getAttribute("popup-confirm")) confirmEvt[popupId]();
      else if (currentTarget.getAttribute("popup-cancel")) cancelEvt[popupId]();
    }
    popupAll.forEach((popupEl) => {
      if (
        popupEl.getAttribute("data-popup") ===
        currentTarget.getAttribute("popup-close")
      ) {
        popupEl.classList.add("delay");
        setTimeout(function () {
          popupEl.classList.remove("delay", "popup-open");
        }, 380);

        // 저장된 focus element 가 있을 때
        if (focusEl.length > 0) {
          focusEl[popupDepth - 1].focus(); // focus 상태 재설정
          focusEl.splice(popupDepth - 1, 1); // popup focus Element 삭제
          popupDepth -= 1; // popup depth 재설정
          KeyEvtEl = document.querySelector(
            `.wrap-layer-popup[popup-depth='${popupDepth}']`
          ); // ESC 키 동작을 위한 현재 활성화 된 popup element 저장
        } else {
          // 저장된 focus element 가 없을 때
          document.body.setAttribute("tabindex", "0");
          document.body.focus();
          KeyEvtEl = null;
        }
      }
    });
    // 오픈 된 popup이 있는 지 확인
    setTimeout(function () {
      const openPopups = document.querySelectorAll(`.popup-open`);
      if (openPopups.length === 0) popupCloseAll("none");
      else if (openPopups.length > 0) {
        // 오픈된 popup이 있을 경우 popup dimmed 수정

        const getPopupValue =
          currentTarget.getAttribute("popup-close") ||
          currentTarget.getAttribute("data-popup");
        const getPopupDepth = Number(
          document
            .querySelector(`.wrap-layer-popup[data-popup='${getPopupValue}']`)
            .getAttribute("popup-depth")
        );
        document
          .querySelector(
            `.wrap-layer-popup[popup-depth='${getPopupDepth - 1}']`
          )
          .classList.remove("prev-popup");
        document
          .querySelector(`.wrap-layer-popup[data-popup='${getPopupValue}']`)
          .removeAttribute("popup-depth");
      }
    }, 390);
  };
  // popup close All
  const popupCloseAll = (focusActionNone) => {
    // dimmed 삭제
    const popupDimmed = document.querySelector(".popup-dimmed");
    popupDimmed.style.opacity = 0;
    popupDimmed.addEventListener("transitionend", function () {
      if (popupDimmed.parentNode !== null)
        popupDimmed.parentNode.removeChild(popupDimmed);
    });
    // popup depth 설정 삭제
    popupAll.forEach((popupEl) => {
      popupEl.classList.remove("prev-popup");
      popupEl.removeAttribute("popup-depth");
    });
    // scroll lock 해지
    document.body.classList.remove("scroll-lock");
    // popupClose Event 통해서 focus 설정이 되지 않았을 경우 (popupCloseAll 단독 실행일 경우)
    if (focusActionNone !== "none") {
      if (focusEl.length > 0)
        focusEl[0].focus(); // 저장된 focus element 가 있을 때
      else {
        // 저장된 focus element 가 없을 때
        document.body.setAttribute("tabindex", "0");
        document.body.focus();
      }
      focusEl = []; // focus reset
    }
    popupAll.forEach((popupEl) => popupEl.classList.remove("popup-open")); // open class 삭제
    popupDepth = 0; // popup depth reset
    KeyEvtEl = null; // KeyEvtEl reset
  };

  // ESC 키보드 이벤트
  const escKeyEvt = (El, e) => {
    const openPopups = document.querySelectorAll(`.popup-open`);
    // 팝업 열린 상태에서 키보드 ESC 키 이벤트 실행
    if (openPopups.length > 0) popupClose(e);
  };
  // popup 닫기 키보드 이벤트
  const closeBtnKeyDown = (e) => {
    if ((e.key == "Tab" && !e.shiftKey) || e.key == "ArrowRight") {
      e.preventDefault();
      popupAll.forEach((popupEl) => {
        if (
          popupEl.getAttribute("data-popup") ===
          e.target.getAttribute("popup-close")
        ) {
          popupEl.querySelector(".wrap-layer-popup-title").focus();
        }
      });
    }
  };
  // popup title 키보드 이벤트
  const titleKeyDown = (e) => {
    if ((e.key == "Tab" && e.shiftKey) || e.key == "ArrowLeft") {
      e.preventDefault();
      popupAll.forEach((popupEl) => {
        if (
          popupEl.getAttribute("data-popup") ===
          e.target.closest(".wrap-layer-popup").getAttribute("data-popup")
        ) {
          popupEl.querySelector(".btn-layer-close").focus();
        }
      });
    }
  };

  // 키보드 ESC 키 누름 감지 이벤트
  const escKeyDown = (e) => {
    if (e.key == "Escape" || e.key == "Esc") {
      keyEscapeEvt = e;
      keyEvent.keyEscape = true;
    }
  };

  // 클릭/키보드 팝업 이벤트 제거/할당
  // 팝업 열기
  popupBtnAll.forEach((popupBtn) => {
    popupBtn.removeEventListener("click", popupOpen);
    popupBtn.addEventListener("click", popupOpen);
  });
  // 팝업 닫기
  popupCloseBtnAll.forEach((popupCloseBtn) => {
    popupCloseBtn.removeEventListener("click", popupClose);
    popupCloseBtn.addEventListener("click", popupClose);
    if (popupCloseBtn.classList.contains("btn-layer-close")) {
      popupCloseBtn.removeEventListener("keydown", closeBtnKeyDown);
      popupCloseBtn.addEventListener("keydown", closeBtnKeyDown);
    }
  });
  // ESC 키로 팝업 닫기
  window.removeEventListener("keydown", escKeyDown);
  window.addEventListener("keydown", escKeyDown);
}

$(document).ready(function () {
  // GNB Menu button click event

  $(".item_dir .bt_dir").on("click", function () {
    $(this).next(".item_dir_list").slideToggle("fast");
  });
  $(".dir-write_wrap .bt_write").on("click", function () {
    $(this).parent().toggleClass("active");
    $(this).parent().find("input[type=text]").focus();
  });
});
