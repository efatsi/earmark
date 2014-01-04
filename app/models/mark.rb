class Mark < ActiveRecord::Base

  def to_s
    "#{description} - $#{amount}"
  end
end
