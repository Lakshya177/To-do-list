<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="util.HibernateUtil" %>
<%@ page import="model.Task" %>

<html>
<head>
<title>Task List</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #232526, #414345);
}

.container {
    display: flex;
    justify-content: center;
    margin-top: 50px;
}

.box {
    background: white;
    padding: 20px;
    border-radius: 10px;
    width: 80%;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: green;
    color: white;
    padding: 10px;
}

td {
    padding: 10px;
    text-align: center;
}

.pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination a {
    padding: 8px 12px;
    margin: 3px;
    text-decoration: none;
    background: blue;
    color: white;
    border-radius: 5px;
}
/* Logout button top-right */
.logout-btn {
    position:  fixed;
    top: 20px;
    right: 30px;
    text-decoration: none;
    background-color: blue;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    font-weight: bold;
}

.logout-btn:hover {
    background-color: darkred;
}
</style>

</head>

<body>
<a href="index.jsp" class="logout-btn">Logout</a>
<div class="container">
<div class="box">

<h2 align="center">Task List-3</h2>

<%
int pageNo = 3;   
int recordsPerPage = 5;

// agar URL me page aaye to wo use hoga
if(request.getParameter("page") != null){
    pageNo = Integer.parseInt(request.getParameter("page"));
}

Session session2 = HibernateUtil.getSessionFactory().openSession();

// ✅ Pagination
Query<Task> q = session2.createQuery("from Task", Task.class);
q.setFirstResult((pageNo - 1) * recordsPerPage);
q.setMaxResults(recordsPerPage);

List<Task> list = q.list();

// ✅ Total count
Query<Long> countQ = session2.createQuery("select count(*) from Task", Long.class);
long totalRecords = countQ.uniqueResult();

int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
%>

<table>
<tr>
<th>ID</th>
<th>Title</th>
<th>Description</th>
</tr>

<%
for(Task t : list){
%>
<tr>
<td><%= t.getId() %></td>
<td><%= t.getTitle() %></td>
<td><%= t.getDescription() %></td>
</tr>
<%
}
session2.close();
%>

</table>


<div class="pagination">

<!-- ❌ Next  nahi -->
<a href="Nextclick2.jsp">previous</a>
<a href="NextCLick.jsp">1</a>
<a href="Nextclick2.jsp">2</a>
<a href="Nextclick3.jsp">3</a>

</div>

</div>
</div>

</body>
</html>