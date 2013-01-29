class UsersController < ApplicationController
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome Email after save
        UserMailer.welcome_email(@user).deliver

        format.html { render action: "success" }
        format.json { render json: @user, status: :created, location: @user }
      else
        error_code = "SIGNUP_ERROR_UNKNOWN"
        case @user.errors.full_messages[0]
        when "Email can't be blank" then error_code = "SIGNUP_ERROR_EMAIL_EMPTY"
        when "Email is invalid" then error_code = "SIGNUP_ERROR_EMAIL_INVALID"
        when "Email has already been taken" then error_code = "SIGNUP_ERROR_EMAIL_DUPLICATE"
        end
        format.html { redirect_to root_url + "?email=" + @user.email, notice: error_code }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
