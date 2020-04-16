# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    let(:user) { build(:user) }

    it '有効なユーザー' do
      expect(user).to be_valid
    end

    it 'ユーザーネームは必須' do
      user.username = '    '
      expect(user).not_to be_valid
    end
  end
end
