class StudentsController < ApplicationController

    get '/login' do
        if !logged_in?
            erb :'/students/login'
        else
            redirect to '/courses'
        end
    end

end