require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  describe Post do 
  	describe 'validity' do 
  		let(:post) { Post.new }
  		
  		before do
  			post.valid?
  		end

  		it 'requires a user' do
  			post.errors[:user].must_include 'cannot be blank'
  		end

  		it 'requires a title' do 
  			post.errors[:title].must_include 'cannot be blank'
  		end

      it 'requires an artist' do 
        post.errors[:artist].must_include 'cannot be blank'
      end

  		it 'requires a url' do
  			post.errors[:url].must_include 'cannot be blank'
  		end

  		it 'requires the title to be unique for the same user' do
  			existing_post = create(:post)
  			post.title = existing_post.title
  			post.user = existing_post.user
  			post.valid?

  			post.errors[:title].must_include 'has already been taken'
  		end

  		it ' does not require the title to be unique for different users' do
  			existing_post = create(:post)
  			post.title = existing_post.title
  			post.valid?

  			post.errors[:title].wont_include 'has already been taken'
  		end
  	end
  end


end
