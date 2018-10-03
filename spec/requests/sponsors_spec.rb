# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sponsors endpoint', type: :request do
  let!(:speakers) { create_list(:sponsor, 10, :with_logo) }

  describe 'GET /sponsors' do
    # make HTTP get request before each example
    before { get '/sponsors' }

    it 'returns 10 sponsors' do
      expect(json).not_to be_empty
      expect(json['sponsors'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /sponsors' do
    # valid payload
    let(:valid_attributes) do
      { name: 'XING',
        website: 'https://xing.com',
        tier: 1,
        logo: fixture_file_upload(
          Rails.root.join('spec', 'support', 'assets', 'test-avatar.png'), 'image/png'
        ) }
    end

    context 'when the request is valid' do
      before { post '/sponsors', params: valid_attributes }

      it 'creates a sponsor' do
        expect(json['sponsor']['name']).to eq('XING')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/sponsors', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Website can't be blank, Tier can't be blank/)
      end
    end
  end
end
