class CoursesController < ApplicationController

    get '/courses' do
        if logged_in?
            @courses = Course.all
            erb :'/courses/courses'
        else
            redirect to '/login'
        end
    end

    get '/courses/new' do
      
        if logged_in?
            erb :'/courses/new'
          else
            redirect to '/login'
          end
    end

    post '/courses' do
      
        if logged_in?
            if params == {name: "", description: ""}
              redirect to "/courses/new"
            else
              binding.pry
              @course = Course.new(params)
              if @course.save
                @course.user_id = current_student.id
                @course.save
                redirect to "/courses/#{@course.id}"
              else
                
                redirect to "/students/#{@course.user_id}"
              end
            end 
          else
            redirect to '/login'
          end
        
    end

    get '/courses/:id' do
      
        if logged_in?
            @course = Course.find_by_id(params[:id])
            erb :'courses/show'
        else
            redirect to '/login'
        end
    end

    get '/courses/:id/edit' do
        if logged_in?
            @courses = Course.find_by_id(params[:id])
            if @courses && @courses.user_id == current_student
              erb :'/courses/edit'
            else
              redirect to '/courses'
            end
          else
            redirect to '/login'
          end
    end

    patch '/courses/:id' do
        
    end

    delete '/courses/:id/delete' do
        
    end
end