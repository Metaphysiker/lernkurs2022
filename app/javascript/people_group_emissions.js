import $ from "jquery";
import * as d3 from 'd3';

export function peopleGroupEmissions() {
  this.draw = function(container) {

    //variables
    let margin = {top: 5, right: 5, bottom: 5, left: 5};
    let width = $(container).width();
    let height = $(container).height();
    let text_block = {height: 150, width: 200};
    const radius = Math.min(width, height) / 4;
    const data1 = {a: 0, b: 100}

    //define svg
    const svg = d3.select(container)
    .append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g");

    //positions
    var starting_position = svg.append("g")
                            .attr("transform", `translate(${margin.left}, ${margin.top})`);

    var text_position = svg.append("g")
                            .attr("transform", `translate(${margin.left}, ${margin.top})`);

    var people_group_position = svg.append("g")
                            .attr("transform", `translate(${margin.left}, ${100})`);

    var emission_text_position = svg.append("g")
                            .attr("transform", `translate(${margin.left}, ${250})`);

    var pie_position = svg.append("g")
                            .attr("transform", `translate(${width/2}, ${450})`);


   add_text(text_position, "Wer verursacht wie viele CO2-Emissionen?");

   var emission_text = add_text(emission_text_position, "Klicke oben auf eine Bevölkerungsgruppe!");

    //add people groups
    add_people_group(people_group_position, 0, "1%", "Die allerreichsten Menschen verursachen 15 Prozent aller Emissionen.", JSON.stringify({a: 15, b: 85}));
    add_people_group(people_group_position, 25, "10%", "Die reichen Menschen verursachen 37 Prozent aller Emissionen.", JSON.stringify({a: 17, b: 83}));
    add_people_group(people_group_position, 50, "40%", "Die Mittelschicht verursacht 41 Prozent aller Emissionen.", JSON.stringify({a: 41, b: 59}));
    add_people_group(people_group_position, 75, "50%", "Die ärmsten Menschen 7 Prozent aller Emissionen.", JSON.stringify({a: 7, b: 93}));

    //add pie
    //add_pie(pie_position, data1);
    var arc = d3.arc()

function arcTween(d, start_angle, end_angle) {
    var new_startAngle = d.startAngle//start_angle //Math.random() * 2 * Math.PI
    var new_endAngle = end_angle
    var interpolate_start = d3.interpolate(d.startAngle, new_startAngle)
    var interpolate_end = d3.interpolate(d.endAngle, new_endAngle)
    return function(t) {
      d.startAngle = interpolate_start(t)
      d.endAngle = interpolate_end(t)
      return arc(d)
    }
  }

    //functions

    function add_text(container, text){
      return container.append("foreignObject")
      .attr("x", 0)
      .attr("y", 0)
      .attr("height", height)
      .attr("width", width)
    .append("xhtml:div")
      .html(`<div class="text-center">
            ${text}
          </div>`);
    }

    function add_people_group(container, width_percentage, text, information_text, pie_data){

      var people_group = container
      .append("g")
      .attr("transform", `translate(${width/100 * width_percentage}, 0)`);

      people_group
      .append("text")
      .text(text);

      var people_group_image = people_group
      .append("svg:image")
      .attr('width', width/100 * 20)
      .attr('height', 100)
      .style("cursor", "pointer")
      .style("opacity", 1)
      .attr("information_text", information_text)
      .attr("pie_data", pie_data)
      .attr("xlink:href", "https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg")
      .style("fill", "#69b3a2");

      people_group.on("mouseenter", function(){
        people_group_image
        .transition()
        .duration(500)
        .attr('width', width/100 * 25)
        .attr('height', 120);
      });

      people_group.on("mouseleave", function(){
        people_group_image
        .transition()
        .duration(500)
        .attr('width', width/100 * 20)
        .attr('height', 100);
      });

      people_group.on("click", function(){
        emission_text.remove();
        emission_text = add_text(emission_text_position, people_group_image.attr("information_text"));
        add_pie(pie_position, JSON.parse(people_group_image.attr("pie_data")));
      });
    }

    function add_pie(container, data){

      container.selectAll("path").remove();

      var first_pie_arc = [{
              startAngle: 0,
              endAngle: 0,
              innerRadius: 0,
              outerRadius: 100,
              fill: "#F3A54A"
            }]

      var second_pie_arc = [{
              startAngle: 6.28 * (data.a/100),
              endAngle: 6.28 * (data.a/100),
              innerRadius: 0,
              outerRadius: 100,
              fill: "#CCDE66"
            }]

    var first_arc = container
    .data(first_pie_arc)
    .append("path")
    .attr("d", arc)
    .attr("stroke", "white")
    .attr("fill", "green");

    first_arc.transition()
        .duration(1000)
        .attrTween("d", function(d){
          return arcTween(d, 0, 6.28 * (data.a/100))
        })

    var second_arc = container
    .data(second_pie_arc)
    .attr("logging", function(data){
      console.log(data)
    })
    .append("path")
    .attr("d", arc)
    .attr("stroke", "white")
    .attr("fill", "blue");

    second_arc.transition()
        .duration(1000)
        .delay(1000)
        .attrTween("d", function(d){
          return arcTween(d, 6.28 * (data.a/100), 6.28)
        })

    var first_pie_arc_path = container.data(first_pie_arc).enter()
      .append("path")
      .style("fill", function(d){ return d.fill })
      .attr("d", arc);

      first_pie_arc_path.transition()
          .duration(1000)
          .attrTween("d", function(d){
            return arcTween(d, 6.28 * (data.a/100))
          })

    var second_pie_arc_path = container.data(second_pie_arc).enter()
      .append("path")
      .style("fill", function(d){ return d.fill })
      .attr("d", arc);

      second_pie_arc_path.transition()
          .duration(1000)
          .attrTween("d", function(d){
            return arcTween(d, 6.28)
          })
    }

    function add_pie1(container, data){

      const color = d3.scaleOrdinal()
      .domain(["a", "b", "c", "d", "e", "f"])
      .range(d3.schemeDark2);

    // Compute the position of each group on the pie:
    const pie = d3.pie()
      .value(function(d) {return d[1]; })
      .sort(function(a, b) { return d3.ascending(a.key, b.key);} ) // This make sure that group order remains the same in the pie chart

    const data_ready = pie(Object.entries(data))
    // map to data
    const u = container.selectAll("path")
      .data(data_ready)

      u
       .join('path')

        // Build the pie chart: Basically, each part of the pie is a path that we build using the arc function.
        u
          .join('path')
          .transition()
         .duration(2000)
          .attr('d', function(d){
            return d3.arc()
              .innerRadius(0)
              .outerRadius(radius)
              .cornerRadius(0)
              .startAngle(d.startAngle)
              .endAngle(d.endAngle)();
          })
          .attr('fill', function(d){ return(color(d.data[0])) })
          .attr("stroke", "white")
          .style("stroke-width", "2px")
          .style("opacity", 1)

    }

  };

}
