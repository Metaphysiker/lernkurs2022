import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "source" ]

  copy() {
    this.dispatch("copy", { detail: { content: this.sourceTarget.value } })
    this.sourceTarget.select()
    document.execCommand("copy")
  }
}
