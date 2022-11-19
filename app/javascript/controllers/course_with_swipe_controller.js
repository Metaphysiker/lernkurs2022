// hello_controller.js
import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var slider;
var ajax;
var slider_options;

export default class extends Controller {
  static targets = [ "slide", "name", "exercise", "output", "accountId", "courseId", "slideId","slideSort", "nextSlideId", "previousSlideId", "navigationButtons", "currentSlide", "total_slides_count", "prev_button", "next_button", "loader", "keenSlider", "testicus" ]
  static values = {
    accountId: Number,
    courseId: Number,
    slideId: Number,
    slideSort: Number,
    urlWithoutSort: String
  }

  connect(){

    ajax = new Ajax.ajax();

    var self = this;

    //import("jquery_with_setup").then(jquery_with_setup => {
    //});

    import("jquery_with_setup").then(jquery_with_setup => {
      import("keen-slider").then(keen_slider => {

        ajax.updateCourseHistoryOfAccount(this.accountIdValue, this.courseIdValue, this.slideIdValue);

        slider_options = {
          initial: parseInt(self.slideSortValue),
          drag: true,
          //renderMode: 'custom',
          //slides: {
          //  perView: 1
          //},
          created() {
            //console.log("keen slider created");

            //$(self.testicusTarget).fadeIn(2999);

              $(self.keenSliderTarget).css('visibility', 'visible');
              //$(self.keenSliderTarget).css("zIndex", -50);


            self.loaderTarget.textContent =
              ``;

            //self.adjustHeightofSlide();
          },
          slideChanged() {

            self.slideSortValue = slider.track.details.rel;
            self.currentSlideTarget.textContent = slider.track.details.rel + 1;


            var slide_id = $(slider.slides[slider.track.details.rel]).find(".slide").attr('data-value');
            ajax.updateCourseHistoryOfAccount(self.accountIdValue, self.courseIdValue, slide_id);

            var complete_course = $(slider.slides[slider.track.details.rel]).find(".slide").attr('data-complete_course');
            if(complete_course === "true"){
              console.log("course completed");
              ajax.updateCourseStatusOfAccount(self.accountIdValue, self.courseIdValue, "completed");
            }



            self.updateNavigationButtons();

            self.updateUrl();

            self.adjustHeightofSlide();

              var disable_drag = $(slider.slides[slider.track.details.rel]).find(".slide").attr('data-disable_drag');
              if(disable_drag === "yes"){
                self.updateSlider(false);
              } else {
                self.updateSlider(true);
              }
          },
        }

        slider = new KeenSlider("#my-keen-slider", slider_options);

        this.waitForVariableToBeDefined(slider, self.adjustHeightofSlide);
        //this.waitForVariableToBeDefined(slider, self.updateNavigationButtons);

      });
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

    var height_of_current_slide = $(slider.slides[slider.track.details.rel]).find(".container").first().height();

    if (height_of_current_slide < $(window).height() * 0.333){
      height_of_current_slide = $(window).height() * 0.333;
    }

    slider.container.style.height = height_of_current_slide + 10 + "px";

  }

  updateNavigationButtons(){


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

  updateUrl(){
    const nextURL = this.urlWithoutSortValue + "/" + this.slideSortValue;
    const nextTitle = 'My new page title';
    const nextState = { additionalInformation: 'Updated the URL with JS' };
    window.history.replaceState(nextState, null, nextURL);
  }

  updateSlider(drag){
    setTimeout(function(){
      //console.log("boom");
      //console.log("disable_drag yes");
      if(slider_options["drag"] == !drag){
        slider_options["drag"] = drag;
        slider.update(slider_options);
      }

    }, 300)
  }

  prev() {
    slider.prev();
  }

  next() {
    slider.next();
  }

  waitForVariableToBeDefined(variable, callback){
    //console.log("WAIT!");
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
