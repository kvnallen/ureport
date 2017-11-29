require "csv"

class CsvReportService

  def initialize(script)
    p = { period: 1, name: 2 }
    @command = Script.safe_sql(script.command, p)
  end

  def perform
    results = ActiveRecord::Base.connection.select_all(@command)
    to_csv(results, results.first.keys) if results.present?
  end

  def to_csv (all, attributes)    
     CSV.generate(headers: true, :col_sep => ";",  encoding:  'ISO-8859-1') do |csv|
        csv << attributes
    
        all.each do |user|
          csv << attributes.map { |attr| user[attr] } 
        end       
    end
  end

end