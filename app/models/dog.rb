class Dog < ApplicationRecord
    has_many :employees

    def employees
        # Go through employees, find the ones where dog_id = self.id
        all_employees = Employee.where(dog_id: self.id)
        employee_names = all_employees.map do |employee|
            "#{employee.first_name} #{employee.last_name}"
        end
        employee_names.join(", ")
    end

    def employee_count
        all_employees = Employee.where(dog_id: self.id)
        all_employees.count
    end

    #Sort dogs by employee_count
    def self.sorted_dogs_by_employee_count
        Dog.order(:employee_count)
    end


    def self.dog_names
        Dog.all.map do |dog|
            dog.name 
        end
    end

    def self.find_dog_id(name)
        dog = Dog.find_by(name: name)
        dog.id
    end
end
