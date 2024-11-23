<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%
    // Initialize the To-Do list in the application scope if it doesn't exist
    List<String> todoList = (List<String>) application.getAttribute("todoList");
    if (todoList == null) {
        todoList = new ArrayList<>();
        application.setAttribute("todoList", todoList);
    }

    // Handle form submission
    String task = request.getParameter("task");
    String removeIndex = request.getParameter("remove");
    if (task != null && !task.trim().isEmpty()) {
        todoList.add(task);
    }
    if (removeIndex != null) {
        int index = Integer.parseInt(removeIndex);
        if (index >= 0 && index < todoList.size()) {
            todoList.remove(index);
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 10px;
            width: 300px;
        }
        input[type="submit"] {
            padding: 10px;
            background-color: #5cb85c;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 10px;
            background-color: #fff;
            margin: 5px 0;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
        }
        .remove-button {
            background-color: #d9534f;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            padding: 5px 10px;
        }
        .remove-button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <h1>My To-Do List</h1>
    <form action="index.jsp" method="post">
        <input type="text" name="task" placeholder="Add a new task..." required>
        <input type="submit" value="Add Task">
    </form>

    <ul>
        <% for (int i = 0; i < todoList.size(); i++) { %>
            <li>
                <span><%= todoList.get(i) %></span>
                <form action="index.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="remove" value="<%= i %>">
                    <input type="submit" class="remove-button" value="Remove">
                </form>
            </li>
        <% } %>
    </ul>
</body>
</html>
