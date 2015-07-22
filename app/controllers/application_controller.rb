class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token 
  before_action :check_signed_in

  def new
    @posts = Post.all.limit(10)
  end

  def profile_edit
  end

  def profile_edit_submit
    email = params[:email]
    retypePassword = params[:retypePassword]
    newPassword = params[:newPassword]
    firstName = params[:firstName]
    lastName = params[:lastName]
    pathToFile = params[:theFile]

    @user = User.find(session[:user_id]) 

    if retypePassword != ""
      if retypePassword == @user.password
        @user.password = newPassword
        @user.first_name = firstName
        @user.last_name = lastName
        @user.email = email
        if pathToFile != ""
          @user.pathToFile = pathToFile
          @user.uploadCustomPic = true
        end
        @user.save
        session[:message_profile] = "Changes Saved."
      else
        session[:message_profile] = "Passwords did not match."
      end
    else
      @user.first_name = firstName
      @user.last_name = lastName
      @user.email = email
      if pathToFile != ""
          @user.pathToFile = pathToFile
          @user.uploadCustomPic = true
      end
      @user.save
      session[:message_profile] = "Changes Saved."
    end
    redirect_to '/profile/edit'
  end

  def current_user
    @user = User.find_by(id: session[:user_id]) 
  end

  def check_signed_in
    if !current_user && request.original_url.end_with?('/posts/new') || 
      !current_user && request.original_url.end_with?('/comments') || 
      !current_user && request.original_url.end_with?('/profile/edit')|| 
      !current_user && request.original_url.end_with?('/likes') || 
      !current_user && request.original_url.end_with?('/profile')
      redirect_to '/signup'
    else session[:user_id]
      current_user
    end
  end

  def getTime(postTime)
    diff = (Time.now - postTime) / 60
    if diff < 1440
      if diff < 60
        if diff.round == 1
          return diff.round.to_s + " " + "minute ago"
        else
          return diff.round.to_s + " " + "minutes ago"
        end
      else
        diff = diff / 60
        if diff.round == 1
          return diff.round.to_s + " " + "hour ago"
        else
          return diff.round.to_s + " " + "hours ago"
        end
      end
    else diff < 525600 && diff > 1440
      diff = diff / 1440
      if diff.round == 1
        return diff.round.to_s + " " + "day ago"
      else
        return diff.round.to_s + " " + "days ago"
      end
    end
  end

  helper_method :getTime
end
