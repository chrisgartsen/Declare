module ApplicationHelper

  def application_name
    ENV['APPLICATION_NAME']
  end

  def main_page?
    params[:controller] == 'static_pages' && params[:page] == 'home'
  end

end
