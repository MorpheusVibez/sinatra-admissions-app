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
            erb :'/courses/select_courses'
          else
            redirect to '/login'
          end
    end

    post '/courses' do
        if logged_in?
            if params[:description] == ""
              redirect to "/courses/new"
            else
              @courses = current_user.courses.build(description: params[:description])
              if @courses.save
                redirect to "/courses/#{@courses.id}"
              else
                redirect to "/courses/new"
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
        
    end

    patch '/courses/:id' do
        
    end

    delete '/courses/:id/delete' do
        
    end
end