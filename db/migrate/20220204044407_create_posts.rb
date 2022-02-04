class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :published_at
      t.datetime :modified_at
      t.boolean :published, null: false, default: false

      t.timestamps
    end

    add_index :posts, :title, unique: true
  end
end
