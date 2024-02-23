package org.rainbow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DefaultController 
{
	@GetMapping("/")
	public String testMapping()
	{
		// return "테스트시 DefaultController 사용 가능!!";
<<<<<<< HEAD
		 return "/employeeSupervisePage/profile_modify";
=======
		 return "/userAdminPage/userLogin";
>>>>>>> 8987019f68398e447010e68721de135df17fdfbd
	}
}
