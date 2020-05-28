class StudentsController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'students/signup'
        else
            redirect to "/students/#{student.id}" 
        end
    end

    post '/signup' do
        if params[:name] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            @student = Student.create(params)
            session[:user_id] = @student.id 
            redirect to "/students/#{student.id}"
        end
    end
    
    get '/login' do
        if !logged_in?
            erb :'/students/login'
        else
            redirect "/students/#{student.id}"
        end
    end

    post '/login' do
        student = Student.find_by(email: params[:email])
        if student.authenticate(params[:password])
            session[:user_id] = student.id
            redirect "/students/#{student.id}"
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

    get '/students/:id' do
        if logged_in?
            @student = Student.find_by_id(params[:id])
            erb :'students/show'
        else
            redirect to '/login'
        end
    end

    get '/students/:id/edit' do
        if logged_in?
            @student = Student.find_by_id(params[:id])
            if @student.id == params[:id].to_i
              erb :'/students/edit'
            else
                binding.pry
              redirect to '/students'
            end
          else
            redirect to '/login'
          end
    end

    patch '/students/:id' do
        
    end

    delete '/students/:id/delete' do
        
    end

end