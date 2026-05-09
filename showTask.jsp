<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="util.HibernateUtil" %>
<%@ page import="model.Task" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Show Task</title>

<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #ff7e5f, #feb47b);
    margin: 0;
}

.container {
    display: flex;
    justify-content: center;
    margin-top: 50px;
}

.box {
    background-color: white;
    padding: 15px;            
    border-radius: 6px;         
    width: 80%;
    box-shadow: 0px 0px 5px gray; 
    border: 1px solid #ddd;     
}

/* Header */
.header {
    display: flex;
    justify-content: center;
    align-items: center;
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

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    border: 1px solid #ddd;  
}

td {
    padding: 8px;              
    text-align: center;
    border-bottom: 1px solid #eee; 
}

th {
    background-color: #4CAF50;
    color: white;
    padding: 8px;  
}

tr:hover {
    background-color: #f5f5f5;
}

/* Edit/Delete */
a {
    text-decoration: none;
  }

.show-link {
    display: block;
    width: 75px;
    margin: 10px auto;
    text-decoration: none;
    color: White;
    font-weight: bold;
}
.show-link:hover {
    background-color: red;
}

</style>

</head>

<body>

<a href="index.jsp" class="logout-btn">Logout</a>
<div class="container">
<div class="box">

<div class="header">
    <h1>Task List</h1>
</div>

<table>

<tr>
<th>ID</th>
<th>Title</th>
<th>Description</th>
<th>Edit</th>
<th>Delete</th>
</tr>

<%
Session session2 = HibernateUtil.getSessionFactory().openSession();
Query<Task> q = session2.createQuery("from Task", Task.class);
List<Task> list = q.list();

for(Task t : list){
%>

<tr>
<td><%= t.getId() %></td>
<td><%= t.getTitle() %></td>
<td><%= t.getDescription() %></td>

<td>
<a href="editTask.jsp?id=<%= t.getId() %>">✏️</a>
</td>

<td>
<a href="deleteTask.jsp?id=<%= t.getId() %>">❌</a>
</td>

</tr>

<%
}
session2.close();
%>

</table>

</div>
</div>
 
</body>
</html>