class AddUserToListeners < ActiveRecord::Migration
  def change
    add_reference :listeners, :user, index: true
  end
end
