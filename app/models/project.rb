class Project < ApplicationRecord
  belongs_to :owner, :class_name => "User" 
  belongs_to :assigned, :class_name => "User"
  validates :title, presence: true,uniqueness: true
  validates :description, presence: true

end
