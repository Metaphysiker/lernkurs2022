import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "slide", "name", "output", "slideId", "nextSlideId", "previousSlideId", "navigationButtons" ]

  connect(){
    this.getSlide(this.slideIdTarget.getAttribute('data-value'));
  }

  getPreviousSlide(){
    this.getSlide(this.previousSlideIdTarget.getAttribute('data-value'));
  }

  getNextSlide(){
    this.getSlide(this.nextSlideIdTarget.getAttribute('data-value'));
  }

  getSlide(slide_id){

    var self = this;

    $.ajax({
      url: "/slides/" + slide_id + ".json",
      context: document.body
    }).done(function(response) {

      self.setSlide(response.content);
      console.log(response);
      self.setNavigationButtons(response.previous_slide_id, response.next_slide_id);

    });
  }

  setSlide(html){
    this.slideTarget.innerHTML = html;
  }

  setNavigationButtons(previous_slide_id, next_slide_id){

    this.navigationButtonsTarget.innerHTML =
      `
      <div data-course-target="previousSlideId" data-value="${previous_slide_id}">
      </div>
      <div data-course-target="nextSlideId" data-value="${next_slide_id}">
      </div>

      <div class="my-2 text-center">
        <button data-action="click->course#getPreviousSlide" class="${previous_slide_id < 0 ? "disabled" : ""} btn btn-primary">
          Previous ${previous_slide_id}
        </button>
         |
        <button data-action="click->course#getNextSlide" class="${next_slide_id < 0 ? "disabled" : ""} btn btn-primary">
          Next ${next_slide_id}
        </button>

      </div>
      `

  }

}
