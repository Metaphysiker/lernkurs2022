import{Controller}from"@hotwired/stimulus";import*as Ajax from"ajax";export default class extends Controller{static targets=["button","name","output","accountId","exerciseId","exerciseClass","totalPossiblePoints","pointsDeductionForMistake"];static values={accountId:Number,totalPossiblePoints:Number,pointsDeductionForMistake:Number,exerciseId:Number,exerciseClass:String,myPoints:Number};connect(){import("jquery_with_setup").then((e=>{}))}disconnect(){}check(){"yes"===event.params.quizQuestionCorrectAnswer?($(this.buttonTargets).prop("disabled",!0),$(this.buttonTargets).addClass("disabled"),$(event.target).addClass("correct-answer"),(new Ajax.ajax).updateExerciseHistoryOfAccount(this.accountIdValue,this.exerciseClassValue,this.exerciseIdValue,this.myPointsValue).then((()=>{const e=new CustomEvent("finish_exercise",{detail:{points:this.myPointsValue}});window.dispatchEvent(e)}))):($(event.target).prop("disabled",!0),$(event.target).addClass("disabled"),$(event.target).addClass("false-answer"),this.myPointsValue-this.pointsDeductionForMistakeValue<0?this.myPointsValue=0:this.myPointsValue=this.myPointsValue-this.pointsDeductionForMistakeValue)}}