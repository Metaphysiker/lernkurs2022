import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "user_id", "accountId", "courseId", "output" ]


  updateCounter({ detail: { points } }) {
    var ajax = new Ajax.ajax();
    ajax.getPointsFromCourse(this.accountIdTarget.getAttribute('data-value'), this.courseIdTarget.getAttribute('data-value'))
    .then((response) => {
      this.incrementallyUpdate(this.outputTarget, response);
    });


  //  this.outputTarget.innerHTML =
  //    `${parseInt(this.outputTarget.innerHTML) + 100}`
  }

  incrementallyUpdate(element, points){

    var current_value = parseInt(this.outputTarget.innerHTML);
    var target_value = points;

    //var current_value = parseInt(this.outputTarget.innerHTML);

    var myPromise = async (milli_seconds = 1000) => new Promise(resolve => setTimeout(resolve, milli_seconds));

    while (current_value != target_value) {

      if(current_value < target_value){
        current_value = parseInt(this.outputTarget.innerHTML) + 1;

        //Difference is targets not target.
        for (var i = 0; i < this.outputTargets.length; i++) {
          this.outputTargets[i].innerHTML = current_value;
        }


      } else {
        current_value = parseInt(this.outputTarget.innerHTML) - 1;

        for (var i = 0; i < this.outputTargets.length; i++) {
          this.outputTargets[i].innerHTML = current_value;
        }

      }

    }

  }

}
