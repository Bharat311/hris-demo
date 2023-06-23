class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.jsonb :finch
      t.jsonb :merge
      t.jsonb :apideck
      t.timestamps
    end
  end
end
