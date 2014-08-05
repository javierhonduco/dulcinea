class Word < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true

  def to_s
    word
  end

end
