class CreateTableScrapes < ActiveRecord::Migration[5.1]
  def change
    create_table :scrapes do |t|
      t.string :url
      t.text :h1, array:true, default: []
      t.text :h2, array:true, default: []
      t.text :h3, array:true, default: []
      t.text :links, array:true, default: []
    end
  end
end
