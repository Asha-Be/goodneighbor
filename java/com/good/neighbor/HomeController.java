package com.good.neighbor;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return ".main.layout";
	}
	//----------------------------
		@RequestMapping(value="/inputForm.do",method=RequestMethod.GET)
		public String home2() {
			return ".main.member.inputForm";//뷰리턴 
		}
		//------------------------------
		@RequestMapping(value="/list.do",method=RequestMethod.GET)
		public String home3() {
			return ".main.board.list";//뷰리턴 
	
	
}
		//입력폼
		//----------------
		@RequestMapping(value="fileUpForm.do")
		public String fileUpForm() {
			return "/fileUpForm";//뷰리턴
		}

			//------------
			//파일 업로드
			//-------------------------

			@RequestMapping(value="action.do",method=RequestMethod.POST)
			public String action(@RequestParam("upfile") MultipartFile multipartFile,
					HttpServletRequest request,
					MultipartHttpServletRequest multi,
					Model model) throws Exception{
				
				System.out.println(multipartFile.getOriginalFilename());//원래 파일 이름,이미지
				System.out.println("board_name"+multi.getParameter("board_name"));//일반 데이터
				
				File f=new File("c:\\_aabb\\"+multipartFile.getOriginalFilename());
				
				multipartFile.transferTo(f);//업로드
				
				return "/fileUpForm";//뷰리턴
			}
		
		
}//class-end

