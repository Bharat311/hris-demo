class CreateIntegrations < ActiveRecord::Migration[7.0]
  def change
    create_table :integrations do |t|
      t.belongs_to :organizer
      t.string :uuid
      t.integer :category
      t.string :provider
      t.string :public_token
      t.string :account_token
      t.timestamps
    end
  end
end
