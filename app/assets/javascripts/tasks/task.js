function Task(attributes) {
  if (typeof attributes != "object") throw "InvalidParams: Task must have attributes"
  this.description = attributes.description;
  this.startAt = attributes.startAt;
  this.endAt = attributes.endAt;
  this.duration = attributes.duration;

  var $template = $(".task.blueprint").clone();

  this.render = function() {
    $template.find(".description").text(attributes.startAt + " - " + attributes.description);
    $template.find(".start-at .value").text(attributes.startAt);
    $template.find(".end-at .value").text(attributes.endAt);
    $template.find(".duration .value").text(attributes.duration);
    $template.removeClass("blueprint");
    return $template;
  }
}

window.Task = Task;