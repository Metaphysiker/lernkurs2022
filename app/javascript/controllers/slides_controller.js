import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "input", "output" ]

  connect() {

    this.outputTarget.innerHTML =
      `Zurück - Weiter`

  }

}
