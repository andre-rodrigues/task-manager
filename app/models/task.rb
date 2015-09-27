class Task < ActiveRecord::Base

  def attributes
    super.merge "duration" => duration
  end

  def duration
    end_at - start_at
  end

end
