class AddAttachments < ActiveRecord::Migration[5.1]
  def up
    add_attachment :comics, :cover
    add_attachment :publications, :attachment
  end

  def down
    remove_attachment :comics, :cover
    remove_attachment :publications, :attachment
  end
end
