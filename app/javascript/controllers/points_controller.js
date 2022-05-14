import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "user_id", "output" ]

  updateCounter({ detail: { content } }) {
    this.incrementallyUpdate(this.outputTarget);
  //  this.outputTarget.innerHTML =
  //    `${parseInt(this.outputTarget.innerHTML) + 100}`
  }

  incrementallyUpdate(element){

    var target_value = 1000;
    var current_value = parseInt(this.outputTarget.innerHTML);
    var difference = target_value - current_value;

    var myPromise = () => new Promise(resolve => setTimeout(resolve, 50));

    for (let i = 0, p = Promise.resolve(); i < difference; i++) {
        p = p.then(() => myPromise())
             .then(() => this.outputTarget.innerHTML = `${parseInt(this.outputTarget.innerHTML) + 1}` );
    }
  }

}
