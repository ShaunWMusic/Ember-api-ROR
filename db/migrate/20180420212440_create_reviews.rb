class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user
      t.text :body
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
