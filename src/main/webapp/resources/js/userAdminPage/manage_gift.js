// 지점 선물 편집 버튼
const customBtn = document.querySelector("#customGiftBtn");
customGiftBtn.addEventListener('click',()=>{
    location.href = "/userAdminPage/giftCustom";
})

// 기본 선물 편집 버튼
const defaultGiftBtn = document.querySelector("#defaultGiftBtn");
defaultGiftBtn.addEventListener('click',()=>{
    location.href = "/userAdminPage/giftDefault";
})