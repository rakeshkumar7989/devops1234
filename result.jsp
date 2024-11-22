<!DOCTYPE html>
<html>
<head>
    <title>Quiz Results</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { width: 50%; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        h2 { text-align: center; }
        .result { text-align: center; font-weight: bold; margin-top: 20px; }
        .details { margin-top: 15px; }
        .correct { color: green; }
        .wrong { color: red; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quiz Results</h2>
        <%
            // Define correct answers
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

            int[] correctAnswers = {2, 1, 2}; // Correct options (1-based index)
            int score = 0;

            // Process user answers
            for (int i = 0; i < questions.length; i++) {
                String userAnswer = request.getParameter("answer" + i);
                int userAnswerIndex = userAnswer != null ? Integer.parseInt(userAnswer) : -1;

                if (userAnswerIndex == correctAnswers[i]) {
                    score++;
                }
        %>
        <div class="details">
            <p><b>Question <%= (i + 1) %>:</b> <%= questions[i] %></p>
            <p>Your Answer: <%= options[i][userAnswerIndex - 1] %></p>
            <p>Correct Answer: <%= options[i][correctAnswers[i] - 1] %></p>
            <p>Status: 
                <span class="<%= (userAnswerIndex == correctAnswers[i]) ? "correct" : "wrong" %>">
                    <%= (userAnswerIndex == correctAnswers[i]) ? "Correct" : "Wrong" %>
                </span>
            </p>
            <hr>
        </div>
        <% } %>

        <div class="result">
            <h3>Your Score: <%= score %> / <%= questions.length %></h3>
        </div>
    </div>
</body>
</html>
