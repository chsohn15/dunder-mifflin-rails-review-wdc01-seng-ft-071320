class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        id = params[:id]
        @employee = Employee.find(id)
    end

    def new
        @employee = Employee.new
    end

    def create
        first = params[:employee][:first_name]
        last = params[:employee][:last_name]
        alias1 = params[:employee][:alias]
        title1 = params[:employee][:title]
        office1 = params[:employee][:office]
        dog_id1 = Dog.find_dog_id(params[:employee][:dog])
        img_url1 = params[:employee][:img_url]
        employee = Employee.create(first_name: first, last_name: last, alias: alias1, office: office1, title: title1,
        dog_id: dog_id1, img_url: img_url1)
        if !employee.valid?
            if employee.errors[:alias].any?
                #flash[:notice] = "The alias #{employee.errors.details[:alias][0][:value]} is already taken."
                flash[:notice] = "#{employee.errors.messages[:alias][0]}"
            elsif employee.errors[:title].any?
                flash[:notice] = "#{employee.errors.messages[:title][0]}"
            end
            redirect_to new_employee_path
        else
            redirect_to employee_path(employee)
        end
    end



    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        first = params[:employee][:first_name]
        last = params[:employee][:last_name]
        alias1 = params[:employee][:alias]
        title1 = params[:employee][:title]
        office1 = params[:employee][:office]
        dog_id1 = Dog.find_dog_id(params[:employee][:dog])
        img_url1 = params[:employee][:img_url]
        @employee.update(first_name: first, last_name: last, alias: alias1, office: office1, title: title1,
        dog_id: dog_id1, img_url: img_url1)
        redirect_to employee_path(@employee)
    end
end
