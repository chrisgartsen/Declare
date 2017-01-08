module ApplicationHelper

  def application_name
    ENV['APPLICATION_NAME']
  end

  def application_version
    ENV['APPLICATION_VERSION']
  end

end
