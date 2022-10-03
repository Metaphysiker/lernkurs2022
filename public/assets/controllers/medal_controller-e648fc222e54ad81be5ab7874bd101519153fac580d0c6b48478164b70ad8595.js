import*as Ajax from"ajax";import{Controller}from"@hotwired/stimulus";import{useIntersection,useResize}from"stimulus-use";var ajax;export default class extends Controller{static targets=["name","output","medalImage","accountId","courseId"];static values={accountId:Number,courseId:Number,medalImage:String};connect(){let e={root:document.body,rootMargin:"0px",threshold:1};new IntersectionObserver((()=>{this.check()}),e).observe(this.medalImageTarget);var a=this;ajax=new Ajax.ajax,a.check()}makeMedalVisible(){this.medalImageTarget.classList.remove("invisible")}makeMedalInvisible(){this.medalImageTarget.classList.add("invisible")}check(){ajax.check_if_medal_is_awarded(this.accountIdValue,this.courseIdValue).then((e=>{e?this.makeMedalVisible():this.makeMedalInvisible()}))}greet(){this.medalImageTarget.classList.toggle("invisible")}}