class AddColumnToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :status, :integer, after: :priority
  end
end
