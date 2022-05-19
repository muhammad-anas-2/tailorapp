class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :serial_no
      t.string :phone
      t.string :type_name
      t.string :arm
      t.string :shoulder
      t.string :arm_hole
      t.string :neck_line
      t.string :chest
      t.string :waist
      t.string :skirt
      t.string :shalwar
      t.string :paincha
      t.text :description
      t.string :front
      t.string :side
      t.string :hip
      t.string :collar_ban
      t.string :cuff
      t.string :plate

      t.timestamps
    end
  end
end
