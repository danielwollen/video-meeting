class Shorturl < ApplicationRecord
  before_create :set_access_token

  private

  def set_access_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = Array.new(8){[*"A".."Z"].sample}.join
      break token unless Shorturl.where(token: token).exists?
    end
  end
end
