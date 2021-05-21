class User < ActiveRecord::Base
  def to_pleasent_string
    "#{id}.  #{user_name}  #{user_email} "
  end
end
