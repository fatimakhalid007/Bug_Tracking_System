module BugsHelper
 def developersfeature
 	@bugs=Bug.where(assign_id:params[:id],bug_type:'feature')

 end
 def developersbugs
 	@bugs=Bug.where(assign_id:params[:id],bug_type:'bug')
 end
 def developersresolved
 	@bugs=Bug.where(assign_id:params[:id],bug_type:'resolved')
 end
end
