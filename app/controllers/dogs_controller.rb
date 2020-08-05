class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def show
        id = params[:id]
        @dog = Dog.find(id)
    end
end
