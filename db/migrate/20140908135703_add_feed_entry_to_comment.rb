class AddFeedEntryToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :feed_entry, index: true
  end
end
