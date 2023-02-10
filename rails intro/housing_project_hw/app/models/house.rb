# class CreateHouses < ActiveRecord::Migration[7.0]

#     def change
#         create_table :homes do |t|
#             t.string :address
#         end

# end

class House < ApplicationRecord

    has_many(
        :residents,
        class_name: 'person', 
        foreign_key: :house_id,
        primary_key: :id

    )

end