class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  # GET /bugs
  # GET /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: 'Bug was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
   creat_id=Bug.where(id:@bug.id).pluck(:add_id)
   users=User.where(id:creat_id).pluck(:user_type)
   user2=User.where(id:creat_id).pluck(:id)
   pro_id=Bug.where(id:@bug_id).pluck(:project_id)
   user1=Project.where(id:pro_id).pluck(:owner_id)
   user1=User.where(id:user1).pluck(:user_type)
  if user1[0]=='Manager'
  @bug.destroy
  respond_to do |format|
    format.html { redirect_to bugs_url, notice: 'Bug was successfully destroyed.' }
    format.json { head :no_content }
  end
  else
  @bug.destroy
  respond_to do |format|
    format.html { redirect_to qabugsfeatures_path(user2[0]), notice: 'Bug was successfully destroyed.' }
    format.json { head :no_content }
  end
end


  end  
  def allfeatures
    @bugs=Bug.where(bug_type:'feature')  
  end
  def allbugs
    @bugs=Bug.where(bug_type:'bug')
  end
  def resolvedBugs
    @bugs=Bug.where(bug_status:'resolved',bug_type:'bug')
  end
  def unresolvedBugs
    @bugs=Bug.where(bug_type:'bug',bug_status:'unresolved')
  end
  def unAssignBugs
    @bugs=Bug.where(bug_type:'bug',assign_id:nil)
  end
  def newbug
    @bugs=Bug.where(bug_type:'bug',bug_status:'new')

  end
  def inprogressfeature
    @bugs=Bug.where(bug_type:'feature',bug_status:'in progress')
  end
  def assignfeature
    @bugs=Bug.where.not(assign_id:nil,bug_type:'bug')
  end
    def resolvedfeature
    @bugs=Bug.where(bug_status:'resolved',bug_type:'feature')
  end
  def unresolvedfeature
    @bugs=Bug.where(bug_type:'feature',bug_status:'unresolved')
  end
  def unAssignfeature
    @bugs=Bug.where(bug_type:'feature',assign_id:nil)
  end
  def newfeature
    @bugs=Bug.where(bug_type:'feature',bug_status:'new')

  end
  def inprogressBugs
    @bugs=Bug.where(bug_type:'feature',bug_status:'in progress')
  end
  def assignBugs
    @bugs=Bug.where.not(assign_id:nil,bug_type:'bug')
  end
  def developersfeature
    @bugs=Bug.where(assign_id:params[:id],bug_type:'feature')
  end
  def developersbugs
    @bugs=Bug.where(assign_id:params[:id],bug_type:'bug')
  end
  def developersresolved
    @bugs=Bug.where(assign_id:params[:id],bug_type:'resolved')
  end
  def developersprojects
    proj_ids=Bug.where(assign_id:params[:id]).pluck(:project_id)
    @projects=Project.where(id:proj_ids)
  end
  def qabugsfeatures
    @bugs=Bug.where(add_id:params[:id])
  end
  def qaunresolvedbugs
     @bugs=Bug.where(add_id:params[:id],bug_status:'unresolved')
  end
  def qaresolvedbugs
     @bugs=Bug.where(add_id:params[:id],bug_status:'resolved')
  end
  def qanewbugs
     @bugs=Bug.where(add_id:params[:id],bug_status:'new')
  end
  def qainprogressbugs
     @bugs=Bug.where(add_id:params[:id],bug_status:'in progress')

  end


  helper_method:qaunresolvedbugs
  helper_method:qaresolvedbugs
  helper_method:qainprogressbugs
  helper_method:qanewbugs
  helper_method:qabugs
  helper_method:developersprojects
  helper_method:developersbugs
  helper_method:developersresolved
  helper_method:developersfeature
  helper_method:assignfeature
  helper_method:unAssignfeature
  helper_method:newfeature
  helper_method:inprogressfeature
  helper_method:resolvedfeature
  helper_method:unresolvedfeature
  helper_method:unresolvedBugs
  helper_method:unAssignBugs
  helper_method:newbug
  helper_method:inprogressBugs
  helper_method:assignBugs
  helper_method:resolvedBugs
  helper_method:allbugs
  helper_method:allfeatures
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_params
      params.require(:bug).permit(:bug_title, :bug_description, :bug_deadline, :bug_type, :bug_status, :add_id, :assign_id, :project_id,:screenshot)
    end
end
