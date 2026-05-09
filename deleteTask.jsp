<%@ page import="org.hibernate.Session,org.hibernate.Transaction,util.HibernateUtil,model.Task" %>

<%
String sid = request.getParameter("id");

if(sid != null){

int id = Integer.parseInt(sid);

Session session2 = HibernateUtil.getSessionFactory().openSession();
Transaction tx = session2.beginTransaction();

Task task = session2.get(Task.class, id);

if(task != null){
    session2.remove(task);
}

tx.commit();
session2.close();

}

response.sendRedirect("showTask.jsp");
%>