class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.column :name,  :string, :limit => 30
      t.column :street, :string, :limit => 30
      t.column :zip_code, :integer
      t.column :city, :string, :limit => 30
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
