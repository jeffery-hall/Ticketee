class Project < ActiveRecord::Base
  has_many :tickets, dependent: :delete_all
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
