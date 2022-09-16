import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var myPoints = 3;
var pointsDeductionForMistake = 1;

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake" ]
  static values = {
    accountId: Number,
    totalPossiblePoints: Number,
    pointsDeductionForMistake: Number,
    exerciseId: Number,
    exerciseClass: String,
    myPoints: Number
  }

  connect(){
    import("jquery_with_setup").then(jquery_with_setup => {
      //myPoints = //this.totalPossiblePointsTarget.getAttribute('data-value')
      //pointsDeductionForMistake = this.pointsDeductionForMistakeTarget.getAttribute('data-value')
      //console.log("myPoints");
      //console.log(myPoints);
    });

  }

  disconnect(){

  }

  check() {

    if(event.params.quizQuestionCorrectAnswer === "yes"){
      console.log(myPoints);

      $(this.buttonTargets).prop("disabled", true);
      $(this.buttonTargets).addClass( "disabled" );
      $(event.target).addClass("correct-answer");

      var ajax = new Ajax.ajax();
      ajax.updateExerciseHistoryOfAccount(this.accountIdValue, this.exerciseClassValue, this.exerciseIdValue, this.myPointsValue)
      .then(() => {

        const finish_exercise = new CustomEvent('finish_exercise', {
          detail: {
            points: this.myPointsValue
          }
        })
        window.dispatchEvent(finish_exercise);

      });

    } else {
        $(event.target).prop("disabled", true);
        $(event.target).addClass( "disabled" );
        $(event.target).addClass("false-answer");
        if((this.myPointsValue - this.pointsDeductionForMistakeValue) < 0){
          this.myPointsValue = 0
        } else {
          this.myPointsValue = this.myPointsValue - this.pointsDeductionForMistakeValue
        }
    }

  }
}
