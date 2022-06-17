import { Controller } from "@hotwired/stimulus"
//import $ from "jquery"

export default class extends Controller {
  static targets = [ "slide", "name", "exercise", "output", "slideId", "nextSlideId", "previousSlideId", "navigationButtons" ]

  connect(){

    import("jquery_with_setup");
    //this.getSlide(this.slideIdTarget.getAttribute('data-value'));

    // Navigate with arrow buttons
    document.addEventListener('keyup', (event) => {

      if(event.code == "ArrowRight") {
        this.getNextSlide()
      } else if(event.code == "ArrowLeft"){
        this.getPreviousSlide()
      }
    }, false);
  }

  disconnect(){
    document.removeEventListener('keyup');
  }

  getPreviousSlide(){
    this.getSlide(this.previousSlideIdTarget.getAttribute('data-value'));
  }

  getNextSlide(){
    this.getSlide(this.nextSlideIdTarget.getAttribute('data-value'));
  }

  getSlide(slide_id){

    this.setNavigationButtons(slide_id);
    this.setSlide(slide_id);
    this.setExercise(slide_id);
  }

  setSlide(slide_id){

    var self = this;

    $.ajax({
      url: "/slides/" + slide_id + ".js",
      context: document.body
    }).done(function(response) {
      self.slideTarget.innerHTML = response;
    });
  }

  setExercise(slide_id){

    var self = this;

    $.ajax({
      url: "/slides/" + slide_id + "/exercise",
      context: document.body
    }).done(function(response) {
      //self.exerciseTarget.innerHTML = response.content;

      self.exerciseTarget.innerHTML = response;

    });
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
