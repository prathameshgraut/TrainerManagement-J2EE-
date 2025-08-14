<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, POJO.Trainer" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trainer Management</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            padding: 30px;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 600px;
            text-align: center;
        }

        img {
            width: 80px;
            margin-bottom: 15px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            width: 90%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            padding: 8px 14px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .delete-btn {
            background-color: #dc3545;
            margin-top: 0;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<div class="container">
    <img src="https://cdn-icons-png.flaticon.com/512/1995/1995574.png" alt="Trainer Icon">
    <h2>Add New Trainer</h2>

    <form action="trainer" method="post">
        <label>Emp ID:</label><br>
        <input type="number" name="empId" required><br>

        <label>Name:</label><br>
        <input type="text" name="name" required><br>

        <label>Subject:</label><br>
        <input type="text" name="subject" required><br>

        <input type="submit" value="Add Trainer">
    </form>

    <hr>

    <h2>All Trainers</h2>

    <table>
        <tr>
            <th>Emp ID</th>
            <th>Name</th>
            <th>Subject</th>
            <th>Action</th>
        </tr>
        <%
            List<Trainer> trainerList = (List<Trainer>) request.getAttribute("trainers");
            if (trainerList != null && !trainerList.isEmpty()) {
                for (Trainer t : trainerList) {
        %>
        <tr>
            <td><%= t.getEmpId() %></td>
            <td><%= t.getName() %></td>
            <td><%= t.getSubject() %></td>
            <td>
                <form method="post" action="trainer">
                    <input type="hidden" name="actionType" value="delete">
                    <input type="hidden" name="empId" value="<%= t.getEmpId() %>">
                    <input type="submit" value="Delete" class="delete-btn">
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No trainers found.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>
