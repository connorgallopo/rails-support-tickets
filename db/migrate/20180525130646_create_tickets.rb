class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :body
      t.string :status
      t.integer :user_id
      t.date :due_date
      t.timestamps
    end
  end
end
