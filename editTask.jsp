<%@ page import="org.hibernate.*,util.HibernateUtil,model.Task" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Session session2 = HibernateUtil.getSessionFactory().openSession();
Task t = session2.get(Task.class,id);
%>

<html>
<head>
<title>Edit Task</title>

<style>
body {
    font-family: Arial;
    background-color: #f0f2f5;
    margin: 0;
   background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
}

/* Center Box */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Form Box */
.box {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    width: 350px;
    box-shadow: 0px 0px 10px gray;
    text-align: center;
}

input, textarea {
    width: 90%;
    padding: 8px;
    margin-top: 5px;
}

/* Update Button */
input[type="submit"] {
    background-color: orange;
    color: white;
    border: none;
    padding: 10px;
    width: 95%;
    cursor: pointer;
    border-radius: 5px;
}

input[type="submit"]:hover {
    background-color: darkorange;
}

/* Back Button */
.back-btn {
    display: block;
    margin-top: 10px;
    text-decoration: none;
    background-color: gray;
    color: white;
    padding: 8px;
    border-radius: 5px;
}
</style>

</head>

<body>

<div class="container">
<div class="box">

<h2>Edit Task</h2>

<form action="updateTask.jsp" method="post">

<input type="hidden" name="id" value="<%=t.getId()%>">

Title<br>
<input type="text" name="title" value="<%=t.getTitle()%>">

<br><br>

Description<br>
<textarea name="description"><%=t.getDescription()%></textarea>

<br><br>

<input type="submit" value="Update">

</form>

<a href="showTask.jsp" class="back-btn">Back</a>

</div>
</div>

</body>
</html>