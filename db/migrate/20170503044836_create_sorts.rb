class CreateSorts < ActiveRecord::Migration[5.0]
  def change
    create_table :sorts do |t|

      t.timestamps
    end
  end
end
