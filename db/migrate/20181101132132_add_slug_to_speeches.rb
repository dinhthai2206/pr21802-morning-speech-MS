class AddSlugToSpeeches < ActiveRecord::Migration[5.2]
  def change
    add_column :speeches, :slug, :string
    add_index :speeches, :slug
  end
end
