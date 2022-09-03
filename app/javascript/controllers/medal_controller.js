import * as Ajax from "ajax"

import { Controller } from "@hotwired/stimulus"

import { useIntersection, useResize } from "stimulus-use"

var ajax;


//let target = document.querySelector('#listItem');
//console.log("observer: ")
//console.log(observer);

export default class extends Controller {
  static targets = [ "name", "output", "medalImage", "accountId", "courseId" ]

  connect() {

    let options = {
      root: document.body,
      rootMargin: '0px',
      threshold: 1.0
    }

    let callback = () => {
      console.log("callback");
      this.check()
    };

    let observer = new IntersectionObserver(callback, options);
    observer.observe(this.medalImageTarget);


    var self = this;
    ajax = new Ajax.ajax();
    //useIntersection(this)
    //useResize(this)

    setTimeout(function() {
      self.check();
    }, 1000);

    //this.check();
  }

  //appear(entry) {
  //  console.log("Medal - Check");
  //  this.check();
  //}

  //resize({ width, height }) {
  //  console.log("resize");
  //}

  makeMedalVisible() {
    this.medalImageTarget.classList.remove("invisible");
  }

  makeMedalInvisible() {
    this.medalImageTarget.classList.add("invisible");
  }

  check() {

    ajax.check_if_medal_is_awarded(
      this.accountIdTarget.getAttribute('data-value'),
      this.courseIdTarget.getAttribute('data-value')
    ).then((response)=> {

      if(response){
        this.makeMedalVisible();
      } else {
        this.makeMedalInvisible();
      }
    })

  }

  greet() {

    this.medalImageTarget.classList.toggle("invisible");
    //this.makeMedalInvisible();

  }
}
