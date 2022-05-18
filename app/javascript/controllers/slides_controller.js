import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "slideId", "output", "navigationButtons" ]

  updateSlide({ detail: { content } }) {
    console.log(content.content);
    this.outputTarget.innerHTML = content.content;

  }

}
