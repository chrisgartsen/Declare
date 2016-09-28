class StaticPagesController < ApplicationController

  def show
    page = params[:page]
    page_exists?(page) ? render(page) : render_404
  end

  private

    def render_404
      render file: "public/404.html", status: :not_found
    end

    def page_exists?(page_name)
      File.exists?(Pathname.new(Rails.root() + "app/views/static_pages/#{page_name}.html.erb"))
    end

end
