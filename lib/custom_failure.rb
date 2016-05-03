class CustomFailure < Devise::FailureApp
  def redirect_url
    root_url(anchor: 'log_in')
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end