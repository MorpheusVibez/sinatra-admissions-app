class StudentsController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'students/signup'
        elsif logged_in?
            student = session[:user_id]
            redirect to "/students/#{student.id}" 
        end
    end

    post '/signup' do
        if params[:name] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        else
            student = Student.create(params)
            session[:user_id] = student.id
            # binding.pry
            redirect to "/students/#{student.id}"
        end
    end
    
    get '/login' do
        if !logged_in?
            erb :'/students/login'
        else 
            redirect "/students/#{current_student.id}"
        end
    end

    post '/login' do
        # binding.pry
        student = Student.find_by(email: params[:email])
        # if student == nil
        #     redirect "/signup"
        # else 
        #     student.authenticate(params[:password])
        #     session[:user_id] = student.id
        #     redirect "/students/#{student.id}"
        # end
        if student && student.authenticate(params[:password])
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
            set_student
            erb :'students/show'
        else
            redirect to '/login'
        end
    end

    get '/students/:id/edit' do
        if logged_in?
            set_student
            if @student.id == params[:id].to_i
              erb :'/students/edit'
            else
              redirect to '/signup'
            end
          else
            redirect to '/login'
          end
    end

    patch '/students/:id' do
        if logged_in?
            set_student
            if params[:name] == "" || params[:email] == ""
              redirect to "/students/#{@student.id}/edit"
            else
                set_student
              #@student = session[:user_id]
                if @student.update(name: params[:name], email: params[:email])
                  redirect to "/students/#{@student.id}"
                else
                  redirect to "/students/#{@student.id}/edit"
                end
            end
        else
            redirect to "/login"
        end
    end

    delete '/students/:id' do
        if logged_in?
            set_student
            if set_student.id == current_student.id
              set_student.delete
            end
            redirect to '/'
          else
            redirect to '/login'
          end
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end


end