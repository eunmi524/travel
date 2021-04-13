package org.spring5.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.spring5.domain.AttachFileDTO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController { //(파일을 폴더에 저장시키는 역할)
	
	//저장경로 (톰캣이 실행되는 운영체제가 Windows 환경이므로 경로구분자를 \\로 지정)
	//저장경로 (톰캣이 실행되는 운영체제가 리눅스 환경이면, 경로구분자를 /로 지정)
	String uploadFolder = "c:\\upload";

//p.515까지 완성
//Ajax를 이용한 파일 업로드////////////////////////////////////////////////////////
	
//	@GetMapping("/uploadAjax")
//	public void uploadAjax() {
//		log.info("upload ajax");
//	}
//	
//
//	
//	@PostMapping("/uploadAjaxAction")
//	//(주의) 아래의 uploadFile 매개변수 이름(uploadFiles)은 form 의 파일 input의 name 속성(uploadFile)값고 동일하게 설정
//	public void uploadAjaxPost(MultipartFile[] uploadFile
//										// ,Model model  //Ajax 사용시 필요없음
//									) {
//		log.info("update ajax post.........");
//		
//		String uploadFolder = "C:\\upload";
//		
//		//날짜형식 (c:\\upload\\yyyy\\MM\\dd)의 폴더 구조 생성
//		//File(String Parent, String Child)
//		//부모경로(레포지토리 경로) 문자열에 자식경로(날짜형식 경로) 문자열이 더해진 File 객체 생성
//		//날짜형식 경로를 생성하기 위하여 앞에서 생성한 getFolder() 메서드 호출
//		//make folder ----------
//		File uploadPath = new File(uploadFolder, getFolder());
//		
//		log.info("upload path: " + uploadPath);
//		
//		//경로가 존재하지 않으면 전체 폴더 구조 생성
//		if (uploadPath.exists() == false) {
//			//이때, 기존 폴더 구조 중 일부가 있으면 없는 부분부터 나머지 전체를 생성
//			uploadPath.mkdirs();
//		}
//		//make yyyy/MM/dd folder
//		
//		for (MultipartFile multipartFile : uploadFile) {
//			
//			log.info("------------------------------------");
//			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
//			log.info("upload File Size: " + multipartFile.getSize());
//			
//			String uploadFileName = multipartFile.getOriginalFilename();
//			
//			//일부 IE에서 파일이름에 경로가 포함된 경우, 위의 uploadFileName에는 경로가 포함되어 있으므로 파일 이름만 추출
//			//파일 이름만 있는 경우, 파일 이름만 추출됨
//			//예 C:\\users\clthd\Desktop\img\img7.jsp
//			//img7.jsp  : \가 없는 경우, uploadFileName.lastIndexOf("\\") 는 -1
//			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);  // 이걸 거치면 파일이름이 있건 없건 파일 이름만 추출됨
//			
//			log.info("only file name: " + uploadFileName);
//			
////UUID를 이용한 새로운 UUID값을 생성
//			//랜덤한 UUID값의 문자열을 가진 객체 생성
//			UUID uuid = UUID.randomUUID();
//			
//			//파일이름에 UUID 문자열 추가(파일 확장자 때문에 UUID를 앞에다 추가해야 함)
//			uploadFileName = uuid.toString() + "_" + uploadFileName;
//			
////업로드 정보 (저장폴더와 파일이름 문자열)의 파일 객체 생성
//
//			
//			try {
//				//File saveFile = new File(uploadFolder, uploadFileName);
//				//날짜 형식 폴더 경로를 가진 파일 객체
//				File saveFile = new File(uploadPath, uploadFileName);
//				
//				//서버에 파일 객체를 이용하여 업로드 파일 저장
//				multipartFile.transferTo(saveFile);
//				
//				//업로드된 파일에 대하여 이미지파일인지를 검사후, 이미지 파일인경우 썸네일 이미지 생성
//				//이미지파일이 아닌경우, if문 처리 없음
//				//이미지 파일인 경우
//				if (checkImageType(saveFile)) {
//					
//					//썸네일 생성경로와 파일이름이 설정된 파일객체를 전송 보내는 FileOutputStream 객체 생성
//					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
//					
//					//FileOutput-스트림으로 보내진 파일 객체를 서버에 저장(input)gkdu, 100x100 크기(px)의 썸네일 생성
//					//라이브러리 메소드 사용
//					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
//					//FileOutputStream 스트림 리소스 닫기
//					thumbnail.close();
//				}
//				
//				
//			} catch (Exception e) {
//				log.error(e.getMessage());
//			} // end catch
//		} //end for
//	}
	
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}	

//Ajax: 날짜형식의 디렉토리 구조를 생성후 업로드파일 저장 구성 (2단계)
//Step1- 날짜 형식 경로 문자열 생성 메소드(반환되는 문자열값 예:"2021/02/03")
	private String getFolder() {
		
		//날짜 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		//날짜 생성
		Date date = new Date();
		//날짜 형식이 지정된 날짜문자열(yyyy/MM/dd) 생성
		String str = sdf.format(date);
		//경로구분자를 운영체제에 맞도록 변경한 문자열을 반환
		return str.replace("/", File.separator); 
	}
//Step2: uploadAjaxPost() 메소드에
//step1에서 생성한 메소드를 이용해서 폴더를 생성하여 업로드 되도록 코드 추가
	
	//22장. 썸네일 이미지 생성
	//Step1: 업로드파일이 이미지 파일여부 검사
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//Step2: uploadAjaxPost() 메소드에 
	//Step1에서 생성한 메소드를 이용해서 이미지파일 여부 검사 후, 
	//이미지 파일에 대해선 썸네일 생성 저장하도록 코드 추가
	
	
//피드백 정보 구성 구현부터
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/uploadAjaxAction", produces= {"application/json; charset=UTF-8"})
	@ResponseBody //이 메소드는 REST-API를 사용하는 메소드(로직 처리 후, 브라우저에 데이터만 전달(JSP파일 호출 없음))
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		//날짜형식 (c:\\upload\\yyyy\\MM\\dd)의 폴더 구조 생성
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, getFolder());
		
		//경로가 존재하지 않으면 전체 폴더 구조 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			
//브라우저에 피드백 정보로 전달되는 값이 저장될 객체 생성
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//일부 IE에서 파일이름에 경로가 포함된 경우, 위의 uploadFileName에는 경로가 포함되어 있으므로 파일 이름만 추출
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);  // 이걸 거치면 파일이름이 있건 없건 파일 이름만 추출됨
			log.info("only file name: " + uploadFileName);
			
//attachDTO에 원본파일 이름 저장
			attachDTO.setFileName(uploadFileName);
			
			//UUID를 이용한 새로운 UUID값을 생성
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			//업로드 정보 (저장폴더와 파일이름 문자열)의 파일 객체 생성

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				
				//서버에 파일 객체를 이용하여 업로드 파일 저장
				multipartFile.transferTo(saveFile);
				
//attachDTO에 uuid와 날짜경로(2021\02\03) 저장
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				//업로드된 파일에 대하여 이미지파일인지를 검사후, 이미지 파일인경우 썸네일 이미지 생성
				if (checkImageType(saveFile)) {

//attachDTO에 이미지파일인 경우, true 저장
					attachDTO.setImage(true);
					
					//File totalPathFileName = new File(uploadPath, "s_" + uploadFileName);
					//log.info("totalPathFileName"+ totalPathFileName);
					
					//썸네일 생성경로와 파일이름이 설정된 파일객체를 전송 보내는 FileOutputStream 객체 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					//FileOutput-스트림으로 보내진 파일 객체를 서버에 저장(input)gkdu, 100x100 크기(px)의 썸네일 생성
					//라이브러리 메소드 사용
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					//FileOutputStream 스트림 리소스 닫기
					thumbnail.close();
				}
//전달된 list객체에 attachDTO 추가
				list.add(attachDTO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} //end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

//24장 이미지 파일 표시(이미지 복사로 다운로드)
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		log.info("fileName: " + fileName);
		
		File file = new File("c:\\upload\\" + fileName);  //2021\02\03\이미지 파일 이름.jsp
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			//HttpHeader 객체에 이미지 파일(jpg, png, bmp, ...)의 Content-Type 추가
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			log.info("header.toString()" + header.toString());
			log.info("header.getContentType()" + header.getContentType());
			
			//이미지 파일 복사본과 Content-Type이 추가된 HttpHeader와 상태값을 가진
			//ResponseEntity<byte[]> 객체를 생성하여 반환
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//ResponseEntity<byte[]> 객체 반환
		return result;
	}

	
//form을 이용한 파일 업로드////////////////////////////////////////////////////////
	
	//다중파일 업로드 방법1: form 방식의 파일 업로드
	//Step1 : 파일업로드 요청 JSP페이지 호출
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	//uploadFile
	//다중파일 업로드 방법1: form 방식의 파일 업로드
	//(주의) 아래의 uploadFiles 매개변수 이름(uploadFiles)은 form의 파일 input name 속성(uploadFiles)값과 동일하게 설정
	//Step2: Model 이용, 업로드 파일 저장
	@PostMapping("/uploadFormAction")
	//public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
	public void uploadFormPost(MultipartFile[] uploadFile, @RequestParam("name") String name) {
		
		//클래스의 필드로 설정했으므로 주석처리
		//String uploadFolder = "c:\\upload";
		
		log.info("-------FileUpload With Form-------");
		log.info("name: " +name);
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------------------------------");
			log.info("Upload File Name: " +multipartFile.getOriginalFilename());
			log.info("Upload File Size: " +multipartFile.getSize());
			
			//import java.io.File 을 임포트 시키세요
			//업로드 파일의 리소스(저장폴더와 파일이름) 설정
	
		String uploadFileName = multipartFile.getOriginalFilename();
	
		//일부 IE에서 파일이름에 경로가 포함된 경우, 위의 uploadFileName에는 경로가 포함되어 있으므로 파일 이름만 추출
		//파일 이름만 있는 경우, 파일 이름만 추출됨
		//예  C:\\users\clthd\Desktop\img\img7.jsp
		//img7.jsp  : \가 없는 경우, uploadFileName.lastIndexOf("\\") 는 -1
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); 
	
		log.info("only file name: " + uploadFileName);
	
		File saveFile = new File(uploadFolder, uploadFileName);

			
			try {
				//서버에 파일 객체를 이용하여 업로드 파일 저장
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}//end try-catch
		}// end for문
	}

//24장 파일 다운로드(p.531) //웹브라우저에 전달된 바이트 배열 스프림의 파일이 화면에 표시할 수 없는 경우에 "application/octet-stream" 마임타입을 지정
	@GetMapping(value="/download", produces= "application/octet-stream" ) //MediaType.APPLICATION_OCTET_STREAM_VALUE
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName){
		
		//톰캣 서버 운영체제에 있는 파일을 엑세스할 수 있는 Resource 인터페이스의 구현객체를 생성하기 위하여
		//스프링 Resource 인터페이스를 통해 FileSystemResource 구현객체를 생성합니다.
		log.info("download file: " + fileName); 
		
		log.info("userAgent:" + userAgent);
		
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName); 
		
		log.info("resource: " + resource);

//파일이 존재하지 않으면, 오류 전송 후 메소드 종료
		if(resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

//브라우저에 따른 한글이 포함된 원래의 다운로드 이름으로 header에 추가하기 위한 코드  (여기부터~끝까지:사용자 편의를 위해 추가함)
//파일이 존재하면 아래의 내용 수행		
		String resourceName = resource.getFilename();
		
//UUID 제거된 파일이름
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = null;
			
			if(userAgent.contains("Trident")||userAgent.contains("MSIE")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
				
			} else if(userAgent.contains("Edge")||userAgent.contains("Edg")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " "); //.replaceAll("\\+", " ") -> 빈칸이 +로 된 걸 빈칸으로 바꿔라 라는 의미
				log.info("Edge name: " + downloadName);
				
			} else {
				log.info("Chrome browser");
				//UTF-8로 인코딩한 파일이름을 HTML 기본 인코딩(ISO-8859-1)으로 디코딩될 수 있는 문자열 생성
				//파일이름 디코딩을 "ISO-8859-1" 대신 "UTF-8"을 지정하면 위와 같이 파라미터로 전달된 이름이 파일이름이 ____.jsp로 표시됩니다.
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
				//downloadName = new String(resourceName.getBytes("UTF-8"), "UTF-8"); //크롬은 받은걸 UTF-8로 준걸 ISO-8859-1 로 해석하려고 해서 깨지기도 한다.
			}
				log.info("downloadName: " + downloadName);
				
				headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		log.info("deleteFile: " + fileName);
		
		//File 객체 생성
		File file;
		
		try {
			//년/월/일 경로가 포함된 파일이름을 UTF-8로 디코딩하여, 전체파일 경로가 포함된 파일 객체를 생성합니다.
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			//파일 객체의 delete()메서드로 파일을 삭제합니다. file 객체가 삭제되는 것은 아닙니다.
			file.delete();
			
			//삭제된 파일의 type 값이 image 값인 경우
			if(type.equals("image")) {
				
				//삭제된 파일의 파일객체에서 s_가 삭제된 파일이름을 얻음
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				
				log.info("largeFileName: " + largeFileName);
				
				//s_가 삭제된 파일이름으로 이미지 파일 이름의 객체를 얻어서
				file = new File(largeFileName);
				
				//파일 객체의 delete() 메서드로 파일을 삭제합니다. file 객체가 삭제되는 것은 아닙니다.
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
