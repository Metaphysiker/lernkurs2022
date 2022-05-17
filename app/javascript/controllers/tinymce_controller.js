// hello_controller.js
import { Controller } from "@hotwired/stimulus"
import "tinymce"

export default class extends Controller {
  static targets = [ "textarea", "output" ]

  connect() {
    tinymce.init({
      selector: ".tinymce-textarea",
      plugins: 'advlist autolink lists link image charmap preview anchor pagebreak',
      toolbar_mode: 'floating',
    })
  }
}
