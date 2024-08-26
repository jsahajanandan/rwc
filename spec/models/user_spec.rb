require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do
        it 'is valid with valid attributes' do
            user = User.new(first_name: 'John', email: 'john@example.com')
            expect(user).to be_valid
        end

        it 'is not valid without a first name' do
            user = User.new(email: 'john@example.com')
            expect(user).not_to be_valid
        end

        it 'is not valid without an email' do
            user = User.new(first_name: 'John')
            expect(user).not_to be_valid
        end
    end
end