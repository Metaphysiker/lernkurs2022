import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var myPoints = 3;
var pointsDeductionForMistake = 1;
var solution = [];

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake", "input", "solution" ]

  connect(){
    import("jquery_with_setup").then(jquery_with_setup => {
      myPoints = this.totalPossiblePointsTarget.getAttribute('data-value')
      pointsDeductionForMistake = this.pointsDeductionForMistakeTarget.getAttribute('data-value')
      solution = this.solutionTarget.getAttribute('data-value')
    });

  }

  disconnect(){

  }

  check() {

    if(solution.includes(this.inputTarget.value)){

      const custom_event = new CustomEvent('correct-answer', {
            detail: {
              points: myPoints
            }
          })

        window.dispatchEvent(custom_event)

        var ajax = new Ajax.ajax();
        ajax.updateExerciseHistoryOfAccount(this.accountIdTarget.getAttribute('data-value'), this.exerciseClassTarget.getAttribute('data-value'), this.exerciseIdTarget.getAttribute('data-value'), myPoints);

    } else {
      if((myPoints - pointsDeductionForMistake) < 0){
        myPoints = 0
      } else {
        myPoints = myPoints - pointsDeductionForMistake
      }
    }

  }
}
