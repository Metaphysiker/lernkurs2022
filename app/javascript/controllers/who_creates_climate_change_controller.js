import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  connect(){
    import("d3").then(d3 => {

      //d3
      console.log(d3);
    })
  }

  disconnect(){

  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
