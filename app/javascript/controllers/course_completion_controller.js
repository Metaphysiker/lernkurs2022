import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "name", "output", "email1", "email2" ]

  connect(){
    console.log("connect");
  }

  send_results_to(){


    var ajax = new Ajax.ajax();
    ajax.sendResultsTo(this.accountIdTarget.getAttribute('data-value'), this.courseIdTarget.getAttribute('data-value'))
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
