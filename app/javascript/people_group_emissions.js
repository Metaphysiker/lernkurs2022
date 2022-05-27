import $ from "jquery"
import * as d3 from 'd3';

export function peopleGroupEmissions() {
  this.draw = function(container) {

    //variables
    let margin = {top: 5, right: 5, bottom: 5, left: 5};
    let width = $(container).width();
    let height = 600;
    let text_block = {height: 150, width: 200};
    const radius = Math.min(width, height) / 2;
    const data1 = {a: 9, b: 20, c:30, d:8, e:12}

    //define svg
    const svg = d3.select(container)
    .append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g");

    var starting_position = svg.append("g")
                            .attr("transform", `translate(${margin.left}, ${margin.top})`);

    //add introduction_text
    var introduction_text = starting_position.append("foreignObject")
    .attr("x", 0)
    .attr("y", 0)
    .attr("height", height)
    .attr("width", width)
  .append("xhtml:div")
    .html(`<div class="">
          Klick auf eine Bevölkerungsgruppe aus und schau, wie viel Treibhausgase sie verursacht:
        </div>`);

    //add people groups
    add_people_group(starting_position, 0, "1%");
    add_people_group(starting_position, 25, "10%");
    add_people_group(starting_position, 50, "40%");
    add_people_group(starting_position, 75, "50%");
    draw_pie(data1);


    //functions
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

    function draw_pie(data){

      const color = d3.scaleOrdinal()
      .domain(["a", "b", "c", "d", "e", "f"])
      .range(d3.schemeDark2);

    // Compute the position of each group on the pie:
    const pie = d3.pie()
      .value(function(d) {return d[1]; })
      .sort(function(a, b) { return d3.ascending(a.key, b.key);} ) // This make sure that group order remains the same in the pie chart

    const data_ready = pie(Object.entries(data))

    // map to data
    const u = svg.selectAll("path")
      .data(data_ready)

        // Build the pie chart: Basically, each part of the pie is a path that we build using the arc function.
        u
          .join('path')
          .transition()
          .duration(1000)
          .attr('d', d3.arc()
            .innerRadius(0)
            .outerRadius(radius)
          )
          .attr('fill', function(d){ return(color(d.data[0])) })
          .attr("stroke", "white")
          .style("stroke-width", "2px")
          .style("opacity", 1)


    }

    function update_pie(){

    }



  };

}
