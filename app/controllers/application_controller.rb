class ApplicationController < ActionController::Base
  around_action :switch_locale

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      super
    end
  end

  private

  def switch_locale(&action)
    locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
