class CreateEncodedDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :encoded_documents do |t|
      t.text :content

      t.timestamps
    end
  end
end
