json.description task.description
json.start_at task.start_at.strftime("%H:%M")
json.end_at task.end_at.strftime("%H:%M")
json.duration distance_of_time_in_words(task.start_at, task.end_at)
json.description task.description