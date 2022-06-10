class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string     :video_title,       null: false
      t.string     :video_url,         null: false
      t.string     :video_id,          null: false
      t.string     :video_description, null: false
      t.references :shared_by,         null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
