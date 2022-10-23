require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#setup' do
    before do
    end

    context 'should be valid' do
      it 'Userが登録できていること' do
        user = User.new(name: 'Example User', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        expect(user.valid?).to eq true
      end
    end

    context 'name should be present' do
      it 'Userが登録できていないこと' do
        user = User.new(name: ' ', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        expect(user.valid?).to eq false
      end
    end

    context 'email should be present' do
      it 'Userが登録できていないこと' do
        user = User.new(name: 'Example User', email: ' ', password: "foobar", password_confirmation: "foobar")
        expect(user.valid?).to eq false
      end
    end

    context 'name should not be too long' do
      it 'Userが登録できていないこと' do
        user = User.new(name: ' ', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        user.name = "a" * 26
        expect(user.valid?).to eq false
      end
    end

    context 'email should not be too long' do
      it 'Userが登録できていないこと' do
        user = User.new(name: 'Example User', email: ' ', password: "foobar", password_confirmation: "foobar")
        user.email = "a" * 244 + "@example.com"
        expect(user.valid?).to eq false
      end
    end

    context 'email validation should accept valid addresses' do
      it 'Userが登録できていること' do
        user = User.new(name: 'Example User', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user.valid?).to eq true
        end
      end
    end

    context 'email validation should reject invalid addresses' do
      it 'Userが登録できていないこと' do
        user = User.new(name: 'Example User', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user.valid?).to eq false
        end
      end
    end

    context 'email addresses should be unique' do
      it 'Userが登録できていないこと' do
        user = User.new(name: 'Example User', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        duplicate_user = user.dup
        duplicate_user.email = user.email.upcase
        user.save
        expect(duplicate_user.valid?).to eq false
      end
    end

    context 'password should be present (nonblank)' do
      it 'Userが登録できていないこと' do
        user = User.new(name: 'Example User', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        user.password = user.password_confirmation = " " * 6
        expect(user.valid?).to eq false
      end
    end

    context 'password should have a minimum length' do
      it 'Userが登録できていないこと' do
        user = User.new(name: 'Example User', email: 'user@example.com', password: "foobar", password_confirmation: "foobar")
        user.password = user.password_confirmation = "a" * 5
        expect(user.valid?).to eq false
      end
    end

  end
end
