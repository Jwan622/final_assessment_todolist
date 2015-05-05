class ChangeColumnOfList < ActiveRecord::Migration
  def change
    change_column :lists, :status, :string, :default => "unarchived"
  end
end
