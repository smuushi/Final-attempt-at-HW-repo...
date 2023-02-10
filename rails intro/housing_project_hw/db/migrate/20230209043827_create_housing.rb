class CreateHousing < ActiveRecord::Migration[7.0]

  def change
        create_table :homes do |t|
            t.string :address
        end
  end
  
end
