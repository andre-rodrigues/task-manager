function TasksList(htmlList) {
  var $container = $(htmlList);
  var tasks = []
  var self = this;

  this.addTask = function(task) {
    tasks.push(task);
  }

  this.render = function() {
    $container.children(":not(.blueprint)").remove();

    if (tasks.length == 0) $container.append("<li>Nenhuma tarefa cadastrada</li>");

    tasks.forEach(function(task) {
      $container.append(task.render());
    });
  }
}

window.TasksList = TasksList;