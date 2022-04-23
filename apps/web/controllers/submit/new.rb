module Web
  module Controllers
    module Submit
      class New
        include Web::Action

        def call(params)
          if session[:id] == nil
            redirect_to '/session'
          end
        end
      end
    end
  end
end
