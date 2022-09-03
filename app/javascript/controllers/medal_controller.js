import * as Ajax from "ajax"

import { Controller } from "@hotwired/stimulus"

import { useIntersection, useResize } from "stimulus-use"

var ajax;

export default class extends Controller {
  static targets = [ "name", "output", "medalImage", "accountId", "courseId" ]

  connect() {
    useIntersection(this)
    ajax = new Ajax.ajax();
    console.log("MEDAL");
    console.log(this.accountIdTarget.getAttribute('data-value'));
    this.check();
  }

  appear(entry) {
    console.log("Medal - Check");
    this.check();
  }

  makeMedalVisible() {
    this.medalImageTarget.classList.remove("invisible");
  }

  makeMedalInvisible() {
    this.medalImageTarget.classList.add("invisible");
  }

  check() {

    ajax.check_if_medal_is_awarded(
      this.accountIdTarget.getAttribute('data-value'),
      this.courseIdTarget.getAttribute('data-value')
    ).then((response)=> {

      if(response){
        this.makeMedalVisible();
      } else {
        this.makeMedalInvisible();
      }
    })

  }

  greet() {

    this.medalImageTarget.classList.toggle("invisible");
    //this.makeMedalInvisible();

  }
}
