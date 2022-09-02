import * as Ajax from "ajax"

import { Controller } from "@hotwired/stimulus"

var ajax;

export default class extends Controller {
  static targets = [ "name", "output", "medalImage" ]

  connect() {
    ajax = new Ajax.ajax();
  }

  check() {

    this.medalImageTarget.classList.toggle("invisible");

  }

  greet() {

    this.medalImageTarget.classList.toggle("invisible");


    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
