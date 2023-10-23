class CreateTraining < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :title
      t.string :youtube_url
      t.string :show
      t.integer :user_id
      t.string :category
      t.timestamps
    end
  end
end
