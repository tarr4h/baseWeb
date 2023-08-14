package com.tar.web.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import org.apache.commons.io.FilenameUtils;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tar.web.board.service.BoardService;
import com.tar.web.vo.BoardVo;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/page")
	public String boardMain(@RequestParam String param, Model model) {
		model.addAttribute("page", param);
		return param;
	}
	
	@PostMapping("/regBoard")
	public String regBoard(BoardVo board, @RequestParam MultipartFile[] uploadFile, RedirectAttributes redirectAttr) throws IOException {
		String seq = String.valueOf(Calendar.getInstance().getTimeInMillis());

		// fileUpload
		int uploadResult = uploadFile(uploadFile, seq);
		log.debug("uploadResult = {}", uploadResult);

		// regBoard
		board.setSeq(seq);
		int result = service.regBoard(board);
		redirectAttr.addFlashAttribute("msg", result > 0 ? "등록되었습니다." : "등록 중 오류가 발생했습니다.");

		return "redirect:/board/page?param=board/qnaBoard";
	}

	@PostMapping("/updateBoard")
	public String updateBoard(BoardVo board, @RequestParam MultipartFile[] uploadFile, RedirectAttributes redirectAttr) throws IOException{
		log.debug("board = {}", board);

		// fileUpload
		int uploadResult = uploadFile(uploadFile, board.getSeq());
		log.debug("uploadResult = {}", uploadResult);

		int result = service.updateBoard(board);
		redirectAttr.addFlashAttribute("msg", result > 0? "수정되었습니다." : "오류가 발생했습니다.");
		return "redirect:/board/page?param=board/qnaBoard";
	}
	
	@PostMapping("/getBoard")
	public ResponseEntity<?> getBoard(@RequestBody Map<String, Object> param){
		return ResponseEntity.ok(service.getBoard(param));
	}
	
	@PostMapping("/getTotalBoardCount")
	public ResponseEntity<?> getTotalBoardCount(@RequestBody Map<String, Object> param){
		return ResponseEntity.ok(service.getTotalBoardCount(param));
	}

	@GetMapping("/showRegistered")
	public String showRegistered(@RequestParam Map<String, Object> param, Model model, HttpServletRequest hsr){
		model.addAttribute("board", service.getRegistered(param));

		HttpSession session = hsr.getSession();
		if(session.getAttribute("auth") != null && session.getAttribute("auth").equals("admin")){
			model.addAttribute("auth", true);
		} else {
			model.addAttribute("auth", false);
		}

		return "/counsel/registered";
	}

	@GetMapping("/deliveryPop")
	public String deliveryPop(@RequestParam Map<String, Object> param){
		return "/board/deliveryPop";
	}

	@PostMapping("/validateNumber")
	public ResponseEntity<?> validateNumber(@RequestBody Map<String, Object> param){
		return ResponseEntity.ok(service.validateNumber(param));
	}

	public int uploadFile(MultipartFile[] uploadFile, String seq) throws IOException{
//		String pathStr = "/Users/taewoohan/WorkFolder/08workspace/fileLocation/" + seq;
//		log.debug("uploadFIle = {}", uploadFile);
		log.debug("uploadFile null ? = {}", uploadFile == null);
		log.debug("uploadFile length ? = {}", uploadFile.length);

		String pathStr = "/tarr4h0305/tomcat/work/tarr4h0305/tarr4h0305.cafe24.com/attach/" + seq;
		Path directory = Paths.get(pathStr);
		Files.createDirectories(directory);

		List<Map<String, Object>> fileList = new ArrayList<>();

		List<Map<String, Object>> currFileList = service.getFileList(seq);
		int i = currFileList.size();
		for(MultipartFile file : uploadFile) {
			log.debug("file == empty ? = {}", file.isEmpty());
			if(!file.isEmpty()){
				String ofn = file.getOriginalFilename();
				String fe = FilenameUtils.getExtension(new File(ofn).getName()).toUpperCase();
				String rfn = seq + i + "." + fe;
				i++;

				Path filePath = directory.resolve(rfn).normalize();
				log.debug("filePath : {}", filePath);
				if (Files.exists(filePath)) {
					log.debug("중복체크");
					throw new IOException("중복 파일이 존재합니다." + filePath);
				}

				file.transferTo(filePath);

				Map<String, Object> fileMap = new HashMap<>();
				fileMap.put("ofn", ofn);
				fileMap.put("rfn", rfn);
				fileMap.put("seq", seq);
				fileMap.put("fileSize", file.getSize());
				fileMap.put("filePath", filePath.toString());
				fileList.add(fileMap);
			}
		}

		if(!fileList.isEmpty()){
			return service.saveFile(fileList);
		} else {
			return 0;
		}
	}

	@PostMapping("/deleteFile")
	public ResponseEntity<?> deleteFile(@RequestBody Map<String, Object> param){
		Map<String, Object> file = service.getFile(param);
		String path = (String) file.get("path");

		File delFile = new File(path);
		boolean delResult = delFile.delete();

		return ResponseEntity.ok(service.deleteFile(file));
	}

	@GetMapping("/downloadFile")
	public ResponseEntity<Resource> downloadFile(@RequestParam Map<String, Object> param) throws IOException {
		Map<String, Object> fileMap = service.getFile(param);

		String pathStr = (String) fileMap.get("path");

		Path path = Paths.get(pathStr);
		String contentType = Files.probeContentType(path);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename((String) fileMap.get("renamed_filename"), StandardCharsets.ISO_8859_1).build());
		headers.add(HttpHeaders.CONTENT_TYPE, contentType);

		Resource resource = new InputStreamResource(Files.newInputStream(path));

		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}

	@GetMapping("/searchBoard")
	public ResponseEntity<?> searchBoard(@RequestParam Map<String, Object> param){
		log.debug("param = {}", param);
		List<BoardVo> boardList = service.searchBoard(param);
		return ResponseEntity.ok(boardList);
	}

	@GetMapping("/reply")
	public ResponseEntity<?> reply(@RequestParam Map<String, Object> param){
		log.debug("param = {}", param);
		return ResponseEntity.ok(service.insertReply(param));
	}
}
