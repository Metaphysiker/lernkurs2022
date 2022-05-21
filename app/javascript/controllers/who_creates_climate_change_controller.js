import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  connect(){
    import("jquery_with_setup");
    import("d3").then(d3 => {
      window.d3 = d3;
      this.load_infographic()
    })
  }

  disconnect(){

  }

  load_infographic(){
    let margin = {top: 5, right: 5, bottom: 5, left: 5};
    let width = $(this.outputTarget).width();
    let height = 400;//$(this.outputTarget).height();

    const svg = d3.select(this.outputTarget)
    .append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
    .attr("transform", `translate(${margin.left}, ${margin.top})`);



    var people_richest_1 = svg.append("svg:image")
    .attr('x', width/100 * 0)
    .attr('y', 0)
    .attr('width', 100)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg")
    .style("fill", "#69b3a2");;

    var people_richest_10 = svg.append("svg:image")
    .attr('x', width/100 * 25)
    .attr('y', 0)
    .attr('width', 100)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg");

    var people_middle_40 = svg.append("svg:image")
    .attr('x', width/100 * 50)
    .attr('y', 0)
    .attr('width', 100)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg");

    var people_poorest_50 = svg.append("svg:image")
    .attr('x', width/100 * 75)
    .attr('y', 0)
    .attr('width', 100)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg");

    svg.append("foreignObject")
    .attr("x", 0)
    .attr("y", 0)
    //.attr("width", $("#funky_button1_cta").width())
    //.attr("height", $("#funky_button1_cta").height())
    .attr("height", 200)
    .attr("width", 200)
  .append("xhtml:div")
    .html(`<div class="text-center">
    Wähle eine Bevölkerungsgruppe aus und schau, wie viel Treibhausgase sie verursachen:
          <button type="button" class="primary-button-a-color">hello!</button>
        </div>`);
  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
