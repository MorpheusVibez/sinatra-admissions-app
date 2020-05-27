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
        
    end

    post '/courses' do
        
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