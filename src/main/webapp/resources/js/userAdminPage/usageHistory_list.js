fetch("/userAdminPage/getUsageList/" + sessionStorage.getItem("Okja"))
  .then((Response) => {if (Response.ok) {
    return Response.json(); // 성공 시 json 응답을 반환합니다.
  }
  throw new Error("Network response was not ok.");
})
  .then((data)=>{
    showUsageList(data);
  })
  .catch((error) => {
    console.error("서버 에러:", error.message);
    swal("서버 에러", "불러오기 실패하였습니다.", "error");
  });


function showUsageList(data){
  let msg = "";
  let usageList = document.querySelector("#usageList");

  if(data===''){
    msg += '<div class="my-2">';
    msg += '<span style="font-size:1rem;">거래내역이 없습니다.</span>';
    msg += '</div>';
  }else{
    data.forEach(list => {
      msg += '<div class="my-2 ">';
      msg += '<a href="" class="text-decoration-none" style="color: black;">';
      msg += '<div class="row bg-danger-subtle p-3 rounded-2 shadow-sm p-3 mb-5 bg-body-tertiary rounded">';
      msg += '<div class="col" style="width: 100px;">';
      msg += '<ion-icon name="receipt" class="fs-3 p-2"></ion-icon>';
      msg += '</div>';
      msg += '<div class="col-6">';
      msg += '<span class="py-1">' + list.year + '년  ' + list.month + '월  /  ' + list.count + '건의 주문</span>';
      msg += '</div>';
      msg += '<div class="col">';
      msg += '<span class="py-1 fw-bolder">' + numberWithCommas(list.totalSum) + '원</span>';
      msg += '</div>';
      msg += '</div>';
      msg += '</a>';
      msg += '</div>';
    });
  }
  usageList.innerHTML = msg;
}

// 세자리마다 쉼표를 찍는 함수
function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
  
									
										
											
												
											
											
												
													
												
												
													
												
											
											
												
											
										
									
								