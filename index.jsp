<!DOCTYPE html>
<html>
<head>
    <title>Quiz Application</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { width: 50%; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        h2 { text-align: center; }
        .question { margin-bottom: 15px; }
        .submit { display: block; margin: 20px auto; padding: 10px 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quiz Application</h2>
        <form action="result.jsp" method="post">
            <%
                // Define questions and options
                String[] questions = {
                    "What is the capital of France?",
                    "Which programming language is used for Android development?",
                    "What is 5 + 3?"
                };

                String[][] options = {
                    {"Berlin", "Paris", "Madrid"},
                    {"Java", "Python", "Ruby"},
                    {"5", "8", "10"}
                };

                for (int i = 0; i < questions.length; i++) {
            %>
            <div class="question">
                <p><%= (i + 1) %>. <%= questions[i] %></p>
                <% for (int j = 0; j < options[i].length; j++) { %>
                <label>
                    <input type="radio" name="answer<%= i %>" value="<%= (j + 1) %>" required>
                    <%= options[i][j] %>
                </label><br>
                <% } %>
            </div>
            <% } %>
            <button type="submit" class="submit">Submit</button>
        </form>
    </div>
</body>
</html>
