class EventDate < ApplicationRecord
  belongs_to :event

  def to_s
    date.to_s
  end

  def month_s
    long = I18n.t('date.month_names')[date.month]
    return long[0..2].upcase
  end
end
