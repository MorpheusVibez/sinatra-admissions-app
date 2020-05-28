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
            if @courses && @courses.user_id == current_student.id
              erb :'/courses/edit'
            else
              redirect to '/courses'
            end
          else
            redirect to '/login'
          end
    end

    patch '/courses/:id' do
      if logged_in?
        @courses = Course.find_by_id(params[:id])
        if params[:name] == "" || params[:description] == ""
          redirect to "/courses/#{@courses.id}/edit"
        else
          @courses = Course.find_by_id(params[:id])
          # binding.pry
            if @courses.update(name: params[:name], description: params[:description])
              redirect to "/courses/#{@courses.id}"
            else
              redirect to "/courses/#{@courses.id}/edit"
            end
        end
      else
        redirect to "/login"
      end
    end

    delete '/courses/:id/delete' do
      binding.pry
      if logged_in?
        @courses = Course.find_by_id(params[:id])
        if @student == current_student and @courses = @courses
          @courses.delete
        end
        redirect to '/signup'
      else
        redirect to '/login'
      end
    end
end