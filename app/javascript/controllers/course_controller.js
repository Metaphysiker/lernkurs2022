import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "slide", "name", "output", "slideId", "nextSlideId", "previousSlideId", "navigationButtons" ]

  connect(){
    //this.getSlide(this.slideIdTarget.getAttribute('data-value'));
  }

  getPreviousSlide(){
    this.getSlide(this.previousSlideIdTarget.getAttribute('data-value'));
  }

  getNextSlide(){
    this.getSlide(this.nextSlideIdTarget.getAttribute('data-value'));
  }

  getSlide(slide_id){

    this.setNavigationButtons(slide_id);
    var self = this;

    $.ajax({
      url: "/slides/" + slide_id + ".json",
      context: document.body
    }).done(function(response) {

      self.setSlide(response.content);
    });
  }

  setSlide(html){
    this.slideTarget.innerHTML = html;
  }

  setNavigationButtons(slide_id){

    var self = this;

    $.ajax({
      url: "/slides/" + slide_id + "/navigation_buttons/",
      context: document.body
    }).done(function(response) {

      self.navigationButtonsTarget.innerHTML = response;

    });

  }

}
