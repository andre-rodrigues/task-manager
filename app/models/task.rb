class Task < ActiveRecord::Base

  def duration
    end_at - start_at
  end

end
