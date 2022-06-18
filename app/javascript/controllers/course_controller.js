import { Controller } from "@hotwired/stimulus"
//import $ from "jquery"

export default class extends Controller {
  static targets = [ "slide", "name", "exercise", "output", "accountId", "courseId", "slideId", "nextSlideId", "previousSlideId", "navigationButtons" ]

  connect(){

    import("jquery_with_setup").then(tinymce_imported => {
      this.updateCourseHistoryOfAccount(this.accountIdTarget.getAttribute('data-value'), this.courseIdTarget.getAttribute('data-value'), this.slideIdTarget.getAttribute('data-value'))
    });
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
    this.updateCourseHistoryOfAccount(this.accountIdTarget.getAttribute('data-value'), this.courseIdTarget.getAttribute('data-value'), slide_id)

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

  updateCourseHistoryOfAccount(account_id, course_id, slide_id){

    $.ajax({
      url: "/accounts/" + account_id + "/update_course_history",
      type: "PUT",
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: {course_id: course_id, slide_id: slide_id},
    }).done(function(response) {
      console.log(response);
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
