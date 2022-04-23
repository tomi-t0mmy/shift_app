module Web
  module Controllers
    module Session
      class Create
        include Web::Action

        def call(params)
          user = UserRepository.new.find_by_email(params[:session][:email])
          if user != nil
            # puts user
            session[:email] = user.email
            session[:password] = user.password
            # session[:u] = user.class

            redirect_to '/user'
          else
            self.status = 401
          end   
        end
      end
    end
  end
end
