import{Controller}from"@hotwired/stimulus";import*as Ajax from"ajax";var solution=[];export default class extends Controller{static targets=["button","name","output","accountId","exerciseId","exerciseClass","totalPossiblePoints","pointsDeductionForMistake","checkboxClass","solution"];static values={accountId:Number,totalPossiblePoints:Number,pointsDeductionForMistake:Number,exerciseId:Number,exerciseClass:String,myPoints:Number,solution:Array};connect(){console.log(this.solutionValue),import("jquery_with_setup").then((t=>{}))}disconnect(){}check(){var t=this;console.log(this.myPointsValue);var e=[...this.solutionValue],s=[];($("."+this.checkboxClassTarget.getAttribute("data-value")+":checkbox:checked").map((function(){var i=parseInt(this.value);t.solutionValue.includes(i)?($("#"+this.id).prop("disabled",!0),e.splice(e.indexOf(i),1)):($("#"+this.id).prop("checked",!1),$("#"+this.id).prop("disabled",!0),s.push(i))})),0===e.length&&0===s.length)?(console.log("all answers correct"),(new Ajax.ajax).updateExerciseHistoryOfAccount(this.accountIdValue,this.exerciseClassValue,this.exerciseIdValue,this.myPointsValue).then((()=>{const t=new CustomEvent("finish_exercise",{detail:{points:this.myPointsValue}});window.dispatchEvent(t)}))):this.myPointsValue-this.pointsDeductionForMistakeValue<0?this.myPointsValue=0:this.myPointsValue=this.myPointsValue-this.pointsDeductionForMistakeValue}}