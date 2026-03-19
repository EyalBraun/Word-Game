<%@ Page Title="Wordle Quiz" Language="C#" MasterPageFile="~/2.0/aspx pages/MasterPage.Master" AutoEventWireup="true" CodeBehind="quiz.aspx.cs" Inherits="Eyal_Braun_Projects._2._0.aspx_pages.quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Designs/QuizStyles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="quiz-container">
        
        <div class="quiz-header">
            <h2>Wordle Mechanics Quiz</h2>
            <p>Test your knowledge of the popular daily word game!</p>
        </div>

        <h3 id="lblGeneralMessage" runat="server" class="message-label"></h3>
        
        <div id="pnlQuiz" runat="server">
            <form runat="server" method="post">
                
                <div class="question-block">
                    <h3>1. How many letters are in a standard Wordle guess?</h3>
                    <select name="q1" required>
                        <option value="" disabled selected>-- Select an answer --</option>
                        <option value="A">4 Letters</option>
                        <option value="B">5 Letters</option>
                        <option value="C">6 Letters</option>
                        <option value="D">7 Letters</option>
                    </select>
                    <div class="stats-box">
                        <span id="statsQ1" runat="server"></span>
                    </div>
                </div>

                <div class="question-block">
                    <h3>2. What does a GREEN tile indicate in the game?</h3>
                    <select name="q2" required>
                        <option value="" disabled selected>-- Select an answer --</option>
                        <option value="A">Letter is not in the word</option>
                        <option value="B">Word is not in dictionary</option>
                        <option value="C">Correct letter, wrong spot</option>
                        <option value="D">Correct letter, correct spot</option>
                    </select>
                    <div class="stats-box">
                        <span id="statsQ2" runat="server"></span>
                    </div>
                </div>

                <div class="question-block">
                    <h3>3. What color tile represents a letter that is IN the word, but in the WRONG position?</h3>
                    <input type="text" name="q3" placeholder="Type the color name..." required />
                    <div class="stats-box">
                        <span id="statsQ3" runat="server"></span>
                    </div>
                </div>

                <input type="submit" value="Submit Answers" class="btn-submit" />
            </form>
        </div>
        
        <div class="score-display">
            <h2 id="lblFinalScore" runat="server" class="score-text"></h2>
        </div>

    </div>
</asp:Content>