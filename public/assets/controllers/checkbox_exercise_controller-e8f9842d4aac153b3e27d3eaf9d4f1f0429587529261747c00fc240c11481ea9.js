import{Controller}from"@hotwired/stimulus";import*as Ajax from"ajax";var solution=[];export default class extends Controller{static targets=["button","name","output","accountId","exerciseId","exerciseClass","totalPossiblePoints","pointsDeductionForMistake","checkboxClass","solution"];static values={accountId:Number,totalPossiblePoints:Number,pointsDeductionForMistake:Number,exerciseId:Number,exerciseClass:String,myPoints:Number,solution:Array};connect(){import("jquery_with_setup").then((()=>{}))}disconnect(){}check(){console.log("check");var e=this;console.log(this.myPointsValue);var t=[...this.solutionValue],s=[];if($("."+this.checkboxClassTarget.getAttribute("data-value")+":checkbox:checked").map((function(){var i=parseInt(this.value);e.solutionValue.includes(i)?($("#"+this.id).prop("disabled",!0),$("#"+this.id+"-associated-div").addClass("bg-correct-color rounded"),t.splice(t.indexOf(i),1)):($("#"+this.id).prop("checked",!1),$("#"+this.id).prop("disabled",!0),$("#"+this.id+"-associated-div").addClass("bg-wrong-color rounded"),s.push(i))})),0===t.length){for(let t=0;t<s.length;t++)e.punishForMistake();(new Ajax.ajax).updateExerciseHistoryOfAccount(this.accountIdValue,this.exerciseClassValue,this.exerciseIdValue,this.myPointsValue).then((()=>{const e=new CustomEvent("finish_exercise",{detail:{points:this.myPointsValue}});window.dispatchEvent(e)}))}else e.punishForMistake()}punishForMistake(){this.myPointsValue-this.pointsDeductionForMistakeValue<0?this.myPointsValue=0:this.myPointsValue=this.myPointsValue-this.pointsDeductionForMistakeValue}}