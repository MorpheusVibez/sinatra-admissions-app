class CoursesController < ApplicationController

    get '/courses' do
        if logged_in?
            @course = Course.all
            erb :'/courses/courses'
        else
            redirect to '/login'
        end
    end

    get '/courses/new' do
      @course = Course.all
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
              @course = Course.find_or_create_by(params)
              if @course.student_id == nil
                 @course.student_id = current_student.id
                 @course.save
                 redirect to "/courses/#{@course.id}"
              else
                redirect to "/students/#{@course.student_id}"
              end
            end 
          else
            redirect to '/login'
          end     
    end

    get '/courses/:id' do  
        if logged_in?
          set_course
            erb :'courses/show'
        else
            redirect to '/login'
        end
    end

    get '/courses/:id/edit' do
        set_course
        # binding.pry
        if logged_in?
            creation_check
              erb :'/courses/edit'
        else
            redirect to '/login'
        end
    end

    patch '/courses/:id' do
      if logged_in?
        set_course
        creation_check
        if params[:name] == "" || params[:description] == ""
          redirect to "/courses/#{@course.id}/edit"
        else
            if @course.update(name: params[:name], description: params[:description])
              redirect to "/courses/#{@course.id}"
            else
              redirect to "/courses/#{@course.id}/edit"
            end
        end
      else
        redirect to "/login"
      end
    end

    delete '/courses/:id' do
      if logged_in?
        set_course
        if set_course.student_id == current_student.id
          set_course.delete
        end
        redirect to '/courses'
      else
        redirect to '/'
      end
    end

    private
    
    def set_course
      @course = Course.find(params[:id])
    end

end