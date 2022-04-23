module Web
  module Controllers
    module Shift
      class New
        include Web::Action
        expose :year
        expose :month
        expose :period
        expose :day_list

        def call(params)
          if session[:id] == nil
            redirect_to '/session'
          else
            @year = params[:shift][:year]
            @month = params[:shift][:month]
            @period = params[:shift][:store] == 'true' ? '後半' : '前半'

            session[:year] = params[:shift][:year]
            session[:month] = params[:shift][:month]
            session[:period] = params[:shift][:store] == 'true' ? '後半' : '前半'

            first_day_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
            second_day_list = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
            @day_list = params[:shift][:store] == 'true' ? second_day_list : first_day_list

            session[:day_list] = params[:shift][:store] == 'true' ? second_day_list : first_day_list
          end
        end
      end
    end
  end
end
