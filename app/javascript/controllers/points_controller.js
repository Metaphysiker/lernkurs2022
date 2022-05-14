import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "user_id", "output" ]

  replace() {
    this.outputTarget.textContent =
      `888`
  }

}
