require "csv"

class CsvReportService

  def initialize(script)
    @command = Script.safe_sql(script.command, '201713')
  end

  def perform
    results = ActiveRecord::Base.connection.select_all(@command)
    to_csv(results, results[0].keys) if results.present?
  end

  def to_csv (all, attributes)    
     CSV.generate(headers: true, :col_sep => ";",  encoding:  'ISO-8859-1') do |csv|
        csv << attributes
    
        all.each do |user|
          csv << attributes.map do |attr|
             user[attr]
          end
        end       
    end

  end

end