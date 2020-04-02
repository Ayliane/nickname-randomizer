RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:nickname) }
end
