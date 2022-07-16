import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var myPoints = 3;
var pointsDeductionForMistake = 1;
var solution = [];

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake", "input", "inputClass", "solution" ]

  connect(){
    import("jquery_with_setup").then(jquery_with_setup => {
      myPoints = this.totalPossiblePointsTarget.getAttribute('data-value')
      pointsDeductionForMistake = this.pointsDeductionForMistakeTarget.getAttribute('data-value')
      solution = this.solutionTarget.getAttribute('data-value').split(/\r?\n/)
      console.log("myPoints");
      console.log(myPoints);
    });

  }

  disconnect(){

  }

  check() {
    console.log("check");
    console.log(this.inputClassTarget.getAttribute('data-value'));
    console.log($(this.inputClassTarget.getAttribute('data-value')));
    console.log(solution);

    $(this.inputClassTarget.getAttribute('data-value')).map(function() {
      console.log(this.value);
      console.log(this.getAttribute('data-input-id'));
      console.log(solution[this.getAttribute('data-input-id')])
      console.log(solution[this.getAttribute('data-input-id')].split(",").includes(this.value))
    });

    if(event.params.quizQuestionCorrectAnswer === "yes"){
      console.log(myPoints);

      $(this.buttonTargets).prop("disabled", true);
      $(this.buttonTargets).addClass( "disabled" );
      $(event.target).addClass("correct-answer");

      var ajax = new Ajax.ajax();
      ajax.updateExerciseHistoryOfAccount(this.accountIdTarget.getAttribute('data-value'), this.exerciseClassTarget.getAttribute('data-value'), this.exerciseIdTarget.getAttribute('data-value'), myPoints)
      .then(() => {
        const custom_event = new CustomEvent('correct-answer', {
          detail: {
            points: myPoints
          }
        })
        window.dispatchEvent(custom_event);
      });

    } else {
        $(event.target).prop("disabled", true);
        $(event.target).addClass( "disabled" );
        $(event.target).addClass("false-answer");
        if((myPoints - pointsDeductionForMistake) < 0){
          myPoints = 0
        } else {
          myPoints = myPoints - pointsDeductionForMistake
        }
    }

  }
}
