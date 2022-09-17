import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"

import { useIntersection, useResize } from "stimulus-use"

export default class extends Controller {
  static targets = [ "name", "output", "courseComplete"]
  static values = {
    accountId: Number,
    courseId: Number,
    //status: String
  }

  connect(){

    useIntersection(this)
    useResize(this)
    console.log("connect");

  }

  appear(entry) {
    console.log("course_completion - appear");

    this.complete_course();
  }

  complete_course(){

    var self = this;

    console.log(self.accountIdValue);
    console.log(self.courseIdValue);

    var ajax = new Ajax.ajax();
    ajax.updateCourseStatusOfAccount(self.accountIdValue, self.courseIdValue, "completed");

  }

  send_results_to(){


    var ajax = new Ajax.ajax();
    ajax.sendResultsTo(this.accountIdValue, this.courseIdValue)
    .then(() => {

    });


  }

  greet() {

    var ajax = new Ajax.ajax();
    ajax.sendResultsTo(2, 5, "sandro.raess@philosophie.ch", "sandro.raess@philosophie.ch")
    .then(() => {
      console.log("send_results_to");
    });

    console.log("greet");
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
};
