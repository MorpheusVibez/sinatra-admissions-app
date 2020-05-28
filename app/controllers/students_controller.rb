class StudentsController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'students/signup'
        else
            redirect to '/courses' 
        end
    end

    post '/signup' do
        binding.pry
        if params[:name] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @student = Student.new(name: params[:name], email: params[:email], password: params[:password])
            @student.save
            session[:user_id] = @student.id 
            redirect to '/courses'
        end
    end
    
    get '/login' do
        if !logged_in?
            erb :'/students/login'
        else
            redirect "/courses"
        end
    end

    post '/login' do
        student = Student.find_by(email: params[:email])
        if student.authenticate(params[:password])
            session[:user_id] = student.id
            redirect "/courses"
        else
            redirect "/signup"
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