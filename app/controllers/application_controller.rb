require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "student_admin"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!current_student 
      #returns true if the current user is logged in
    end 
    
    def current_student
      @current_student ||= Student.find_by(id: session[:user_id]) if session[:user_id]
      #if current user doesn't exist, then go find it
    end
    
    def logout
      session.clear
      redirect to '/login'
    end
    
    def creation_check
      if @course.student_id != @current_student.id
        redirect to "/courses/#{@course.id}"
      end
    end
    
  end 

end
