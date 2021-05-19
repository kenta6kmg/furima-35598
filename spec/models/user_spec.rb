require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe"ユーザー新規登録"
    context '新規登録できるとき' do
    it 'email,password,password_confirmation,nickname,last_name,first_name,ruby_last,ruby_first,birthが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'nicknameが空だと保存できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに＠が含まれていないと登録できない' do
      @user.email = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以下だと登録できない' do
      @user.password = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが半角数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password_confirmationが存在してもpasswordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it 'first_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it 'ruby_lastは、全角（カタカナ）でないと登録できない' do
      @user.ruby_last = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Ruby last is invalid. Input full-width katakana characters.")
    end
    it 'ruby_firstは、全角（カタカナ）でないと登録できない' do
      @user.ruby_first = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Ruby first is invalid. Input full-width katakana characters.")
    end
    it '生年月日が空だと登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end

