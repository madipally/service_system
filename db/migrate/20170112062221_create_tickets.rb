class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.numeric :created_by
      t.numeric :assigned_to
      t.numeric :closed_by

      t.timestamps
    end
  end
end
