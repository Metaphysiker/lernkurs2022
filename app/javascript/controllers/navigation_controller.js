import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

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
