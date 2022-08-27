// hello_controller.js
import { Controller } from "@hotwired/stimulus"

var slider;

export default class extends Controller {
  static targets = [ "slide", "name", "exercise", "output", "accountId", "courseId", "slideId", "nextSlideId", "previousSlideId", "navigationButtons", "current_slide", "total_slides_count", "prev_button", "next_button" ]


  connect(){

    var self = this;

    import("keen-slider").then(keen_slider => {

      console.log(keen_slider);
      slider = new KeenSlider("#my-keen-slider", {
        slideChanged() {
          self.updateNavigationButtons();
          console.log('slide changed');
          console.log(slider.slide);
          console.log(slider.track.details.abs);
          console.log(slider.track.details);

        },
      });

    });

    import("jquery_with_setup").then(tinymce_imported => {

      this.updateCourseHistoryOfAccount(this.accountIdTarget.getAttribute('data-value'), this.courseIdTarget.getAttribute('data-value'), this.slideIdTarget.getAttribute('data-value'))
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

  updateNavigationButtons(){
    //console.log(slider);
    //slider.next();
    // plus 1 because sort starts with 0
    this.current_slideTarget.textContent = slider.track.details.abs + 1;

    this.next_buttonTarget.classList.add("disabled");
  }

  prev() {
    slider.prev();
  }

  next() {
    slider.next();
  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
