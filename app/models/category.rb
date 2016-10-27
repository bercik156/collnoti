class Category < ApplicationRecord
  has_many :notifis

  def to_s
    "#{name}"
  end
end
