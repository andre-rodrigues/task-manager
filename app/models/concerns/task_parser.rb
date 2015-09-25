class TaskParser
  class InvalidTimeUnit < StandardError; end

  # Parses a input string to a new Task
  # @param String
  #  - Estudar tecnologias 30 minutos
  #  - Pegar trânsito
  # @returns Task a new Task
  def self.parse(string_input)
    description, time_spent, unit = *string_input.split(/(\d+) (\w+)/)

    Task.new(
      description: description,
      start_at: start_at,
      end_at: start_at + sanitize_duration(time_spent, unit)
    )
  end

  private

  def self.start_at
    date = Date.current
    Task.last.try(:end_at) || Time.new(date.year, date.month, date.day, 9, 0, 0)
  end

  def self.sanitize_duration(time_spent, unit)
    return 0.0 if time_spent.blank?

    case unit
      when /minut/ then time_spent.to_f.minutes
      when /hora/, /hour/ then time_spent.to_f.hours
      when /segundo/, /second/ then time_spent.to_f.seconds
      else raise InvalidTimeUnit
    end
  end
end