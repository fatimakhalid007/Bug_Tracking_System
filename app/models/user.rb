class User < ApplicationRecord
  authenticates_with_sorcery!
  
  has_many :projects, :class_name => "Project", :foreign_key => :owner_id
  has_many :assigned_projects, :class_name => "Project", :foreign_key => :assigned_id



  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true
  before_save { self.email = email.downcase }
  validates :email, presence:true,format:     { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", small:"20x20>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # mount_uploader :image, ImageUploader
   # validates_attachment :avatar, presence: true
   # validates_presence_of :name, :image
   # validates_attachment_presence :image, :if => :method
end