class RemoveColumnFromEvent < ActiveRecord::Migration[6.0]
  def change
    remove_columns :events, :title, :location
  end
end
