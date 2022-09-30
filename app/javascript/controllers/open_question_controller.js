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
    solution: String
  }

  connect(){
    import("jquery_with_setup").then(jquery_with_setup => {

    });

  }

  disconnect(){

  }

  check() {
    console.log(this.solutionValue);
    console.log(this.inputTarget.value.toLowerCase().replace(/\s/g,''));
    if(this.solutionValue.includes(this.inputTarget.value.toLowerCase().replace(/\s/g,''))){

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
      this.punishForMistake();
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
