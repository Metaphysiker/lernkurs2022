// hello_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  disconnect(){

  }

  check() {

    if(event.params.quizQuestionCorrectAnswer === "yes"){

      const event = new CustomEvent('correct-answer', {
            detail: {
              points: 100
            }
          })

          console.log("dispatch");
        window.dispatchEvent(event)

      this.outputTarget.textContent =
        `Correct!`
    } else {
      this.outputTarget.textContent =
        `False!`
    }

  }
}
