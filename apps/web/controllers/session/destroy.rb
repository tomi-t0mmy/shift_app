module Web
  module Controllers
    module Session
      class Destroy
        include Web::Action

        def call(params)
          session[:id] = nil

          redirect_to '/session'
        end
      end
    end
  end
end
