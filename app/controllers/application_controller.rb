class ApplicationController < ActionController::Base
  include SessionsHelper

  #Sentry
  before_action :set_raven_context

  private

  #Sentry
  def set_raven_context
    Raven.user_context(id: session[:user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

end
