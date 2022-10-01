import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake", "input", "solution" ]
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
    import("jquery_with_setup").then(jquery_with_setup => {

    });

  }

  disconnect(){

  }

  check() {
    var self = this;
    var correct_answers = 0;
    var answer = this.inputTarget.value.toLowerCase().replace(/\s/g,'');
    for (let i = 0; i < this.solutionValue.length; i++) {
      if(this.solutionValue[i]===answer){
        correct_answers++;
      }
    }

    if(correct_answers>0){
      this.inputTarget.classList.add("bg-correct-color");
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
      this.inputTarget.classList.add("bg-wrong-color");
      setTimeout(function(){
        self.inputTarget.classList.remove("bg-wrong-color");
      }, 1000)

      this.punishForMistake();
      this.inputTarget.value = "";
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
