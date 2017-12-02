require 'rails_helper'

RSpec.describe CsvReportService do
  let!(:script) { create(:script) } 
  let!(:scripts) { create_list(:script, 2) }
  let(:csv) do
    csv = CsvReportService.new(script, script_params).perform
  end

  context 'running without params' do
    before { script.command = 'SELECT * FROM scripts' }
    let(:script_params) {  { } }
    
    it 'should return valid csv' do
        expect(csv).to include script.name
        expect(csv).to include scripts.first.name
        expect(csv).to include scripts.second.name
    end
  end

  context 'filtering by text param' do
    before { script.command = 'SELECT * FROM scripts where name = :name' }
    let(:script_params) {  {:name => script.name} }

    it 'should generate csv header' do
      expect(csv).to include 'name;description'
    end

    it 'should filter by string param' do
      expect(csv).to include script.name
    end

  end

  context 'filtering by date param' do
    before { script.command = 'SELECT * FROM scripts where created_at = :created_at' }
    let(:script_params) {  {:created_at => script.created_at} }

    it 'should return one script' do
      expect(csv).to include script.name
    end
  end

  context 'filtering by int param' do
    before { script.command = 'SELECT * FROM scripts where id = :id' }
    let(:script_params) {  {:id => script.id} }

    it 'should return one script' do
      expect(csv).to include script.name
    end
  end

end
