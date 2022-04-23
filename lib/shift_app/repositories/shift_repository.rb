class ShiftRepository < Hanami::Repository
    def find_by_id_year_month_day(id,year, month, day)
            shifts.where(id: id, year: year,month: month, day: day).one
    end

    def find_by_year_month_day(year, month, day)
        shifts.where(year: year,month: month, day: day).call.collection
    end
end
