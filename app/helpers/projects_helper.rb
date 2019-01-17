module ProjectsHelper
	def all_user_ids
       u=User.where.not(id:current_user.id)
       u.ids
	end
	def all_qa_developers
		u=User.where.not(id:current_user.id,user_type:'Manager')
		u.ids
	end
	def all_users
		User.all
	end
	def all_projects
		Project.ids
	end
	def managers_project
		Project.where(owner_id:current_user.id)
	end
	def all_projectid(add_id)
		Project.where(assigned_id:add_id).pluck(:id)
	end
	def project_owner_name(owner_id)
		User.find(owner_id)
	end
	def projects_bug_count(p_id)
		Bug.where(project_id:p_id).count
	end	
	def projectBugs(p_id)
    @bug=Bug.where(project_id:p_id)
    # respond_to do |format|
    #   format.html { redirect_to bugs_path }
    #   format.js
    # end
  end
  def project_name(p_id)
  	project=Project.where(id:p_id).pluck(:title)
  end
end