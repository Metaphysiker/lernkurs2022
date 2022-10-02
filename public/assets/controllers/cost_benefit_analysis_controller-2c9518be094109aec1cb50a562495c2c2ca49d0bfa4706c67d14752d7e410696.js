import{Controller}from"@hotwired/stimulus";import*as Ajax from"ajax";var myPoints=3,pointsDeductionForMistake=1;export default class extends Controller{static targets=["button","name","output","accountId","exerciseId","exerciseClass","totalPossiblePoints","pointsDeductionForMistake","benefitInput","costInput","benefitOutput","costOutput","tableOutput","fullTable"];connect(){import("jquery_with_setup").then((()=>{myPoints=this.totalPossiblePointsTarget.getAttribute("data-value"),pointsDeductionForMistake=this.pointsDeductionForMistakeTarget.getAttribute("data-value")})),this.benefitInputTarget.addEventListener("input",(()=>{this.convertInputToTable()})),this.costInputTarget.addEventListener("input",(()=>{this.convertInputToTable()}))}disconnect(){this.benefitInputTarget.removeEventListener("input",(()=>{this.convertInputToTable()})),this.costInputTarget.removeEventListener("input",(()=>{this.convertInputToTable()}))}convertInputToTable(){var t=this.benefitInputTarget.value.split(/\r?\n/),e=this.costInputTarget.value.split(/\r?\n/),n=t.concat(e),s=0,o="";n.forEach((t=>{var e=t.split(":"),n=parseInt(e[1],10);isNaN(n)?e[1]="Wert fehlt":s+=n;var a=`\n      <tr>\n        <td>${e[0]}</td>\n        <td>${e[1]}</td>\n      </tr>\n      `;o+=a})),o+=`\n    <tr>\n      <td><strong>Total: </strong></td>\n      <td><strong>${s}</strong></td>\n    </tr>\n    `,this.tableOutputTarget.innerHTML=o}save(){console.log("save"),console.log(this.fullTableTarget),console.log(this.fullTableTarget.outerHTML),(new Ajax.ajax).updateExerciseHistoryOfAccount(this.accountIdTarget.getAttribute("data-value"),this.exerciseClassTarget.getAttribute("data-value"),this.exerciseIdTarget.getAttribute("data-value"),0,this.fullTableTarget.outerHTML).then((()=>{const t=new CustomEvent("save_answer",{detail:{message:"Deine Antwort wurde gespeichert!"}});window.dispatchEvent(t)}))}check(){console.log("benefit: "),console.log(this.benefitInputTarget.value),console.log("cost: "),console.log(this.costInputTarget.value)}}