# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EncodedDocument, type: :model do
  describe 'runs callback to clean the encoded base64 string' do
    it 'removes breaklines before saving' do
      doc = EncodedDocument.create!(content: "Line1\r\nLine2\nLine3\r\n")

      expect(doc.content).to eq("Line1Line2Line3")
    end
  end
end
