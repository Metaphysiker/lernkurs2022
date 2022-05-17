import "tinymce"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "textarea", "css", "output" ]

  connect() {
    var self = this;
    setTimeout(function () {
        self.initiateTinymce()
    }, 1000);

  }

  disconnect () {
    tinymce.remove()
  }

  initiateTinymce(){
    tinymce.init({
      selector: ".tinymce-textarea",
      plugins: 'advlist autolink lists link image charmap preview anchor pagebreak code table',
      menubar: true,
      toolbar: "h1 h2 h3 | formatselect fontselect | undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | code styleselect table",
      //toolbar_mode: 'floating',
    })
  }
}
