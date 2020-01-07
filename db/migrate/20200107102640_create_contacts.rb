class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.column :first_name, :string, :limit => 20, :null => false
    	t.column :last_name, :string, :limit => 20, :null => false
    	t.column :email, :string
    	t.column :phone_nbr, :string
      t.column :position, :string, :limit => 20
    	t.column :status, :integer, :null => false
    	t.column :account_id, :integer
    	t.column :lead_id, :integer
      t.timestamps
    end
  end
end
