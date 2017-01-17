module ApplicationHelper

  def application_name
    ENV['APPLICATION_NAME']
  end

  def application_version
    ENV['APPLICATION_VERSION']
  end

  def main_page?
    params[:controller] == 'static_pages' && params[:page] == 'home'
  end

end
