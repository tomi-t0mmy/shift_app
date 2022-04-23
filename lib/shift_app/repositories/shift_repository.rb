class ShiftRepository < Hanami::Repository
    def find_by_year_month_period(year, month, period)
        if period == 'first'
            shifts.where(year: year,month: month, day: 1...16).call.collection
        else
            shifts.where(year: year,month: month, day: 16...32).call.collection
        end
    end

    def find_by_year_month_day(year, month, day)
        shifts.where(year: year,month: month, day: day).call.collection
    end
end
