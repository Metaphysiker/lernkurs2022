import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "input", "input2", "output" ]

  connect() {

    var self = this;

    $.ajax({
      url: "slides/" + this.inputTarget.innerHTML + ".json",
      context: document.body
    }).done(function(response) {
      self.outputTarget.innerHTML =
        `${response.content}`
    });

  }

  replace() {

    var slide_id = this.input2Target.value;
    console.log(slide_id.trim());

    var self = this;

    $.ajax({
      url: "slides/" + slide_id.trim() + ".json",
      context: document.body
    }).done(function(response) {
      console.log(response.body);
      self.outputTarget.innerHTML =
        `${response.content}`
    });

  }

}
