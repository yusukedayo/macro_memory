class AddUserToQuestons < ActiveRecord::Migration[6.1]
  def up
		add_reference :questions, :user, null: false, index:true, foreign_key: true
	end

	def down
		remove_reference :questions, :user, index:true
	end
end
