require 'rails_helper'

RSpec.describe Script, type: :model do
  
  context 'all_params: when sql has no param' do
    
    it 'should return no params' do

    end

  end

  context 'all_params: when sql has one param' do
    before do
      subject.command = 'select * from user where id = :name'
    end

    it 'should get one param' do
      expect(subject.all_params.count).to eq 1
    end

    it 'should get valid param' do
      expect(subject.all_params.first[0]).to eq ':name'
    end

  end

  context 'all_params: when sql has more than one param' do
    it 'should get two params' do
      subject.command = 'select * from user where id = :name'
      subject.command << ' and user = :userName'
      expect(subject.all_params.count).to eq 2
    end
  end

end
