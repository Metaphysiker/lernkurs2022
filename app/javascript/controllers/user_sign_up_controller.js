// hello_controller.js
import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "name", "output", "email", "emailError", "firstName", "saveButton" ]
  static values = {
    accountId: Number,
    firstNameCorrect: Boolean,
    emailCorrect: Boolean
  }

  connect(){
    //const email_input_field = document.getElementById('form');

    this.firstNameTarget.addEventListener('focusout', (event) => {
      this.checkIfNameIsPresent();
    });

    this.emailTarget.addEventListener('focusout', (event) => {
      this.checkIfEmailIsTaken();
    });
  }

  disconnect(){
    //remove EventListener
  }

  signup(){
    console.log("signup")
    var self = this;

    var ajax = new Ajax.ajax();
    ajax.usersSignUp(
      this.accountIdValue,
      this.emailTarget.value,
      this.firstNameTarget.value)
    .then((response) => {
      console.log(response);
      if(response.status == "success"){
        window.location.href = "/users/successfully_signed_in";
      } else {
        console.log("ERROR!");
      }
    });

  }

  mainCheck(){
    console.log("maincheck");
    if(this.emailCorrectValue && this.firstNameCorrectValue){
      this.showTarget(this.saveButtonTarget);
    } else {
      this.hideTarget(this.saveButtonTarget);
    }
  }

  changeBackgroundOfTarget(target, color){
    target.style.background = color;
  }


  showTarget(target){
    target.style.display = "block";
  }

  hideTarget(target){
    target.style.display = "none";
  }


  checkIfNameIsPresent(){
    var self = this;

    if(this.firstNameTarget.value.length > 0){
      self.changeBackgroundOfTarget(self.firstNameTarget, 'lightGreen');
      self.firstNameCorrectValue = true;
      self.mainCheck();
    } else {
      self.changeBackgroundOfTarget(self.firstNameTarget, 'pink');
      self.firstNameCorrectValue = false;
      self.mainCheck();
    }
  }

  checkIfEmailIsTaken(){

    var self = this;

    var ajax = new Ajax.ajax();
    ajax.usersCheckIfEmailIsTaken(
      this.emailTarget.value)
    .then((response) => {
      if(response){
        self.changeBackgroundOfTarget(self.emailTarget, 'pink');
        self.showTarget(self.emailErrorTarget);
        self.emailCorrectValue = false;
        self.mainCheck();
      } else {
        self.changeBackgroundOfTarget(self.emailTarget, 'lightGreen');
        self.hideTarget(self.emailErrorTarget);
        self.emailCorrectValue = true;
        self.mainCheck();
      }
    });

  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
