require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create(title: 'Hello world!', content: 'My name is Richie.', author_id: 1, team_id: 1)}

  describe '#setup' do

    it 'has a title' do
      expect(post.title).to eq 'Hello world!'
    end

    it 'has content' do
      expect(post.content).to eq 'My name is Richie.'
    end

    it 'has an author id' do
      expect(post.author_id).to eq 1
    end

    it 'has a team id' do
      expect(post.team_id).to eq 1
    end
  end
end
