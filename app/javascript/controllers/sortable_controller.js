// hello_controller.js
import $ from "jquery"
import  Sortable  from "sortablejs"
import { Controller } from "@hotwired/stimulus"



export default class extends Controller {
  static targets = [ "element", "output" ]

  connect() {

    console.log("connect")
    var el = document.getElementById('items')
    var sortable = Sortable.create(el)

  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }

}
