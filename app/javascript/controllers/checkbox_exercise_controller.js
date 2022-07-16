import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var myPoints = 3;
var pointsDeductionForMistake = 1;
var solution = [];

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake", "checkboxClass", "solution" ]

  connect(){
    import("jquery_with_setup").then(jquery_with_setup => {
      myPoints = this.totalPossiblePointsTarget.getAttribute('data-value')
      pointsDeductionForMistake = this.pointsDeductionForMistakeTarget.getAttribute('data-value')
      solution = this.solutionTarget.getAttribute('data-value').split(',').map ( Number )
    });

  }

  disconnect(){

  }

  check() {
    console.log(myPoints);

    var missing_answers = [...solution];
    var wrong_answers = [];
    //var checkedVals = $("." + this.checkboxClassTarget.getAttribute('data-value') +":checkbox:checked").map(function() {
    //    return {value: this.value, id: this.id};
    //}).get();

     $("." + this.checkboxClassTarget.getAttribute('data-value') +":checkbox:checked").map(function() {
       var checkbox_value = parseInt(this.value);

       if(solution.includes(checkbox_value)){

         $("#" + this.id).prop("disabled", true);

         missing_answers.splice(missing_answers.indexOf(checkbox_value),1);
       } else {
         $("#" + this.id).prop( "checked", false );
         $("#" + this.id).prop("disabled", true);
         wrong_answers.push(checkbox_value);
       }
    })

    //check if all correct answers are present and whether there are no wrong answers present
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
