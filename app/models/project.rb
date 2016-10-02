class Project < ActiveRecord::Base
  has_many :keywords, dependent: :destroy
  validates :name, uniqueness: true
end
