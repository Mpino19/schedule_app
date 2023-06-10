class Event < ApplicationRecord
  validates :name, presence: true, length: {maximum: 20}
  validates :start_at, presence: true
  validates :finish_at, presence: true
  validates :memo, length: {maximum: 500}
  validate :start_end_check

  def start_end_check
    errors.add(:finish_at, "は開始日より前の日付は登録できません。") unless
    self.start_at < self.finish_at
    end
end
