class Event < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :memo, length: {maximum: 500}

  @event = Event.new(name: nil, start_at: nil, finish_at: nil)
  @event.valid?
  @event.errors.full_messages

  validate :start_finish_check
  def start_finish_check
    if start_at.present? && finish_at.present?
      errors.add(:finish_at, "は開始日以降で設定してください") unless
      self.start_at < self.finish_at
    end
  end

end
