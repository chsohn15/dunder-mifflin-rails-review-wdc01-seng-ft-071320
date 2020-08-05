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
end
