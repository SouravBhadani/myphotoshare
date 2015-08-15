class AddSlugToPrettylink < ActiveRecord::Migration
  def change
    add_column :prettylinks, :slug, :string
  end
end
