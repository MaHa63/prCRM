class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.column :description, :text
    	t.column :reason, :integer
    	t.column :state, :integer
    	t.column :account_id, :integer
    	t.column :user_id, :integer
    	t.column :open, :datetime
    	t.column :closed, :datetime
      t.timestamps
    end
  end
end
