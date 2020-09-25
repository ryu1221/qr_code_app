class TopController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  require 'chunky_png'

  def index
    @qr_url = Qr.new(url: params[:url])
  end

  def show
    @qr = Qr.find_by(id: params[:id])

    content = "#{@qr.url}"
    size    = 10      
    level   = :h      

    @qr_code = RQRCode::QRCode.new(content, size: size, level: level)
    png = @qr_code.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 300
    )

    File.binwrite("./public/qr_images/qrcode.png", png.to_s)
    
  end


  def create
    @qr_url = Qr.new(url: params[:url])
    
    if @qr_url.save
      redirect_to("/top/#{@qr_url.id}")
    else
      render('index')
    end
  end

end
