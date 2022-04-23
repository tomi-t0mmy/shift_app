module Web
  module Controllers
    module Shift
      class Create
        include Web::Action
        expose :l_start

        def call(params)
          shift_repo = ShiftRepository.new
          submit_repo = SubmitRepository.new

          l =  session[:day_list]
          p = session[:period ] == 'true'? true : false
          c = 0

          l.each do |i|
            l_start = params[:shift]["lunch_start_#{i}".to_sym]
            l_finish = params[:shift]["lunch_finish_#{i}".to_sym]
            d_start = params[:shift]["dinner_start_#{i}".to_sym]
            d_finish = params[:shift]["dinner_finish_#{i}".to_sym]
            puts d_start

            if l_start != "" or l_finish != "" or d_start != "" or d_finish != ""
              shift_repo.create(user_id: session[:id], year: session[:year], month: session[:month], day: i, lunch_start: l_start.to_i, lunch_finish: l_finish.to_i, dinner_start: d_start.to_i, dinner_finish: d_finish.to_i)
              c += 1
            end
          end
          if c != 0
            submit_repo.create(user_id: session[:id], year: session[:year], month: session[:month], period: p)
          end

          session[:year] = nil
          session[:month] = nil
          session[:period ] =  nil

          redirect_to '/user'
        end
      end
    end
  end
end
