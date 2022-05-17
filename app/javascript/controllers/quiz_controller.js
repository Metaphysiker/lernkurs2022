import $ from "jquery"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "name", "output" ]

  disconnect(){

  }

  check() {


    if(event.params.quizQuestionCorrectAnswer === "yes"){

      $(this.buttonTargets).addClass( "disabled" );
      $(event.target).addClass("correct-answer");


      const custom_event = new CustomEvent('correct-answer', {
            detail: {
              points: 100
            }
          })

        window.dispatchEvent(custom_event)

    } else {

        $(event.target).addClass( "disabled" );
        $(event.target).addClass("false-answer");

    }

  }
}
