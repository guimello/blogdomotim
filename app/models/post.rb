class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true, :length => { :minimum => 1, :maximum => 255 }, :allow_blank => true 
  validates :body,  :presence => true
  validates :user,  :presence => true
end
