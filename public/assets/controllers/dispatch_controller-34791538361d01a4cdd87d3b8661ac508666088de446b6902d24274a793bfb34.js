// dispatch_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }

  finish_exercise({ detail: { points } }){
    console.log("finish_exercise");
    const custom_event = new CustomEvent('correct-answer', {
      detail: {
        points: points
      }
    })
    window.dispatchEvent(custom_event);

    const celebrate_event = new CustomEvent('celebrate', {
      detail: {
        points: points
      }
    })
    window.dispatchEvent(celebrate_event);
  }
};
