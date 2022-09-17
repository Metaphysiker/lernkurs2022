import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  connect(){

    import("people_group_emissions")
    .then((people_group_emissions) => {

        const peopleGroupEmissions = new people_group_emissions.peopleGroupEmissions;
        peopleGroupEmissions.draw(this.outputTarget);

    });

  }

  disconnect(){

  }

  load_infographic(){

  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
};
