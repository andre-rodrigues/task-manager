//= require_self
//= require tasks/task
//= require tasks/tasks_list
//= require tasks/tasks_service

$(function() {

  // Initialize tasks list
  var tasksList = new TasksList(".tasks-list:first");

  // Fill in list of tasks when page loads
  TasksService.fetchAll().done(function(tasks) {
    tasks.forEach(function(task) {
      tasksList.addTask(task);
    });

    tasksList.render();
  });

  // Submit form asynchronously and add new item to task's list in case of success
  $(".new-task-form").on("submit", function(e) {
    e.preventDefault();
    var stringInput = $(this).find("[name='string_input']");

    TasksService.createTask(stringInput.val()).done(function(task) {
      tasksList.addTask(task);
      tasksList.render();
    });

    stringInput.val("");
  })

});
