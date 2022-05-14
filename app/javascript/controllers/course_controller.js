import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output", "slideId", "nextSlideId", "previousSlideId" ]

  getPreviousSlide() {
    console.log("getPreviousSlide");
    var slide_id = this.previousSlideIdTarget.innerHTML.trim();
    this.dispatch("getPreviousSlide", { detail: { content: slide_id } });
  }

  getNextSlide() {
    console.log("getNextSlide");
    var slide_id = this.nextSlideIdTarget.innerHTML.trim();
    this.dispatch("getNextSlide", { detail: { content: slide_id } });
  }
}
