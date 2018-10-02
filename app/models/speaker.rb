class Speaker < ApplicationRecord
  has_one_attached :avatar
  validates_presence_of :name, :email, :company, :avatar
end
