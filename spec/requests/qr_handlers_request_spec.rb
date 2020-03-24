require 'rails_helper'

RSpec.describe "QrHandlers", type: :request do
  describe 'POST #show' do
    it 'should pass the q parameter' do
      post '/show' , params: {q: 'test'}
      expect(response).to render_template(:show)
      expect(response.body).to include("https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=test")
    end
  end

  describe 'POST #decode' do
    before do
      @file = fixture_file_upload('public/nature.png')
    end
    it 'should upload the file and get the data' do
      post '/decode', params: {file: @file}
      expect(response.status).to eq(200)
      expect(response.body).to include("Nature")
    end
  end
end
