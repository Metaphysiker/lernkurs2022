import { Controller } from "@hotwired/stimulus"

import * as Ajax from "ajax"

var myPoints = 3;
var pointsDeductionForMistake = 1;

export default class extends Controller {
  static targets = [ "button", "name", "output", "accountId", "exerciseId", "exerciseClass", "totalPossiblePoints", "pointsDeductionForMistake", "benefitInput", "costInput", "benefitOutput", "costOutput", "tableOutput", "fullTable" ]

  connect(){

    import("jquery_with_setup").then(jquery_with_setup => {
      myPoints = this.totalPossiblePointsTarget.getAttribute('data-value')
      pointsDeductionForMistake = this.pointsDeductionForMistakeTarget.getAttribute('data-value')
    });


    this.benefitInputTarget.addEventListener('input', (event) =>  {
      this.convertInputToTable();
    });

    this.costInputTarget.addEventListener('input', (event) =>  {
      this.convertInputToTable();
    });


  }

  disconnect(){

    this.benefitInputTarget.removeEventListener('input', (event) =>  {
      this.convertInputToTable();
    });

    this.costInputTarget.removeEventListener('input', (event) =>  {
      this.convertInputToTable();
    });
  }

  convertInputToTable(){

    var benefit_rows = this.benefitInputTarget.value.split(/\r?\n/);
    var cost_rows = this.costInputTarget.value.split(/\r?\n/);

    var rows = benefit_rows.concat(cost_rows);
    var total_value = 0;
    var html = "";

    rows.forEach(row => {
      var row_splitted = row.split(":");

      var parsed_row_splitted = parseInt(row_splitted[1], 10);

      if(isNaN(parsed_row_splitted)){
        row_splitted[1] = "Wert fehlt"
      } else {
            total_value += parsed_row_splitted;
      }

      var tr = `
      <tr>
        <td>${row_splitted[0]}</td>
        <td>${row_splitted[1]}</td>
      </tr>
      `;

      html = html + tr;

    });

    var last_tr = `
    <tr>
      <td><strong>Total: </strong></td>
      <td><strong>${total_value}</strong></td>
    </tr>
    `;

    html = html + last_tr;
    this.tableOutputTarget.innerHTML = html;
    //target.html(e.target.value);

  }

  save() {
    console.log("save");
    console.log(this.fullTableTarget);
    console.log(this.fullTableTarget.outerHTML);
    var ajax = new Ajax.ajax();
    ajax.updateExerciseHistoryOfAccount(this.accountIdTarget.getAttribute('data-value'), this.exerciseClassTarget.getAttribute('data-value'), this.exerciseIdTarget.getAttribute('data-value'), 0, this.fullTableTarget.outerHTML)
    .then(() => {
      const custom_event = new CustomEvent('correct-answer', {
        detail: {
          points: 0
        }
      })
      window.dispatchEvent(custom_event);
    });


  }

  check() {
    console.log("benefit: ");
    console.log(this.benefitInputTarget.value);
    console.log("cost: ");
    console.log(this.costInputTarget.value);

  }
}
