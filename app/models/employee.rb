class Employee < ApplicationRecord
    belongs_to :dog

    validates_uniqueness_of :alias, :message =>"This alias is already taken. Please create a unique alias."
    validates_uniqueness_of :title, :message =>"This job title is already taken. Please create a unique title."

    def display_name
        self.first_name + " " + self.last_name
    end


end
