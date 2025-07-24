# frozen_string_literal: true

class Api::V1::EncodedDocumentController < ApplicationController
    def show
        encoded_document = EncodedDocument.first

        if encoded_document
            render json: { document: encoded_document.content }
        else
            render json: { error: "No document found" }, status: :not_found
        end
    end
end
