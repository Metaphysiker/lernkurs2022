import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var solution = [];

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake", "checkboxClass", "solution" ]
  static values = {
    accountId: Number,
    totalPossiblePoints: Number,
    pointsDeductionForMistake: Number,
    exerciseId: Number,
    exerciseClass: String,
    myPoints: Number,
    solution: Array
  }

  connect(){
    console.log(this.solutionValue);
    import("jquery_with_setup").then(jquery_with_setup => {

    });

  }

  disconnect(){

  }

  check() {
    var self = this;
    console.log(this.myPointsValue);

    var missing_answers = [...this.solutionValue];
    var wrong_answers = [];
    //var checkedVals = $("." + this.checkboxClassTarget.getAttribute('data-value') +":checkbox:checked").map(function() {
    //    return {value: this.value, id: this.id};
    //}).get();

     $("." + this.checkboxClassTarget.getAttribute('data-value') +":checkbox:checked").map(function() {
       var checkbox_value = parseInt(this.value);

       if(self.solutionValue.includes(checkbox_value)){

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
      console.log("all answers correct");

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
      if((this.myPointsValue - this.pointsDeductionForMistakeValue) < 0){
        this.myPointsValue = 0
      } else {
        this.myPointsValue = this.myPointsValue - this.pointsDeductionForMistakeValue
      }
    }


  }
}
