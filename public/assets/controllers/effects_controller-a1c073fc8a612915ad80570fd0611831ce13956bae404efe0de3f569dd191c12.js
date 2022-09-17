import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect(){
    console.log("YOLO");
  }

  flash({ detail: { content } }) {
    console.log(content) // 1234
  }
};
