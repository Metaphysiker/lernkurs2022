var myPoints = 3;
var pointsDeductionForMistake = 1;

connect(){
  import("jquery_with_setup").then(jquery_with_setup => {
    myPoints = this.totalPossiblePointsTarget.getAttribute('data-value')
    pointsDeductionForMistake = this.pointsDeductionForMistakeTarget.getAttribute('data-value')
  });
}
