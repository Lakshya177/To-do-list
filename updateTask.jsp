<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.*,util.HibernateUtil,model.Task"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
String title = request.getParameter("title");
String description = request.getParameter("description");

Session session2 = HibernateUtil.getSessionFactory().openSession();
Transaction tx = session2.beginTransaction();

Task t = session2.get(Task.class, id);

t.setTitle(title);
t.setDescription(description);

session2.persist(t);

tx.commit();
session2.close();

response.sendRedirect("showTask.jsp");
%>