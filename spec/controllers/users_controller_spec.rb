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
        expect{post :create, params: { nickname: username }}.to change{User.count}.by(1)
        expect(response.status).to eq(200)
        expect(response.body).not_to eq('OK')
        expect(response.body).not_to eq('BCA')
        expect(response.body.size).to eq(3)
        expect(response.body).to eq(response.body.upcase)
      end
    end
  end
end
