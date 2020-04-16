# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validates' do
    let(:post) { build(:post, user: create(:user)) }

    it '有効な投稿' do
      expect(post).to be_valid
    end

    it 'ユーザーは必須' do
      post.user = nil
      expect(post).not_to be_valid
    end

    it 'コンテンツは必須' do
      post.content = '    '
      expect(post).not_to be_valid
    end

    it 'コンテンツは140文字まで' do
      post.content = Faker::Lorem.characters(number: 140)
      expect(post).to be_valid
      post.content = Faker::Lorem.characters(number: 141)
      expect(post).not_to be_valid
    end
  end
end
