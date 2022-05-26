import $ from "jquery"
import * as d3 from 'd3';

export function peopleGroupEmissions() {
  this.draw = function(container) {

    let margin = {top: 5, right: 5, bottom: 5, left: 5};
    let width = $(container).width();
    let height = 600;
    let text_block = {height: 150, width: 200}

    const svg = d3.select(container)
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
    Klick auf eine Bevölkerungsgruppe aus und schau, wie viel Treibhausgase sie verursacht:
        </div>`);

    function add_people_group(container, width_percentage, text){

      var people_group = starting_position
      .append("g")
      .attr("transform", `translate(${width/100 * width_percentage}, ${text_block.height})`);

      people_group
      .append("text")
      .text(text);

      people_group
      .append("svg:image")
      .attr('width', width/100 * 20)
      .attr('height', 100)
      .style("cursor", "pointer")
      .style("opacity", 1)
      .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg")
      .style("fill", "#69b3a2");
    }

    function draw_cake(){

    }

    function update_cake(){

      var people_group = starting_position
      .append("g")
      .attr("transform", `translate(${width/100 * width_percentage}, ${text_block.height})`);

      people_group
      .append("text")
      .text(text);

      people_group
      .append("svg:image")
      .attr('width', width/100 * 20)
      .attr('height', 100)
      .style("cursor", "pointer")
      .style("opacity", 1)
      .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg")
      .style("fill", "#69b3a2");
    }

    add_people_group(starting_position, 0, "1%");
    add_people_group(starting_position, 25, "10%");
    add_people_group(starting_position, 50, "40%");
    add_people_group(starting_position, 75, "50%");

  };

}
