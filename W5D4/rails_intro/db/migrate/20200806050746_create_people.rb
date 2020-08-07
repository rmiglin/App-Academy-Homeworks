class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :house, null: false
    end
  end
end
