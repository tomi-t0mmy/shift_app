module Web
  module Controllers
    module Shift
      class Index
        include Web::Action
        expose :shifts
        expose :year
        expose :month
        expose :period

        def call(params)
          user = UserRepository.new.find(session[:id])
          if !user.admin
            redirect_to '/user'
          else
            year = params[:shift][:year]
            month = params[:shift][:month]
            period = params[:shift][:store] == 'true' ? 'second' : 'first'

            @year = year
            @month = month
            @period = params[:shift][:store] == 'true' ? '後半' : '前半'

            repo = ShiftRepository.new
            first_day_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
            second_day_list = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
            day_list = params[:shift][:store] == 'true' ? second_day_list : first_day_list

            a = Array.new(31)

            day_list.each do |i|
              shift =repo.find_by_year_month_day(year, month, i)
              tmp = []
              if shift != nil
                shift.each do |s|
                  user = UserRepository.new.find(s.user_id)
                  tmp.push([user.last_name, s.lunch_start, s.lunch_finish, s.dinner_start, s.dinner_finish])
                end
              end
              a[i-1] = tmp
            end

            @shifts = a
          end
        end
      end
    end
  end
end

