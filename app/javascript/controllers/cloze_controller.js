import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake", "input", "inputClass", "solution" ]
  static values = {
    accountId: Number,
    totalPossiblePoints: Number,
    pointsDeductionForMistake: Number,
    exerciseId: Number,
    exerciseClass: String,
    myPoints: Number,
    solution: Array,
    inputClass: String
  }


  connect(){
    import("jquery_with_setup").then(jquery_with_setup => {

    });

  }

  disconnect(){

  }

  check() {
    var self = this;
    var missing_answers = [...this.solutionValue];
    var wrong_answers = [];

    $(this.inputClassValue).map(function() {
      console.log("REIGN IN TERROR")
      console.log(this.value);

      if(self.solutionValue[parseInt(this.getAttribute('data-input-id'))].split(",").includes(this.value)){
        this.classList.remove("bg-wrong-color");
        this.classList.add("bg-correct-color");
        missing_answers.splice(missing_answers.indexOf(missing_answers[this.getAttribute('data-input-id')]), 1);

      } else {
        this.classList.add("bg-wrong-color");
        var input_field = this;
        setTimeout(function(){
          input_field.classList.remove("bg-wrong-color");
          input_field.value = '';
        }, 2000)
        console.log("WRONG!");
        wrong_answers.push(this.value);
      }

    });

    if((missing_answers.length === 0) && (wrong_answers.length === 0)){

      var ajax = new Ajax.ajax();
      ajax.updateExerciseHistoryOfAccount(self.accountIdValue, self.exerciseClassValue, self.exerciseIdValue, self.myPoints)
      .then(() => {
        const finish_exercise = new CustomEvent('finish_exercise', {
          detail: {
            points: self.myPointsValue
          }
        })
        window.dispatchEvent(finish_exercise);
      });


    } else {
      self.punishForMistake();
    }

  }

  punishForMistake(){
    if((this.myPointsValue - this.pointsDeductionForMistakeValue) < 0){
      this.myPointsValue = 0
    } else {
      this.myPointsValue = this.myPointsValue - this.pointsDeductionForMistakeValue
    }
  }

}
