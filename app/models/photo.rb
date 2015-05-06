class Photo < ActiveRecord::Base
  belongs_to :task

  has_attached_file :avatar,  :styles => { :medium => "300x300>", :thumb => "70x70>" },
                              :path => "public/assets/avatars/:basename.:extension",
                              :url => "public/assets/avatars/:basename.:extension",
                              :default_url => "public/assets/avatars/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
