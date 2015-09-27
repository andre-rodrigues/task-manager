function TasksService() {
  var basePath = "/api/v1"

  this.fetchAll = function() {
    var asyncCall = $.ajax({
      url: basePath + "/tasks",
      dataType: "json"
    });
    var defer = $.Deferred();

    defer.promise( asyncCall );
    asyncCall.success(function(jsonTasks) {
      var tasks = jsonTasks.map(function(taskAttributes) {
        return new Task({
          description: taskAttributes.description,
          startAt: taskAttributes.start_at,
          endAt: taskAttributes.end_at,
          duration: taskAttributes.duration
        });
      });

      defer.resolve( tasks );
    }).error(function(data) {
      defer.reject(data);
    });

    return asyncCall;
  }

  this.createTask = function(stringInput) {
    var asyncCall = $.ajax({
      url: basePath + "/tasks",
      dataType: "json",
      type: "POST",
      data: {
        string_input: stringInput
      }
    });
    var defer = $.Deferred();

    defer.promise( asyncCall );
    asyncCall.success(function(jsonTask) {
      var newTask = new Task({
        description: jsonTask.description,
        startAt: jsonTask.start_at,
        endAt: jsonTask.end_at,
        duration: jsonTask.duration
      });

      defer.resolve(newTask)
    }).error(function(data) {
      defer.reject(data);
    });

    return asyncCall;
  }
}

window.TasksService = new TasksService();