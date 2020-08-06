class AddPersonIdToHouse < ActiveRecord::Migration[6.0]
  def change
    add_column(:houses, :person_id, :integer, null: false)
  end
end
