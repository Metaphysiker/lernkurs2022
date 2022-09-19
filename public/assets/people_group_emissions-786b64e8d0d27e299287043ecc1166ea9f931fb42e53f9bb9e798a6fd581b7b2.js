import $ from"jquery";import*as d3 from"d3";export function peopleGroupEmissions(){this.draw=function(t){let e=5,n=5,r=$(t).width(),a=$(t).height();Math.min(r,a);const i=d3.select(t).append("svg").attr("width",r).attr("height",a).append("g");i.append("g").attr("transform",`translate(${n}, ${e})`);var o=i.append("g").attr("transform",`translate(${n}, ${e})`),s=i.append("g").attr("transform",`translate(${n}, 100)`),l=i.append("g").attr("transform",`translate(${n}, 250)`),d=i.append("g").attr("transform",`translate(${r/2}, 450)`);f(o,"Wer verursacht wie viele CO2-Emissionen?");var p=f(l,"Klicke oben auf eine Bevölkerungsgruppe!");h(s,0,"1%","Die allerreichsten Menschen verursachen 15 Prozent aller Emissionen.",JSON.stringify({a:15,b:85})),h(s,25,"10%","Die reichen Menschen verursachen 37 Prozent aller Emissionen.",JSON.stringify({a:17,b:83})),h(s,50,"40%","Die Mittelschicht verursacht 41 Prozent aller Emissionen.",JSON.stringify({a:41,b:59})),h(s,75,"50%","Die ärmsten Menschen 7 Prozent aller Emissionen.",JSON.stringify({a:7,b:93}));var u=d3.arc();function c(t,e,n){var r=t.startAngle,a=n,i=d3.interpolate(t.startAngle,r),o=d3.interpolate(t.endAngle,a);return function(e){return t.startAngle=i(e),t.endAngle=o(e),u(t)}}function f(t,e){return t.append("foreignObject").attr("x",0).attr("y",0).attr("height",a).attr("width",r).append("xhtml:div").html(`<div class="text-center">\n            ${e}\n          </div>`)}function h(t,e,n,a,i){var o=t.append("g").attr("transform",`translate(${r/100*e}, 0)`);o.append("text").text(n);var s=o.append("svg:image").attr("width",r/100*20).attr("height",100).style("cursor","pointer").style("opacity",1).attr("information_text",a).attr("pie_data",i).attr("xlink:href","https://upload.wikimedia.org/wikipedia/commons/d/d8/Person_icon_BLACK-01.svg").style("fill","#69b3a2");o.on("mouseenter",(function(){s.transition().duration(500).attr("width",r/100*25).attr("height",120)})),o.on("mouseleave",(function(){s.transition().duration(500).attr("width",r/100*20).attr("height",100)})),o.on("click",(function(){p.remove(),p=f(l,s.attr("information_text")),function(t,e){t.selectAll("path").remove();var n=[{startAngle:0,endAngle:0,innerRadius:0,outerRadius:100,fill:"#F3A54A"}],r=[{startAngle:e.a/100*6.28,endAngle:e.a/100*6.28,innerRadius:0,outerRadius:100,fill:"#CCDE66"}];t.data(n).append("path").attr("d",u).attr("stroke","white").attr("fill","green").transition().duration(1e3).attrTween("d",(function(t){return c(t,0,e.a/100*6.28)}));var a=t.data(r).attr("logging",(function(t){console.log(t)})).append("path").attr("d",u).attr("stroke","white").attr("fill","blue");a.transition().duration(1e3).delay(1e3).attrTween("d",(function(t){return c(t,e.a,6.28)})),t.data(n).enter().append("path").style("fill",(function(t){return t.fill})).attr("d",u).transition().duration(1e3).attrTween("d",(function(t){return c(t,e.a)})),t.data(r).enter().append("path").style("fill",(function(t){return t.fill})).attr("d",u).transition().duration(1e3).attrTween("d",(function(t){return c(t)}))}(d,JSON.parse(s.attr("pie_data")))}))}}}