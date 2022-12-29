class ProgramController < ApplicationController
    before_action :set_resources , only:[:show] 
    before_action :set_detail_resources , only:[:detail]
    before_action :set_users , only:[:add_user_to_program]
    
    def new
        @program = Program.new 
    end
    
    def create
       unless current_user.category == "student"
            @program = current_user.programs.new(program_params)
            if(@program.save)
                redirect_to root_path , notice: "Program Created Sucessfully"
            else
                flash[:alert] = "Something went wrong"
                render :new   
            end
        else
            flash[:alert] = "Student isn't eligible to Add New Program"
            redirect_to root_path
        end
    end

    def show
        
    end

    def detail
        
    end
    def add_user_to_program
        if current_user.category == school
            
        end

    end

    private

    def program_params
        params.require(:program).permit(:user_id , :title , :description , :synopsis , :about , :start_date, :end_date)
    end

    def set_resources
        @programs = Program.all
    end

    def set_detail_resources
        @program = Program.find(params[:id])
    end

    def set_users
        @users = User.all
    end

end