require 'csv'

desc 'Import companies from CSV file'
task :import => [:environment] do
  filename = "db/companies.csv"
  CSV.foreach(filename, :headers => true) do |row|
      Company.create(
        name: row[0],
        symbol: row[1],
        pr01: row[4],
        pr02: row[5],
        pr04: row[6],
        pr13: row[7],
        pr26: row[8],
        pr03: row[9],
        pr39: row[10],
        pr52: row[11],
        pr_year_to_date: row[12],
        price_current: row[13],
        warranted_price: row[14],
        per_FY1: row[20],
        per_FY2: row[21],
        per_LFY: row[22]
      )
    end
end
