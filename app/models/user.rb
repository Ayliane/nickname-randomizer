class User < ApplicationRecord
  validates_uniqueness_of :nickname
  validates :nickname, length: { is: 3 }

  def self.generate_nickname
    already_used_nickname = User.all.pluck(:nickname)
    begin
      nickname = [*('A'..'Z')].sample(3).join
    end while already_used_nickname.include?(nickname)
    User.create!(nickname: nickname)
  end
end
