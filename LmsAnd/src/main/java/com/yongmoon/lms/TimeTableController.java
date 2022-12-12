package com.yongmoon.lms;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberVO;
import timetable.EnrolmentVO;
import timetable.TimeTableDAO;
import timetable.TimeTableService;
import timetable.TimeTableVO;

@RestController
public class TimeTableController {
	@Autowired private TimeTableService service;
	@Autowired private TimeTableDAO dao;
	@Autowired private SqlSession sql;
	
	@RequestMapping("/info.tt")
	public String myInfoView() {
		return "myInfo";
	}
	
	@RequestMapping("/spare.tt")
	public String spareTimeTable(Model model, HttpSession session, EnrolmentVO enrol_vo) {
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		String id = member.getId();
		System.out.println(id + "의 장바구니");
		List<TimeTableVO> table_vo = dao.timeTable_list(id);
		
		model.addAttribute("member", member);
		model.addAttribute("enrol_vo", enrol_vo);
		model.addAttribute("table_vo", table_vo);
		return "time/spareTimeTable";
	}// 시간표 장바구니 보기
	
	@RequestMapping(value = "/main.tt", produces = "text/html; charset=utf-8")
	public String timeTableHome(Model model, HttpSession session, EnrolmentVO enrol_vo) {
		MemberVO vo = (MemberVO) session.getAttribute("loginInfo");
		String id = vo.getId();
		System.out.println(id + "의 시간표");
		List<TimeTableVO> table_vo = service.timeTable_list(id);
		
		
		model.addAttribute("vo",vo);
		model.addAttribute("table_vo", table_vo);
		model.addAttribute("enrol_vo", enrol_vo);
		return "time/timeTable";
	}// 시간표 보기
	
	@RequestMapping(value = "/detail.tt", produces = "text/html; charset=utf-8")
	public String timeTableDetail( Model model, int lecture_num, @RequestParam(defaultValue = "-1") int dataLength) {
		TimeTableVO vo = service.timeTableDetail(lecture_num);
		model.addAttribute("vo", vo);
		return "time/timeTableDetail";
	}// 시간표 상세 보기
	
	@RequestMapping(value = "/regist.tt", produces = "text/html; charset=utf-8")
	public String regist(String lecture_title, String state ,Model model, HttpSession session ,String sortation) {
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		String id = member.getId();
		HashMap<String, String> temp_map = new HashMap<String, String>();
		temp_map.put("id", id);
		temp_map.put("lecture_title", lecture_title);
		temp_map.put("sortation", sortation);
		System.out.println(id + "의 수강신청");
		
		List<TimeTableVO> vo = service.timeTableRegist(temp_map);
		
		//List<TimeTableVO> list = service.sortation_list(sortation);
		
		
		
		model.addAttribute("vo", vo);
		model.addAttribute("temp_map", temp_map);
		//model.addAttribute("list", list);
		return"time/regist";
	}// 강의 신청 목록
	
	@RequestMapping(value = "lecture_list", produces = "text/html; charset=utf-8")
	public String lecture_title_list(Model model, String name) {
		List<TimeTableVO> list = service.lecture_title_search(name);
		
		model.addAttribute("list", list);
		
		return "time/search/list";
	}// 과목명 검색
	
	@RequestMapping(value = "/insert.tt", produces = "text/html; charset=utf-8")
	public String insert(EnrolmentVO vo, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		vo.setId(member.getId());
		
		service.timeTable_insert(vo);
		return "redirect:regist.tt";
	}// 수강 시간표 등록
	
	
	@RequestMapping("/delete.tt")
	public String delete(HttpSession session, EnrolmentVO enrol_vo) {
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		service.timeTable_delete(enrol_vo);
		
		return "redirect:spareTimeTable.tt?id=" + member.getId();
	}// 강의 삭제

	@RequestMapping(value = "/list.tt", produces = "text/html; charset=utf-8")
	public void myList(String id) {
		System.out.println(id + "의 수강신청 목록");
		
	}
	
	@RequestMapping(value = "/list.at", produces = "text/html; charset=utf-8")
	public String list(String id) {
		System.out.println(id + "수강신청");
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("id", id);
		return new Gson().toJson(sql.selectList("time.regist",map));
	}// 안드로이드 수강신청 리스트
	
	@RequestMapping(value = "/detail.at", produces = "text/html; charset=utf-8")
	public void detail(String id) {
		System.out.println("상세보기");
		return ;
	}
	
	@RequestMapping(value = "/insert.at", produces = "text/html; charset=utf-8")
	public String insert(EnrolmentVO enrol_vo, String id) {
		System.out.println(id + "시간표에 강의 추가");
		return new Gson().toJson(sql.insert("time.insert",enrol_vo));
	}
	
	@RequestMapping(value = "/delete.at", produces = "text/html; charset=utf-8")
	public String delete(EnrolmentVO enrol_vo, String id) {
		System.out.println(id + "삭제");
		return new Gson().toJson(sql.delete("time.delete",enrol_vo));
	}
	
	@RequestMapping(value = "/table.at", produces = "text/html; charset=utf-8")
	public String table_list(String id, EnrolmentVO enrol_vo, TimeTableVO table_vo) {
		System.out.println(id + "시간표");
		return new Gson().toJson(sql.selectList("time.timeTable_list", id));
	}

}
