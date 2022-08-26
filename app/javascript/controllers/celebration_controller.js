// celebration_controller.js
import { Controller } from "@hotwired/stimulus"

var modal;

export default class extends Controller {
  static targets = [ "name", "output", "points" ]

  connect(){

    import("bootstrap").then(bootstrap => {

      modal = new bootstrap.Modal(document.getElementById('exampleModal'), "");

    });

  }

  celebrate({ detail: { points } }) {
    this.pointsTarget.innerHTML = points;
    //this.greet();
    modal.show();
    console.log("celebrate!");
    console.log(points);

    setTimeout(function(){
      modal.hide();
  }, 2000);

  }
}
