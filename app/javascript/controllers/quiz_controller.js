import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "button", "name", "output" ]

  connect(){
    import("jquery_with_setup").then(jquery_with_setup => {

    });

  }

  disconnect(){

  }

  check() {

    if(event.params.quizQuestionCorrectAnswer === "yes"){

      $(this.buttonTargets).prop("disabled", true);
      $(this.buttonTargets).addClass( "disabled" );
      $(event.target).addClass("correct-answer");

      const custom_event = new CustomEvent('correct-answer', {
            detail: {
              points: 100
            }
          })

        window.dispatchEvent(custom_event)


        var ajax = new Ajax.ajax();
        ajax.updateExerciseHistoryOfAccount(1, "quiz", 1, 555);

        //ajax1.updateExerciseHistoryOfAccount(1, 1, 1);

    } else {
        $(event.target).prop("disabled", true);
        $(event.target).addClass( "disabled" );
        $(event.target).addClass("false-answer");
    }

  }
}
