class CreatePortforlios < ActiveRecord::Migration[5.0]
  def change
    create_table :portforlios do |t|
      t.string :title
      t.string :subtitle
      t.txt :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
