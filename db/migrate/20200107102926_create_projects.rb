class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.column :name, :string, :limit => 30, :null => false
    	t.column :description, :text, :limit => 50
    	t.column :phase, :integer, :null => false
    	t.column :target_sales, :decimal, :precision => 8, :scale => 2
    	t.column :realized_sales, :decimal, :precision => 8, :scale => 2
    	t.column :schedule, :date
    	t.column :user_id, :integer
    	t.column :account_id, :integer
    	t.column :contact_id, :integer
    	t.column :lead_id, :integer
      t.timestamps
    end
  end
end
