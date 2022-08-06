import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "firstName", "output", "email", "password", "accountId", "courseId" ]

  connect(){
    //console.log("connect");
  }

  save_progress(){
    console.log("save_progress")
    var error_string = "";
    var problems_count = 0;

    if(this.passwordTarget.value.length < 6){
      error_string = "Passwort ist zu kurz";
      problems_count += 1;
    }

    if(problems_count == 0){
      var ajax = new Ajax.ajax();
      ajax.saveProgress(
        this.accountIdTarget.getAttribute('data-value'),
        this.firstNameTarget.value,
        this.emailTarget.value,
        this.passwordTarget.value)
      .then(() => {
        this.outputTarget.textContent =
          `Hello, ${this.firstNameTarget.value}!`
      });
    } else {
      this.outputTarget.textContent =
        `Hello, ${error_string}!`
    }




  }


}
