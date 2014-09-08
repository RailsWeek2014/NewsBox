class AddListenerToFeedEntries < ActiveRecord::Migration
  def change
    add_reference :feed_entries, :listener, index: true
  end
end
