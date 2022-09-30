import{Controller}from"@hotwired/stimulus";export default class extends Controller{static targets=["slide","name","exercise","output","accountId","courseId","slideId","nextSlideId","previousSlideId","navigationButtons"];connect(){import("jquery_with_setup").then((()=>{this.updateCourseHistoryOfAccount(this.accountIdTarget.getAttribute("data-value"),this.courseIdTarget.getAttribute("data-value"),this.slideIdTarget.getAttribute("data-value"))})),document.addEventListener("keydown",(t=>{"ArrowRight"==t.code?this.getNextSlide():"ArrowLeft"==t.code&&this.getPreviousSlide()}),!1)}disconnect(){document.removeEventListener("keyup")}getPreviousSlide(){var t=this.previousSlideIdTarget.getAttribute("data-value");t>=0&&this.getSlide(t)}getNextSlide(){var t=this.nextSlideIdTarget.getAttribute("data-value");t>=0&&this.getSlide(t)}getSlide(t){console.log(t),this.setNavigationButtons(t),this.setSlide(t),this.setExercise(t),this.updateCourseHistoryOfAccount(this.accountIdTarget.getAttribute("data-value"),this.courseIdTarget.getAttribute("data-value"),t)}setSlide(t){var e=this;$.ajax({url:"/slides/"+t+".js",context:document.body}).done((function(t){e.slideTarget.innerHTML=t}))}updateCourseHistoryOfAccount(t,e,i){$.ajax({url:"/accounts/"+t+"/update_course_history",type:"PUT",headers:{"X-CSRF-Token":$('meta[name="csrf-token"]').attr("content")},data:{course_id:e,slide_id:i}}).done((function(t){console.log(t)}))}setExercise(t){var e=this;$.ajax({url:"/slides/"+t+"/exercise",context:document.body}).done((function(t){e.exerciseTarget.innerHTML=t}))}setNavigationButtons(t){var e=this;$.ajax({url:"/slides/"+t+"/navigation_buttons/",context:document.body}).done((function(t){e.navigationButtonsTarget.innerHTML=t}))}}