<%@ page import="org.hibernate.Session,org.hibernate.Transaction,util.HibernateUtil,model.Task"%>
<html>
<head>
<title>To Do List</title>

<style>

body {
    font-family: Arial;
    background: linear-gradient(135deg, #153677,#4e085f);
}
.container {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.box {
    background-color: white;
    padding: 20px;
    border: 2px solid black;
    border-radius: 10px;
    width: 300px;
    text-align: center;
    box-shadow: 0px 0px 10px gray;
}
input, textarea {
    width: 90%;
    padding: 8px;
    margin-top: 5px;
}
.show-link {
    display: block;
    margin-top: 10px;
    text-decoration: none;
    color: blue;
    font-weight: bold;
}
.show-link:hover {
    color: darkblue;
}
input[type="submit"] {
    background-color: green;
    color: white;
    border: none;
    padding: 10px;
    width: 95%;
    cursor: pointer;
}
.img {
    width: 30px;
    margin-left: 10px;
    vertical-align: middle;
}
</style>
</head>

<body>

<div class="container">
    <div class="box">
        <h2>To-Do List <img src="icon.png" class="img"></h2>

        <form action="index.jsp" method="post">
            Title <br>
            <input type="text" name="title" required> 
            <br><br>

            Description <br>
            <textarea name="description" required></textarea>
            <br><br>

            <input type="submit" value="Add">
            <a href="showTask.jsp" class="show-link">Show Task</a>  
            <a href="NextCLick.jsp?page=1" class="show-link">Next click</a>
        </form>

        <%
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        if (title != null && description != null) {

            Session session2 = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = session2.beginTransaction();

            Task t = new Task();
            t.setTitle(title);
            t.setDescription(description);

            session2.persist(t);

            tx.commit();
            session2.close();

            out.println("<p style='color:green;'>Task Added Successfully</p>");
        }
        %>

    </div>
</div>

</body>
</html>