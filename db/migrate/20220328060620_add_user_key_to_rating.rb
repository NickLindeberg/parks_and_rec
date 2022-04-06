class AddUserKeyToRating < ActiveRecord::Migration[6.1]
  def change
    change_table :ratings do |t|
      t.belongs_to :user, foreign_key: true  
    end
  end
end
