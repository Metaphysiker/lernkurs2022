import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "user_id", "output" ]


  updateCounter({ detail: { points } }) {
    this.incrementallyUpdate(this.outputTarget, points);
  //  this.outputTarget.innerHTML =
  //    `${parseInt(this.outputTarget.innerHTML) + 100}`
  }

  incrementallyUpdate(element, points){
    console.log("incrementallyUpdate")
    var target_value = 1000;
    console.log(this.outputTarget.innerHTML);
    var current_value = parseInt(this.outputTarget.innerHTML);
    //var difference = target_value - current_value;
    var difference =  points;

    var myPromise = () => new Promise(resolve => setTimeout(resolve, 50));

    for (let i = 0, p = Promise.resolve(); i < difference; i++) {
        p = p.then(() => myPromise())
             .then(() => this.outputTarget.innerHTML = `${parseInt(this.outputTarget.innerHTML) + 1}` );
    }
  }

}
