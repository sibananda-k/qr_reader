class QrHandlersController < ApplicationController
  def new; end

  def show
    @string = params[:q]
  end

  def upload; end

  def decode
    data = JSON.load(RestClient.post( 'api.qrserver.com/v1/read-qr-code/',
      {
        :file => params[:file]
      }
      ))
    tmp = params[:file].tempfile
    destiny_file = File.join('public', 'images', params[:file].original_filename)
    FileUtils.move tmp.path, destiny_file
    @file_name = params[:file].original_filename
    @result = data[0]['symbol'][0]['data']
  end
end
