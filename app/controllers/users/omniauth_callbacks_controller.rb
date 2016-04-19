class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      @user.skip_confirmation!
      if @user.save
        sign_in @user
        redirect_to edit_user_path(@user)
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        puts session.to_json
        # puts request.env.to_json
        redirect_to new_user_registration_url
      end
    end
  end

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect @user, event: :authentication
    else
      @user.skip_confirmation!
      if @user.save
        sign_in @user
        redirect_to edit_user_path(@user)
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end
end