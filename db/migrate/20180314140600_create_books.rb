class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.date :publish_date
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
