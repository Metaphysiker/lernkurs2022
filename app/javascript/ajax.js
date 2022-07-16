import $ from "jquery"

export function ajax() {
  this.updateCourseHistoryOfAccount = function(account_id, course_id, slide_id) {
    $.ajax({
      url: "/accounts/" + account_id + "/update_course_history",
      type: "PUT",
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: {course_id: course_id, slide_id: slide_id},
    }).done(function(response) {
      console.log(response);
    });
  },
  this.updateExerciseHistoryOfAccount = function(account_id, exercise_class, exercise_id, points) {

    return new Promise(function(resolve, reject) {
      $.ajax({
        url: "/accounts/" + account_id + "/update_excercise_history",
        type: "PUT",
        headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
        data: {exercise_class: exercise_class, exercise_id: exercise_id, points: points},
      }).done(function(response) {
        resolve(response);
      });

    });


  },
  this.getPointsFromCourse = function(account_id, course_id) {
    return new Promise(function(resolve, reject) {
    $.ajax({
      url: "/accounts/" + account_id + "/get_points_from_course",
      type: "GET",
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: {account_id: account_id, course_id},
    }).done(function(response) {
      resolve(response);
    });
  })
  }

}
