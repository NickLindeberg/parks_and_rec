class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.belongs_to :quote, foreign_key: true

      t.timestamps
    end
  end
end
