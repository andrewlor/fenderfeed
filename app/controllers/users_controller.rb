class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token 
  def create
    email = params[:email]
    password = params[:password]
    firstName = params[:firstName]
    lastName = params[:lastName]

    if email == '' || password == '' || firstName == '' || lastName == ''
      session[:error_signup] = "Missing required fields."
      redirect_to '/signup'
    else
      user = User.find_by(email: email)
      if user
        session[:error_signup] = "User already exists."
        redirect_to '/signup'
      else
        user = User.create(first_name: firstName, last_name: lastName, email: email, password: password, uploadCustomPic: false)
        session[:user_id] = user.id
        session[:error_signup] = nil
        session[:error_login] = nil
        redirect_to '/'
    end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signup'
  end

  def new
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if email == "" || password == ""
      session[:error_login] = "Missing required fields."
      redirect_to '/signup'
    else
      if user == nil
        session[:error_login] = "User does not exist."
        redirect_to 'signup'
      end

      if user.password == password 
        session[:user_id] = user.id
        session[:error_signup] = nil
        session[:error_login] = nil
        redirect_to '/'
      else
        session[:error_login] = "Email/Password is incorrect."
        redirect_to '/signup'
      end
    end
  end

  def show
    @user_view = User.find(params[:id])
    @posts = @user_view.posts.all.limit(10)
  end
end
