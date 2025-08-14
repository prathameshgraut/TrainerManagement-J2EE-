<%@ page import="java.util.*, POJO.Subject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subject Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 30px;
        }

        .subject-container {
            background: white;
            padding: 25px 40px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            width: 500px;
            text-align: center;
        }

        .subject-container img {
            width: 80px;
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #bbb;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        form {
            margin-top: 15px;
        }

        input[type="text"] {
            padding: 8px;
            width: 70%;
            border: 1px solid #aaa;
            border-radius: 4px;
        }

        input[type="submit"] {
            padding: 8px 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            margin-left: 10px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .no-subjects {
            margin-top: 15px;
            color: red;
        }
    </style>
</head>
<body>

<div class="subject-container">
    <img src="https://cdn-icons-png.flaticon.com/512/3305/3305803.png" alt="Subject Icon">

    <h2>Add New Subject</h2>
    <form action="subject" method="post">
        <input type="text" name="name" placeholder="Enter subject name" required>
        <input type="submit" value="Add">
    </form>

    <h2>All Subjects</h2>

    <%
        List<Subject> subjectList = (List<Subject>) request.getAttribute("subjects");
        if (subjectList != null && !subjectList.isEmpty()) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Subject Name</th>
            </tr>
    <%
            for (Subject s : subjectList) {
    %>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
            </tr>
    <%
            }
    %>
        </table>
    <%
        } else {
    %>
        <p class="no-subjects">No subjects found.</p>
    <%
        }
    %>
</div>

</body>
</html>
