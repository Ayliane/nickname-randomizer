RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:nickname) }
  it { should validate_length_of(:nickname).is_equal_to(3) }
end
