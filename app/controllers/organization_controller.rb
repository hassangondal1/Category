class OrganizationController < ApplicationController

    before_action :set_show_resources , only:[:show]
    before_action :set_detail_resources , only:[:detail]

    def new
        @organization = Organization.new
    end

    def create
        unless current_user.category == "student"
                
                @organization = Organization.new(organization_params)
            
                if @organization.save
                    update_user(@organization.id)
                    redirect_to root_path , notice:"Oganization Added sucessfully"
                else
                    flash[:alert] = "Something Went Wrong"
                    render :new
                end


        else
            flash[:alert] = "Student isn't eligible to Add New Organization"
            redirect_to root_path
        end
    end

    def show

    end

    def detail
        
    end 
    def update_user(id)
        current_user.update(organization_id: id)
        
    end
    
    private
    
    def organization_params

        
            params.require(:organization).permit(:name , :address , :contact_no ,:hQ , :category ,:about , :logo )

   
    end

    def set_show_resources
        @organizations = Organization.all
    end
    def set_detail_resources
        @organization = Organization.find(params[:id])
    end
end