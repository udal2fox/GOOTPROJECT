// 이미지 vo에서 불러올 시 svg 아이콘 안 보이게 하기
const profilePicture = document.getElementById('profilePicture');
const imgIcon = document.getElementById('img-icon');

//이미지 파일이 로드되었을 때
profilePicture.onload = function() {
	// 이미지 파일이 존재할 경우
	imgIcon.style.display = 'none'; // SVG 아이콘 숨기기
};

//이미지 파일이 로드되지 않았을 때
profilePicture.onerror = function() {
    // 이미지 파일이 존재하지 않을 경우
	profilePicture.style.display = 'none'; // 이미지 숨기기
};

