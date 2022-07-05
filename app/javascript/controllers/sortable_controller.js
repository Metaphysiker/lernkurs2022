import { Controller } from "@hotwired/stimulus"

//import  Sortable  from "sortablejs"
let sortable = undefined;
export default class extends Controller {
  static targets = [ "saveOrder", "slides", "output" ];

  connect() {

    import("jquery_with_setup");
    import("sortablejs").then(sortablejs => {
      sortable = sortablejs.Sortable.create(this.slidesTarget)
    })

  }

  disconnect() {
    sortable.destroy();
  }

  updateOrder(){
    //console.log(sortable.toArray());

    $.ajax({
      type: "POST",
      url: "/slides/update_order",
      data: {order: sortable.toArray()},
      context: document.body
    }).done(function(response) {

      //console.log(response);

    });
  }



}
