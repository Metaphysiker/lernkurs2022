import $ from "jquery"

export function ajax() {
  this.updateCourseStatusOfAccount = function(account_id, course_id, status) {
    $.ajax({
      url: "/accounts/" + account_id + "/update_course_status",
      type: "PUT",
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: {course_id: course_id, status: status},
    }).done(function(response) {
      console.log(response);
    });
  },
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
  this.updateExerciseHistoryOfAccount = function(account_id, exercise_class, exercise_id, points, answer = "") {

    return new Promise(function(resolve, reject) {
      $.ajax({
        url: "/accounts/" + account_id + "/update_excercise_history",
        type: "PUT",
        headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
        data: {exercise_class: exercise_class, exercise_id: exercise_id, points: points, answer: answer},
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
      data: {account_id: account_id, course_id: course_id},
    }).done(function(response) {
      resolve(response);
    });
  })
  }


  this.sendResultsTo = function(account_id, course_id, email1, email2) {
    return new Promise(function(resolve, reject) {
    $.ajax({
      url: "/accounts/" + account_id + "/send_results_to",
      type: "POST",
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: {account_id: account_id, course_id: course_id, email1: email1, email2: email2},
    }).done(function(response) {
      resolve(response);
    });
  })
  }

  this.saveProgress = function(account_id, first_name, email, password) {
    return new Promise(function(resolve, reject) {
    $.ajax({
      url: "/accounts/" + account_id + "/save_progress",
      type: "POST",
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: {id: account_id, first_name: first_name, email: email, password: password },
    }).done(function(response) {
      resolve(response);
    });
  })
  }

  this.check_if_medal_is_awarded = function(account_id, course_id){
    return new Promise(function(resolve, reject) {
    $.ajax({
      url: "/accounts/" + account_id + "/check_if_medal_is_awarded",
      type: "GET",
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: {account_id: account_id, course_id: course_id},
    }).done(function(response) {
      resolve(response);
    });
  })
  }

};
