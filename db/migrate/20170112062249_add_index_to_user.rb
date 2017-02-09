class AddIndexToUser < ActiveRecord::Migration[5.0]
  def change
	add_index:users,:type
  end
end
