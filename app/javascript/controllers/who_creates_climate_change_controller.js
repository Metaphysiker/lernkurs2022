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
    let text_block = {height: 150, width: 200}

    const svg = d3.select(this.outputTarget)
    .append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g");

    var starting_position = svg.append("g")
                            .attr("transform", `translate(${margin.left}, ${margin.top})`);




    starting_position.append("foreignObject")
    .attr("x", 0)
    .attr("y", 0)
    .attr("height", height)
    .attr("width", width)
  .append("xhtml:div")
    .html(`<div class="">
    Wähle eine Bevölkerungsgruppe aus und schau, wie viel Treibhausgase sie verursachen:
        </div>`);

    var people_richest_1 = starting_position
    .append("g")
    .attr("transform", `translate(${width/100 * 0}, ${text_block.height})`);

    people_richest_1
    .append("text")
    .text("1%");

    people_richest_1
    .append("svg:image")
    .attr('width', width/100 * 20)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg")
    .style("fill", "#69b3a2");

    var people_richest_10 = starting_position.append("svg:image")
    .attr('x', width/100 * 25)
    .attr('y', text_block.height)
    .attr('width', width/100 * 20)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg");

    var people_middle_40 = starting_position.append("svg:image")
    .attr('x', width/100 * 50)
    .attr('y', text_block.height)
    .attr('width', width/100 * 20)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg");

    var people_poorest_50 = starting_position.append("svg:image")
    .attr('x', width/100 * 75)
    .attr('y', text_block.height)
    .attr('width', width/100 * 20)
    .attr('height', 100)
    .style("cursor", "pointer")
    .style("opacity", 1)
    .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg");

  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
