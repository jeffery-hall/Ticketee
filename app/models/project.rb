class Project < ActiveRecord::Base
  has_many :tickets
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
