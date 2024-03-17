package org.rainbow.domain;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Component
public class ImageUploader1 {


    private static final String API_KEY = "346439542fae9577241a91b7775e5098";
    private RestTemplate restTemplate;

    public ImageUploader1() {
    	 this.restTemplate = new RestTemplate();
	}
    
    public String uploadImage(MultipartFile file) throws IOException {
        // 허용되는 이미지 확장자들
        String[] allowedExtensions = {".jpg", ".jpeg", ".png"};

        // 파일 확장자 체크
        boolean isValidExtension = false;
        for (String extension : allowedExtensions) {
            if (file.getOriginalFilename().toLowerCase().endsWith(extension)) {
                isValidExtension = true;
                break;
            }
        }

        if (!isValidExtension) {
            throw new IllegalArgumentException("Unsupported file extension. Only JPG, JPEG, PNG files are allowed.");
        }

        String uploadUrl = "https://api.imgbb.com/1/upload";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        // MultiValueMap을 사용하여 이미지 파일 설정
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        ByteArrayResource resource = new ByteArrayResource(file.getBytes()) {
            @Override
            public String getFilename() {
                return file.getOriginalFilename();
            }
        };
        body.add("image", resource);

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        // URI 변수 설정
        Map<String, Object> uriVariables = new HashMap<>();
        uriVariables.put("key", API_KEY);

        // POST 요청하여 이미지 업로드
        ResponseEntity<Map> responseEntity = restTemplate.postForEntity(uploadUrl + "?key={key}", requestEntity, Map.class, uriVariables);
        Map<String, Object> responseBody = responseEntity.getBody();

        if (responseBody != null && responseBody.containsKey("data")) {
            Map<String, Object> data = (Map<String, Object>) responseBody.get("data");
            String imageUrl = (String) data.get("url");

            // 이미지 URL을 이용하여 원하는 작업을 수행
            return imageUrl;
        }

        // 파일 업로드 후 처리할 내용이 있다면 이 곳에 추가

        return null;
    }
}