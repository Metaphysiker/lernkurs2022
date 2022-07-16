import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "user_id", "accountId", "courseId", "output" ]


  updateCounter({ detail: { points } }) {
    var ajax = new Ajax.ajax();
    ajax.getPointsFromCourse(this.accountIdTarget.getAttribute('data-value'), this.courseIdTarget.getAttribute('data-value'))
    .then((response) => {
      console.log("getPointsFromCourse");
      console.log(response);
      this.incrementallyUpdate(this.outputTarget, points);
    });


  //  this.outputTarget.innerHTML =
  //    `${parseInt(this.outputTarget.innerHTML) + 100}`
  }

  incrementallyUpdate(element, points){

    console.log("incrementallyUpdate")
    console.log(this.outputTarget.innerHTML);
    var current_value = parseInt(this.outputTarget.innerHTML);
    var difference = points - current_value;
    console.log(difference);

    var myPromise = () => new Promise(resolve => setTimeout(resolve, 50));

    for (let i = 0, p = Promise.resolve(); i < difference; i++) {
        p = p.then(() => myPromise())
             .then(() => this.outputTarget.innerHTML = `${parseInt(this.outputTarget.innerHTML) + 1}` );
    }
  }

}
