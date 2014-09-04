class CreateListeners < ActiveRecord::Migration
  def change
    create_table :listeners do |t|
      t.string :title
      t.string :url
      t.text :comment
      t.string :image
      t.string :tags

      t.timestamps
    end
  end
end
