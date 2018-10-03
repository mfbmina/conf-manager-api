class Sponsor < ApplicationRecord
  has_one_attached :logo
  validates_presence_of :name, :website, :tier
end
