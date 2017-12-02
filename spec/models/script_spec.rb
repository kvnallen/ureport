require 'rails_helper'

RSpec.describe Script, type: :model do
  
  context 'validations' do
    it { should validate_presence_of :name  }
    it { should validate_presence_of :command  }
    it { validate_uniqueness_of(:name).case_insensitive }
  end


  context 'all_params: when sql has no param' do
    before do
      subject.command = "select * from users"
    end

    it 'should return no params' do
      expect(subject.all_params).to match_array []
    end

  end

  context 'all_params: when sql has one param' do
    before do
      subject.command = 'select * from user where id = :name%to_i'
    end

    it 'should get one param' do
      expect(subject.all_params.count).to eq 1
    end

    it 'should get valid param' do
      expect(subject.all_params.first).to eq 'name'
    end

  end

  context 'all_params: when sql has more than one param' do
    before do
      subject.command = 'select * from user where id = :name%to_i'
      subject.command << ' and user = :userName'
    end

    it 'should get two params' do
      expect(subject.all_params.count).to eq 2
    end

    it 'should get valid params' do
      expect(subject.all_params).to match_array ['name', 'userName']
    end
  end

end
