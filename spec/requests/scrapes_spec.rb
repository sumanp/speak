require 'rails_helper'

RSpec.describe 'Speak API', type: :request do
  let!(:scrapes) { create_list(:scrape, 10) }

  describe 'GET /scrapes' do
    before { get '/scrapes' }

    it 'returns scraped content' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'POST /scrapes' do
    let(:valid_attributes) { { url: "http://instarter.com" } }

    context 'when the request is valid' do
      before { post '/scrapes', params: valid_attributes }

      it 'creates a scrape request' do
        expect(json['url']).to eq('http://instarter.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'When the request is invalid' do
      before { post '/scrapes', params: { h1: 'hey' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Url can't be blank/)
      end
    end
  end

end
