class UsersController < BaseController
   inherit_resources
   load_and_authorize_resource #:skip_authorization_check #:user, :through => :contract 
    #before_filter :everypage
   respond_to :html, :xml, :json
 
 def index
   @users = User.page(params[:page]).all
   
 end
   # 
   # def index  
   #   #if can? :everything, @contract
   #   @user = current_user
   #   @pd = @user
   #  
   # # else
   # #  redirect_to :root
   # # end
   # end
   # 
   # def edit
   #    @usercurrent = current_user
   #    @pd = @user
   # end
   # 
   # def show
   #    @pd = @user
   # end
end