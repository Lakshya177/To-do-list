# To-do-list

📌 Overview
<pre>
This is a To-Do List Web Application built using Java, Hibernate, JSP, and Servlets. 
It helps users manage tasks with CRUD operations and simple pagination.
</pre>

🚀 Features
<pre>
1 🧾 Task Management
2 ➕ Add Task (Title, Description)
3 📋 Show All Tasks
4 ✏️ Edit Task
5 ❌ Delete Task
</pre>

📊 Task Table View
<pre>
Tasks are displayed in table format:
| ID | Title  | Description  | Actions       |
| -- | ------ | ------------ | ------------- |
| 1  | Task 1 | Example desc | Edit / Delete |
</pre>

📄 Pagination (Important Feature)
<pre>
1.Tasks are shown 5 items per page
2.Click Next to view next 5 tasks
3.Click Previous to go back

Example:
  
ID  Title   Description
1   Task1   Desc1
2   Task2   Desc2
3   Task3   Desc3
4   Task4   Desc4
5   Task5   Desc5

Page 2 (Next Click)
ID  Title   Description
6   Task6   Desc6
7   Task7   Desc7
8   Task8   Desc8
9   Task9   Desc9
10  Task10  Desc10

Page 3 (Next Click)
ID   Title    Description
11   Task11   Desc11
12   Task12   Desc12
13   Task13   Desc13
14   Task14   Desc14
15   Task15   Desc15
</pre>

🛠️ Technologies Used
<pre>
1.JDK
2.Hibernate
3.JSP & Servlets
4.MySQL
5.Apache Tomcat
6.HTML, CSS
</pre>

🗂️ Project Structure
<pre>
ToDoApp
│── src
│   ├─ dao     
|   |  └──TaskDAO.java
|   |
│   ├── model 
|   |  └──Task.java
|   |
│   ├── util    
|   | └──hibernate.cfg.xml
|   |
│── src
│   └── main          
│     └─── webapp   
|          ├──delete.jsp
|          ├──edit.jsp
|          ├──index.JSP
|          ├──update.jsp
|          ├──showtask.jsp
|          ├──Nextclick.jsp
|          ├──Nextclick2.jsp
|          └───Nextclick3.jsp
|
└── target
     └──pom.xml
</pre>

📊 Entity Class (Task.java)
<pre>
package model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="tasks")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String title;
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
</pre>

🔄 CRUD Operations (DAO Example)
<pre>
package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Task;
import util.HibernateUtil;

public class TaskDAO {

    public void saveTask(Task t) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.persist(t);

        tx.commit();
        session.close();
    }

    public List<Task> getTasks(int start){

        Session session = HibernateUtil.getSessionFactory().openSession();

        Query q = session.createQuery("from Task");
        q.setFirstResult(start);
        q.setMaxResults(5);

        List<Task> list = q.list();

        session.close();

        return list;
    }
}
</pre>
📸 Screenshots (Optional)
<br>
📌 Conclusion
<pre>
This To-Do List Application demonstrates the use of Hibernate with JSP and Servlets to perform efficient 
task management operations. The project successfully implements core functionalities such as adding,
viewing, updating, and deleting tasks, along with pagination to handle large datasets.
</pre>
