module UsersHelper
	def all_developers
		@user=User.where(user_typ=='Developer')
	end
	def all_QA
		@user=User.where(user_type=='Quality Assurance')
	end
end
