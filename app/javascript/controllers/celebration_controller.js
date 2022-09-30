// celebration_controller.js
import { Controller } from "@hotwired/stimulus"

var celebration_modal;
var save_answer_modal;

export default class extends Controller {
  static targets = [ "name", "output", "points", "message" ]

  connect(){

    import("bootstrap").then(bootstrap => {

      celebration_modal = new bootstrap.Modal(document.getElementById('celebrationModal'),
      {
        keyboard: false
      });

      save_answer_modal = new bootstrap.Modal(document.getElementById('saveAnswerModal'),
      {
        keyboard: false
      });

    });

  }

  celebrate({ detail: { points } }) {
    this.pointsTarget.innerHTML = points;
    //this.greet();
    celebration_modal.show();

    setTimeout(function(){
      celebration_modal.hide();
  }, 2500);

  }

  save_answer({ detail: { message } }) {

    if (message == null || message === 'undefined') {
      message = "Deine Antwort wurde gespeichert!";
    }

    this.messageTarget.innerHTML = message;
    //this.greet();
    save_answer_modal.show();

    setTimeout(function(){
      save_answer_modal.hide();
  }, 2500);

  }
}
