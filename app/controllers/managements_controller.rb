class ManagementsController < BaseController
inherit_resources
load_and_authorize_resource #:management, :through => :contract

 respond_to :html, :xml, :json

end
