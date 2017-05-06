class CreatePositionsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :positions_users do |t|
      t.references :position, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
