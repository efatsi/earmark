class Mark < ActiveRecord::Base
  validates :description, :amount, presence: true

  scope :unsaved, -> { where(:saved => false) }

  def to_s
    "#{description} - $#{amount}"
  end
end
