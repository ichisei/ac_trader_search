class Schedule < ApplicationRecord

  belongs_to :trader

  #今日より前の日程は入力不可
  validate :date_before_start
  #同じ日は入力不可
  validates :start_time, uniqueness:


  def date_before_start
    errors.add(:start_time, "は過去の日付を選択できません") if start_time < Date.today
  end

end
