import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "firstName", "output", "email", "password", "passwordConfirmation", "accountId", "courseId" ]

  connect(){
    //console.log("connect");
  }

  save_progress(){
    //console.log("save_progress");
    var error_string = "";
    var problems_count = 0;

  //  if(this.passwordTarget.value.length < 6){
  //    error_string = "Passwort ist zu kurz";
  //    problems_count += 1;
  //  }

    if(problems_count == 0){
      var ajax = new Ajax.ajax();
      ajax.saveProgress(
        this.accountIdTarget.getAttribute('data-value'),
        this.firstNameTarget.value,
        this.emailTarget.value)
      .then((response) => {
        console.log(response);
        this.outputTarget.textContent =
          `${response}`
      });
    } else {
      this.outputTarget.textContent =
        `${error_string}!`
    }

  }


}
