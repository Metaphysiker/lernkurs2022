import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "name", "output", "courseComplete"]
  static values = {
    accountId: Number,
    courseId: Number,
    //status: String
  }

  connect(){
    console.log("connect");

    let options = {
      root: document.body,
      rootMargin: '0px',
      threshold: 1.0
    }

    let callback = () => {
      this.complete_course()
    };

    let observer = new IntersectionObserver(callback, options);

    observer.observe(this.medalImageTarget);
  }

  complete_course(){

    var ajax = new Ajax.ajax();
    ajax.updateCourseStatusOfAccount(this.accountIdValue, this.courseIdValue, "completed")
    .then(() => {

    });

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
}
