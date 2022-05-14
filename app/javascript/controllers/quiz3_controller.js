import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "name", "output", "data", "questions" ]

  connect() {
    $(this.questionsTarget).append(this.dataTarget.innerHTML);
  }

  check() {
    console.log(this.dataTarget.innerHTML);
    this.outputTarget.textContent =
      `Hello, ${this.dataTarget.innerHTML}!`
  }
}
