# class CreatePersons < ActiveRecord::Migration[7.0]

#     def change
#         create_table :people do |t|
#             t.string :name
#             t.integer :house_id

#             t.timestamps
#         end
#     end

# end

class Person < ApplicationRecord

    belongs_to(
        :home
        class_name: 'homes',
        foreign_key: :house_id
        primary_key: :id

    )

end

