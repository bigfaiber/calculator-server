# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::EncodedDocumentController', type: :request do
  describe 'GET /api/v1/encoded_document' do
    context 'when an encoded document exists' do
      let!(:document) { create(:encoded_document, content: 'encoded content') }

      it 'returns the encoded document content' do
        get '/api/v1/encoded_document'

        expect(response).to have_http_status(:ok)
        json = JSON.parse(response.body)

        expect(json).to include('document')
        expect(json['document']).to eq('encoded content')
      end
    end

    context 'when no encoded document exists' do
      it 'returns a 404 with an error message' do
        get '/api/v1/encoded_document'

        expect(response).to have_http_status(:not_found)
        json = JSON.parse(response.body)

        expect(json).to include('error')
        expect(json['error']).to eq('No document found')
      end
    end
  end
end
