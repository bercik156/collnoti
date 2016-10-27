class Notifi < ApplicationRecord
  belongs_to :category

  validates_length_of :description, :minimum => 100
  validates_presence_of :description, :category, :email
  validates_format_of :email, :with => /@/, :message => "Wrong e-mail"

  after_save :updater

  private

  def updater
    now = Time.now
    if self.category_id == 1

      if (9..16).cover? now.hour
        cost = '50'
        self.update_column(:cost, cost)
      else
        cost = '100'
        self.update_column(:cost, cost)
      end
      t = self.created_at + (4*60*60)
      self.update_column(:deadline, t)

    elsif self.category_id == 2
      cost = '10'
      self.update_column(:cost, cost)
      deadline = days_left(1)
      self.update_column(:deadline, deadline)
    else
      cost = '1'
      self.update_column(:cost, cost)
      deadline = days_left(3)
      self.update_column(:deadline, deadline)
    end

  end

  def days_left(data)
    deadline_day = Date.today + data.days
    if deadline_day.wday == 0
      deadline_day += 1.day
    elsif deadline_day.wday == 6
      deadline_day += 2.days
    else
      deadline_day
    end
  end

end
