class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :user_id
      t.integer :director
      t.integer :release_date
    end
  end
end
