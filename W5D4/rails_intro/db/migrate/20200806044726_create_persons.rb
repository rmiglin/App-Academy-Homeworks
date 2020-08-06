class CreatePersons < ActiveRecord::Migration[6.0]
  def change
    create_table :persons do |t|
      t.string :person, null: false 
      t.string :house, null: false
    end
  end
end
