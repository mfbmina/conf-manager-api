class CreateSpeakers < ActiveRecord::Migration[5.2]
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :social_media

      t.timestamps
    end
  end
end
