class TopController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  require 'chunky_png'

  def index
  end

  def show
    @qr_id = Qr.find_by(id: params[:id])

    content = "#{@qr_id.url}"
    size    = 3         
    level   = :h            
    @qr_code = RQRCode::QRCode.new(content, size: size, level: level).as_svg.html_safe
  end

  def create
    @qr = Qr.new(url: params[:url])
    if @qr.save
      redirect_to("/top/#{@qr.id}")
    end
  end
end
