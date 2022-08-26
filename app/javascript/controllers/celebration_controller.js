// celebration_controller.js
import { Controller } from "@hotwired/stimulus"

var modal;

export default class extends Controller {
  static targets = [ "name", "output" ]

  connect(){

    import("bootstrap").then(bootstrap => {

      modal = new bootstrap.Modal(document.getElementById('exampleModal'), "");

    });

  }

  greet() {
    console.log("greet");
    //this.outputTarget.textContent =
    //  `Hello, celebration!`

      //var myModal = document.getElementById('exampleModal');
      //myModal.show();
          modal.show();

  }


  celebrate({ detail: { points } }) {
    console.log("celebrate!");
    this.greet();
  }
}
