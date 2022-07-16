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
    var missing_answers = [...solution];
    var wrong_answers = [];

    $(this.inputClassTarget.getAttribute('data-value')).map(function() {


      if(solution[this.getAttribute('data-input-id')].split(",").includes(this.value)){
        console.log("REMOVE!");
        console.log(missing_answers.indexOf(this.value));
        //console.log(missing)

        missing_answers.splice(missing_answers.indexOf(missing_answers[this.getAttribute('data-input-id')]), 1);

      } else {
        console.log("WRONG!");
        wrong_answers.push(this.value);
      }

    });

    console.log(wrong_answers);
    console.log(missing_answers);

    if((missing_answers.length === 0) && (wrong_answers.length === 0)){

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
      if((myPoints - pointsDeductionForMistake) < 0){
        myPoints = 0
      } else {
        myPoints = myPoints - pointsDeductionForMistake
      }
    }

  }
}
