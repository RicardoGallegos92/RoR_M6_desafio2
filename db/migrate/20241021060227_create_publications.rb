class CreatePublications < ActiveRecord::Migration[7.2]
  def change
    create_table :publications do |t|
      t.string :header
      t.string :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
