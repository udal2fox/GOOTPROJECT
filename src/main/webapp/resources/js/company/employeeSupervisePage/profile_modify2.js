window.onload = profile;

function profile() {
	
    var defaultImageUrl = "/resources/images/profile_img.png"; // 기본 이미지 경로를 지정합니다.

    var profilePictureElement = document.getElementById("profilePicture");

    // 만약 profilePictureSrc 값이 null이라면 기본 이미지 경로를 사용합니다.
    if (!profilePictureSrc) {
        profilePictureElement.src = defaultImageUrl;
    } else {
        profilePictureElement.src = profilePictureSrc;
    }
};


