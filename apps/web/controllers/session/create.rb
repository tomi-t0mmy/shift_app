module Web
  module Controllers
    module Session
      class Create
        include Web::Action

        def call(params)
          user = UserRepository.new.find_by_email(params[:session][:email])
          if user != nil
            if user.password == params[:session][:password]
              session[:id] = user.id
              redirect_to '/user'
            else
              redirect_to '/session'
            end
          else
            redirect_to '/session'
          end   
        end
      end
    end
  end
end
