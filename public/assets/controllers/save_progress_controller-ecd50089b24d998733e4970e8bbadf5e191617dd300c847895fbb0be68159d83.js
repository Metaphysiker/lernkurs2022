import{Controller}from"@hotwired/stimulus";import*as Ajax from"ajax";export default class extends Controller{static targets=["firstName","output","email","password","passwordConfirmation","accountId","courseId"];connect(){}save_progress(){(new Ajax.ajax).saveProgress(this.accountIdTarget.getAttribute("data-value"),this.firstNameTarget.value,this.emailTarget.value).then((t=>{console.log(t),this.outputTarget.textContent=`${t}`}))}}