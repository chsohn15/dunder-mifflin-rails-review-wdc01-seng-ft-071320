class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        id = params[:id]
        @employee = Employee.find(id)
    end
end
