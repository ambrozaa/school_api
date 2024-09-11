class AddAuthTokenToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :auth_token, :string
  end
end
