<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"  %>
<%@ page import="com.google.gson.Gson" %>
<%
// 요청 URL이 바뀌지 않아요 - forward
	List<Map<String,Object>> memberList = null;
	memberList = (List<Map<String,Object>>)request.getAttribute("memberList");
	Gson g = new Gson();
	String imsi = g.toJson(memberList);
	out.print(imsi);
%>
