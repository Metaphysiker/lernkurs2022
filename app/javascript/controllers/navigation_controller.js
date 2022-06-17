import { Controller } from "@hotwired/stimulus"
//import $ from "jquery"

export default class extends Controller {
  static targets = [ "slideId", "output" ]

  connect(){

    this.outputTarget.innerHTML =
      `
      <div class="my-2 text-center">
        <button data-action="click->course#updateSlide" class="btn btn-primary">
          Previous
        </button>
         |
        <button data-action="click->course#updateSlide" class="btn btn-primary">
          Next
        </button>
      </div>
      `
      console.log("listener")

      // Add event listener on keydown
      document.addEventListener('keydown', (event) => {
        console.log("listener")
        var name = event.key;
        var code = event.code;
        // Alert the key name and key code on keydown
        alert(`Key pressed ${name} \r\n Key code value: ${code}`);
      }, false);

  }

  disconnect(){

  }

  updateButtons({ detail: { content } }) {

    this.outputTarget.innerHTML =
      `
      <div class="my-2 text-center">
        <button data-action="click->course#updateSlide" class="btn btn-primary">
          Previous
        </button>
         |
        <button data-action="click->course#updateSlide" class="btn btn-primary">
          Next
        </button>
      </div>
      `

  }

}
