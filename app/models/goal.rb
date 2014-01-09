class Goal < ActiveRecord::Base
  validates :description, :amount, presence: true
  def to_s
    "#{description} - $#{amount}"
  end
end
