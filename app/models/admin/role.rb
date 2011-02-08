class Admin::Role < ActiveRecord::Base
  validates :name, :presence => true, :allow_blank => true, :length => { :minimum => 1, :maximum => 255 }
end
