class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
      t.string :title
      t.string :url
      t.text :content
      t.datetime :published_at
      t.string :guid
      t.string :author

      t.timestamps
    end
  end
end
