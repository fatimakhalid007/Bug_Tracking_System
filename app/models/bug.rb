class Bug < ApplicationRecord
	belongs_to :user
	belongs_to :project

	validates :bug_title, presence: true,uniqueness: true
    validates :bug_description, presence: true
    validates :bug_status, presence: true
    validates :bug_deadline, presence:true
    validates  :bug_type ,presence:true
    validates  :project_id,presence:true
   
    has_attached_file :screenshot, styles: { medium: "300x300>", thumb: "100x100>", small:"20x20>" }, default_url: "/images/:style/missing.png"

    validates_attachment_content_type :screenshot, content_type: /\Aimage\/.*\z/
end
