// hello_controller.js
import { Controller } from "@hotwired/stimulus"
import * as Ajax from "ajax"

export default class extends Controller {
  static targets = [ "name", "output", "email", "firstName" ]
  static values = {
    accountId: Number,
  }

  connect(){
    //const email_input_field = document.getElementById('form');

    this.emailTarget.addEventListener('focusin', (event) => {
      //event.target.style.background = 'pink';
    });

    this.emailTarget.addEventListener('focusout', (event) => {
      //event.target.style.background = '';
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
      if(response == "success"){
        //window.location.href = "/";
      } else {
        console.log("ERROR!");
      }
    });

  }

  checkIfEmailIsTaken(){

    var self = this;

    var ajax = new Ajax.ajax();
    ajax.usersCheckIfEmailIsTaken(
      this.emailTarget.value)
    .then((response) => {
      if(response){
        self.emailTarget.style.background = 'pink';
      } else {
        self.emailTarget.style.background = 'lightGreen';
      }
    });

  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
