// celebration_controller.js
import { Controller } from "@hotwired/stimulus"

var modal;

export default class extends Controller {
  static targets = [ "name", "output", "points" ]

  connect(){

    import("bootstrap").then(bootstrap => {

      modal = new bootstrap.Modal(document.getElementById('exampleModal'),
      {
        keyboard: false
      });

    });

  }

  celebrate({ detail: { points } }) {
    this.pointsTarget.innerHTML = points;
    //this.greet();
    modal.show();

    setTimeout(function(){
      modal.hide();
  }, 2500);

  }
}
