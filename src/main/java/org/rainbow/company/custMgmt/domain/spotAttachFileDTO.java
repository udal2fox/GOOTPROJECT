package org.rainbow.company.custMgmt.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class spotAttachFileDTO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private int spotNo;

}
