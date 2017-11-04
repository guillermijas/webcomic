class AddSynopsysToComic < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :synopsis, :text
  end
end
