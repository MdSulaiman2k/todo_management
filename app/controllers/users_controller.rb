class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasent_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasent_string
  end

  def create
    name = params[:user_name]
    email = params[:user_email]
    password = params[:user_password]
    user = User.create!(
      user_name: name,
      user_email: email,
      user_password: password,
    )
    response_text = "You are registered successfully with an id #{user.id}"
    render plain: response_text
  end

  def login
    email = params[:user_email]
    password = params[:user_password]
    user = User.where("user_email = ?", email).first
    if user == nil
      render plain: "User not Found,Enter valid email"
    elsif user.user_password == password
      render plain: "Login successful,Your id is #{user.id}"
    else
      render plain: "Your password is wrong,Enter valid password"
    end
  end
end
