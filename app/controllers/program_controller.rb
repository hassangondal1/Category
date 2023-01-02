class ProgramController < ApplicationController
    before_action :set_resources , only:[:show] 
    before_action :set_detail_resources , only:[:detail]
    before_action :set_users , only:[:add_program_user]
    
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
    def add_program_user
        @program_user = ProgramUser.new
    end
    def add_program_user_create
        @program_user = ProgramUser.new
        if current_user.category == "school"
           if ProgramUser.create(user_id:params[:program_user][:user_id]  , program_id:params[:program_user][:program_id])
                redirect_to root_path , notice:"Successfully Enrolled User To Program"
           end
        else
            redirect_to root_path , alert:"You aren't eligible to Enroll User"
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
        @programusers = ProgramUser.where(program_id: params[:id])
    end

    def set_users
        @users = User.all
        @programs = Program.all
    end

end