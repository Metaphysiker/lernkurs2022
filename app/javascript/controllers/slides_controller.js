import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "input", "output", "navigationButtons" ]

  connect() {

    var self = this;

    $.ajax({
      url: "slides/" + this.inputTarget.innerHTML + ".json",
      context: document.body
    }).done(function(response) {
      self.outputTarget.innerHTML =
        `${response.content}`
    });

    this.navigationButtonsTarget.innerHTML =
      `    <button data-action="click->slides#replace">
            Greet
          </button>`

  }

  replace() {

    this.dispatch("replace", { detail: { content: "AYAYAYAY" } });


    var self = this;

    $.ajax({
      url: "slides/" + "2" + ".json",
      context: document.body
    }).done(function(response) {
      self.outputTarget.innerHTML =
        `${response.content}`
    });

  }

}
