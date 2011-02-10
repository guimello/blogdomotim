class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name,  :birthday

  validates :name, :presence => true, :allow_blank => true, :length => { :minimum => 1, :maximum => 255 }
  validates :birthday, :presence => true, :if => proc { |user| user.birthday.blank? && user.birthday_before_type_cast.blank? }
  validate  :birthday_format

  protected

  def birthday_format
    db_date_regex = %r(^(\d{1,4})-(\d{1,2})-(\d{1,2})$)

    if self.birthday_before_type_cast.present?
      if self.birthday_before_type_cast.to_local_datetime
        self.birthday = self.birthday_before_type_cast.to_local_datetime.to_date
      elsif self.birthday_before_type_cast =~ db_date_regex
        self.birthday = Time.zone.parse(self.birthday_before_type_cast)
      else
        self.errors.add :birthday, I18n.t(:birthday, :scope => [:user, :invalid])
      end
    end
  end
end
