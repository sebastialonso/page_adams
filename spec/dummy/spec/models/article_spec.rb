require 'faker'

RSpec.describe Article, type: :model do
  context 'once Paginator module is included' do
    it 'should have Paginator has an ancestor' do
      expect(Article.ancestors).to include Paginator
    end

    it 'should have `page` as a public method' do
      expect(Article.public_methods).to include :page
    end
  end

  describe 'Method' do

    before :each do
      40.times do |n|
        Article.create title: Faker::Book.title
      end
    end

    describe '.page' do
      it 'should return a hash' do
        expect(Article.page 1).to be_kind_of Hash
      end

      it 'should return a hash with three keys' do
        pagination = Article.page 1
        expect(pagination.keys.count).to eq 3 
      end

      it 'should return a hash with keys :total_pages, :records, :current_pages' do
        pagination = Article.page 1
        expect(pagination.keys).to contain_exactly :total_pages, :records, :current_page
      end

      describe 'returns a hash which' do
        let(:pagination)  { Article.page 1 }

        before :each do
          pagination
        end

        it 'should have a collection of Articles under :records key' do
          expect(pagination[:records]).to be_kind_of ActiveRecord::Relation
        end

        it 'should have an integer under :total_pages key' do
          expect(pagination[:total_pages]).to be_kind_of Integer
        end

        it 'should have an integer under :current_page key' do
          expect(pagination[:current_page]).to be_kind_of Integer
        end
      end

      context 'when nil parameter is supplied' do
        let(:pagination) { Article.page nil }

        before :each do
          pagination
        end

        it 'should return 1 as current page' do
          expect(pagination[:current_page]).to eql 1  
        end

        it 'should return elements for page 1' do
          expect(pagination[:records]).to be_kind_of ActiveRecord::Relation
          expect(pagination[:records].count).to eql 10
        end

      end

      context 'when non-integer parameter is supplied' do
        let(:pagination) { Article.page SecureRandom.hex 101 }
        
        before :each do
          pagination
        end

        it 'should return 1 as current page' do
          expect(pagination[:current_page]).to eql 1  
        end

        it 'should return elements for page 1' do
          expect(pagination[:records]).to be_kind_of ActiveRecord::Relation
          expect(pagination[:records].count).to eql 10
        end                
      end
    end
  end
end
