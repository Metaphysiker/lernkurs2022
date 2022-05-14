import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = [ "input", "slideId", "output", "navigationButtons" ]

  connect() {

    var self = this;

    $.ajax({
      url: "slides/" + this.slideIdTarget.innerHTML + ".json",
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
