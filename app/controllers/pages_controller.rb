class PagesController < ApplicationController
  def hola
    render plain: "¡Hola desde Rails!"
  end
end
