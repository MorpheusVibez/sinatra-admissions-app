class StudentsController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'students/signup'
        else
            redirect to '/courses' 
        end
    end
    
    get '/login' do
        if !logged_in?
            erb :'/students/login'
        else
            redirect to '/courses'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to "/login" 
        else
            redirect to "/"
        end
    end

end