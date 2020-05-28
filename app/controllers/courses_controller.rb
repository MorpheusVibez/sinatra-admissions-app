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
      binding.pry
        if logged_in?
            erb :'/courses/new'
          else
            redirect to '/login'
          end
    end

    post '/courses' do
     
        if logged_in?
            if params == ""
              redirect to "/courses/new"
            else
              @courses = current_student.course.build(params)
              if @courses.save
                redirect to "/students/#{@courses.id}"
              else
                
                redirect to "/courses/"
              end
            end 
          else
            redirect to '/login'
          end
        
    end

    get '/courses/:id' do
      
        if logged_in?
            @courses = Course.find_by_id(params[:id])
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