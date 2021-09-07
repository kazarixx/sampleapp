class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      #カラムの定義
          t.string :title
          t.string :body
      t.timestamps
    end
  end
end
