class Schedule < ApplicationRecord

  belongs_to :trader

  #今日より前の日程は入力不可
  validate :date_before_start
  #日程未入力は不可
  validates :start_time, presence: true

  def date_before_start
    errors.add(:start_time, "は過去の日付を選択できません") if start_time < Date.today
  end

end
