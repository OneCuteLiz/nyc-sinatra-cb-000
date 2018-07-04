class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |l|
      l.string :name 
      l.integer :figure_id
      l.integer :year_completed
    end
  end
end
