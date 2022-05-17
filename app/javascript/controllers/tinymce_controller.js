// hello_controller.js
import { Controller } from "@hotwired/stimulus"
import "tinymce"

export default class extends Controller {
  static targets = [ "textarea", "css", "output" ]

  connect() {
    var self = this;
    tinymce.init({
      selector: ".tinymce-textarea",
      plugins: 'advlist autolink lists link image charmap preview anchor pagebreak code',
      menubar: true,
      toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | code",
      //toolbar_mode: 'floating',
    })
  }
}
