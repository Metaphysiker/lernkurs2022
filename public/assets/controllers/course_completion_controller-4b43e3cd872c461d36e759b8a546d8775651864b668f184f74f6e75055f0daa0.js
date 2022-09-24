import{Controller}from"@hotwired/stimulus";import*as Ajax from"ajax";import{useIntersection,useResize}from"stimulus-use";export default class extends Controller{static targets=["name","output","courseComplete"];static values={accountId:Number,courseId:Number};connect(){useIntersection(this),useResize(this),console.log("connect")}appear(e){console.log("course_completion - appear"),this.complete_course()}complete_course(){var e=this;console.log(e.accountIdValue),console.log(e.courseIdValue),(new Ajax.ajax).updateCourseStatusOfAccount(e.accountIdValue,e.courseIdValue,"completed")}send_results_to(){(new Ajax.ajax).sendResultsTo(this.accountIdValue,this.courseIdValue).then((()=>{}))}greet(){(new Ajax.ajax).sendResultsTo(2,5,"sandro.raess@philosophie.ch","sandro.raess@philosophie.ch").then((()=>{console.log("send_results_to")})),console.log("greet"),this.outputTarget.textContent=`Hello, ${this.nameTarget.value}!`}}
