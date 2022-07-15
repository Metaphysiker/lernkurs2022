var myPoints = 3;
var pointsDeductionForMistake = 1;

connect(){
  import("jquery_with_setup").then(jquery_with_setup => {
    myPoints = this.totalPossiblePointsTarget.getAttribute('data-value')
    pointsDeductionForMistake = this.pointsDeductionForMistakeTarget.getAttribute('data-value')
  });
}

#HTML

<div data-controller="quiz">
  <div data-quiz-target="accountId" data-value="<%= @account.id %>" >
  </div>
  <div data-quiz-target="exerciseId" data-value="<%= quiz.id %>" >
  </div>
  <div data-quiz-target="exerciseClass" data-value="<%= quiz.class.name %>" >
  </div>
  <div data-quiz-target="totalPossiblePoints" data-value="<%= quiz.point_system.total_possible_points unless quiz.point_system.blank? %>" >
  </div>
  <div data-quiz-target="pointsDeductionForMistake" data-value="<%= quiz.point_system.points_deduction_for_mistake unless quiz.point_system.blank? %>" >
  </div>
  <% quiz.quiz_questions.each do |quiz_question| %>
  <div class="d-grid gap-2">
    <button data-quiz-target="button" data-action="click->quiz#check" data-quiz-quiz-question-correct-answer-param="<%= quiz_question.correct_answer %>" data type="button" class="quiz-button "><%= quiz_question.content %></button>
  </div>
  <% end %>


  <span data-quiz-target="output">
  </span>
</div>
