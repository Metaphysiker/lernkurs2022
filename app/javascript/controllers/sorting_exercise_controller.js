// hello_controller.js
import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"
let sortable = undefined;

export default class extends Controller {
  static targets = [ "name", "output", "sortable" ]
  static values = {
    accountId: Number,
    totalPossiblePoints: Number,
    pointsDeductionForMistake: Number,
    exerciseId: Number,
    exerciseClass: String,
    myPoints: Number,
    solution: Array
  }

  connect() {

    var self = this;

    //import("jquery_with_setup");
    import("sortablejs").then(sortablejs => {
      console.log("let's goo!");

        sortable = sortablejs.Sortable.create(self.sortableTarget);



    })

  }

  disconnect() {
    sortable.destroy();
  }

  check(){
    var answer_array = sortable.toArray();
    var error_count = 0;
    for (let i = 0; i < this.solutionValue.length; i++) {
      if(this.solutionValue[i] !== answer_array[i]){
        error_count++;
        document.querySelector('[data-id="' + this.solutionValue[i] +'"]').classList.add("bg-wrong-color");
      } else {
        document.querySelector('[data-id="' + this.solutionValue[i] +'"]').classList.add("bg-correct-color");
      }
    }

    if(error_count > 0){
      this.punishForMistake;
    } else {

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
    }


  }


  punishForMistake(){
    if((this.myPointsValue - this.pointsDeductionForMistakeValue) < 0){
      this.myPointsValue = 0
    } else {
      this.myPointsValue = this.myPointsValue - this.pointsDeductionForMistakeValue
    }
  }



  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
