class CreatePositionsSetups < ActiveRecord::Migration[5.0]
  def change
    create_table :positions_setups do |t|
      t.references :position, foreign_key: true
      t.references :setup, foreign_key: true
    end
  end
end
