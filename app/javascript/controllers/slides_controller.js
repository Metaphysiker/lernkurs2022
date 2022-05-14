import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "input", "output", "navigationButtons" ]

  connect() {

    var self = this;

    $.ajax({
      url: "slides/" + "1" + ".json",
      context: document.body
    }).done(function(response) {
      self.outputTarget.innerHTML =
        `${response.content}`
    });

  }

  replace({ detail: { content } }) {

    var self = this;

    $.ajax({
      url: "slides/" + content + ".json",
      context: document.body
    }).done(function(response) {
      self.outputTarget.innerHTML =
        `${response.content}`
    });

  }

}
