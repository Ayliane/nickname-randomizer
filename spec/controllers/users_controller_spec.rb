RSpec.describe UsersController, type: :controller do

  context 'With valid input' do
    describe 'When nickname is available' do
      let(:username) { 'ABC' }

      it 'should return ok and save nickname to database' do
        post :create, params: { nickname: username }
        expect(response.status).to eq(200)
        expect(response.body).to eq('OK')
        expect(User.last.nickname).to eq(username)
      end
    end

    describe 'When nickname already exists in database' do
      let(:username) { 'BCA' }

      before do
        User.create!(nickname: 'BCA')
      end

      it 'should return a new nickname' do

      end
    end
  end

  context 'With invalid input' do
    describe 'When nickname is longer than 3 characters' do
      it 'should return unauthorized' do

      end
    end

    describe 'When nickname is shorter than 2 characters' do
      it 'should return unauthorized' do

      end
    end

    describe 'When nickname includes unauthorized characters' do
      it 'should return unauthorized' do

      end
    end
  end
end
