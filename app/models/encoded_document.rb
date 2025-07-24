# frozen_string_literal: true

class EncodedDocument < ApplicationRecord
    before_save :remove_breaklines

    private

    def remove_breaklines
        self.content = content.delete("\r\n")
    end
end
