// hello_controller.js
import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var slider;
var ajax;

export default class extends Controller {
  static targets = [ "slide", "name", "exercise", "output", "accountId", "courseId", "slideId","slideSort", "nextSlideId", "previousSlideId", "navigationButtons", "current_slide", "total_slides_count", "prev_button", "next_button" ]


  connect(){

    ajax = new Ajax.ajax();

    var self = this;

    import("jquery_with_setup").then(jquery_with_setup => {
      ajax.updateCourseHistoryOfAccount(this.accountIdTarget.getAttribute('data-value'), this.courseIdTarget.getAttribute('data-value'), this.slideIdTarget.getAttribute('data-value'))
    });

    import("keen-slider").then(keen_slider => {

      slider = new KeenSlider("#my-keen-slider", {
        initial: parseInt(self.slideIdTarget.getAttribute('data-value')),
        //renderMode: 'custom',
        //slides: {
        //  perView: 1
        //},
        created() {
          console.log("created");
          //self.adjustHeightofSlide();
        },
        slideChanged() {

          self.current_slideTarget.textContent = slider.track.details.rel + 1;

          ajax.updateCourseHistoryOfAccount(self.accountIdTarget.getAttribute('data-value'), self.courseIdTarget.getAttribute('data-value'), slider.track.details.rel);

          self.updateNavigationButtons();

          self.adjustHeightofSlide();

          console.log('slide changed');

        },
      });

      this.waitForVariableToBeDefined(slider, self.adjustHeightofSlide);
      //this.waitForVariableToBeDefined(slider, self.updateNavigationButtons);

    });

    //this.getSlide(this.slideIdTarget.getAttribute('data-value'));

    // Navigate with arrow buttons
    document.addEventListener('keydown', (event) => {

      if(event.code == "ArrowRight") {
        this.next();
      } else if(event.code == "ArrowLeft"){
        this.prev();
      }


    }, false);
  }

  adjustHeightofSlide(){
    console.log("adjust");

    var height_of_current_slide = $(slider.slides[slider.track.details.rel]).find(".container").first().height();

    if (height_of_current_slide < $(window).height() * 0.333){
      height_of_current_slide = $(window).height() * 0.333;
    }
    console.log(height_of_current_slide);
    slider.container.style.height = height_of_current_slide + 10 + "px";

  }

  updateNavigationButtons(){

    console.log(this);
    console.log("updateNavigationButtons");
    console.log(slider.track.details.rel);
    if((slider.track.details.rel - 1) < 0) {
      this.prev_buttonTarget.classList.add("disabled");
    } else {
      this.prev_buttonTarget.classList.remove("disabled");
    }

    if((slider.track.details.rel + 1) > slider.track.details.max){
      this.next_buttonTarget.classList.add("disabled");
    } else {
      this.next_buttonTarget.classList.remove("disabled");
    }
  }

  prev() {
    slider.prev();
  }

  next() {
    slider.next();
  }

  waitForVariableToBeDefined(variable, callback){
    console.log("WAIT!");
      if(typeof variable !== "undefined"){
        console.log("defined!");

        setTimeout(() => {
          callback();
        }, 200);

      }
      else{
          setTimeout(waitForVariableToBeDefined, 250);
      }
  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
