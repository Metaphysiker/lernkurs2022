// hello_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  connect(){

    import("keen-slider").then(keen_slider => {

      console.log(keen_slider);
      var slider = new KeenSlider("#my-keen-slider");

    });

  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
