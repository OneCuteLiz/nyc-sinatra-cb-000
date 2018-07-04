class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |ft|
      ft.integer :title_id
      ft.integer :figure_id
    end
  end
end
