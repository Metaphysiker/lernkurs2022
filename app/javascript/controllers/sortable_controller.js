import $ from "jquery"
import  Sortable  from "sortablejs"
import { Controller } from "@hotwired/stimulus"
let sortable = undefined;
export default class extends Controller {
  static targets = [ "saveOrder", "slides", "output" ];

  connect() {

    sortable = Sortable.create(this.slidesTarget)

  }

  updateOrder(){
    console.log(sortable.toArray());

    $.ajax({
      type: "POST",
      url: "/slides/update_order",
      data: {order: sortable.toArray()},
      context: document.body
    }).done(function(response) {

      console.log(response);

    });
  }



}
