class User < ApplicationRecord
  validates_uniqueness_of :nickname
  validates :nickname, length: { is: 3 }

  def self.generate_nickname
    begin
      nickname = [*('A'..'Z')].sample(3).join
    end while User.exists?(nickname: nickname)
    User.create!(nickname: nickname)
  end
end
