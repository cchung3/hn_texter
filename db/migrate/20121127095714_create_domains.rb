class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :url
      t.references :user

      t.timestamps
    end
    add_index :domains, :user_id
  end
end
