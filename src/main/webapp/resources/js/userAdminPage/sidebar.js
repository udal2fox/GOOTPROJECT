
document.querySelectorAll("#dashboard").forEach((aEle) => {
    aEle.addEventListener("click", (e) => {
      e.preventDefault();
      let type = e.target.getAttribute("href");
      let queryString = "bno=" + type;
      location.href = "/board/get?" + queryString;
    });
  });


document
  .querySelector("#manage_recipients")
  .addEventListener("click", () => {
    location.href='/userAdminpage/manage_recipients'
  });
