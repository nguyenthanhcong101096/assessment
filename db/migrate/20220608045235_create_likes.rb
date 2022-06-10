class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :video, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true
      t.integer    :type,  null: false

      t.timestamps
    end

    add_index :likes, %i[user_id video_id], unique: true
  end
end
