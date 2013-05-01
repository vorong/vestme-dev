class UsersController < ApplicationController
  
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@user.email).deliver

        format.html { render action: "success" }
        format.json { render json: @user, status: :created, location: @user }
      else
        error_code = "SIGNUP_ERROR_UNKNOWN"
        case @user.errors.full_messages[0]
        when "Email can't be blank" then error_code = "SIGNUP_ERROR_EMAIL_EMPTY"
        when "Email is invalid" then error_code = "SIGNUP_ERROR_EMAIL_INVALID"
        when "Email has already been taken" then format.html { render action: "alreadysignedup" }
        end
        format.html { redirect_to root_url + "?email=" + @user.email, notice: error_code }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1
  def show
    if (params[:email] == nil)
      @user = User.find_by_id(params[:id])
      UserMailer.welcome_email(@user.email).deliver
    else
      @user = User.find_by_email(params[:email])
      UserMailer.welcome_email(@user.email).deliver
      respond_to do |format|
        format.html { render action: "resend" }
      end
    end
  end
end
