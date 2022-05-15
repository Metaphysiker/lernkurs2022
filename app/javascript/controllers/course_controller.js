import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "name", "output", "slideId", "nextSlideId", "previousSlideId" ]

  connect(){
    this.updateSlide();
  }

  updateSlide(){

    var slide_id = this.slideIdTarget.getAttribute('data-value');
    console.log(slide_id)

    var self = this;

    $.ajax({
      url: "slides/" + slide_id + ".json",
      context: document.body
    }).done(function(response) {

      self.dispatch("updateSlide", { detail: { content: response } });

    });

  }

  updateNavigationButtons(){

    var slide_id = this.slideIdTarget.getAttribute('data-value');
    console.log(slide_id)

    var self = this;

    $.ajax({
      url: "slides/" + slide_id + ".json",
      context: document.body
    }).done(function(response) {

      self.dispatch("updateSlide", { detail: { content: response } });

    });

  }

}
