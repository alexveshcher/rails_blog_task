class Post < ApplicationRecord
  belongs_to :category
  has_many :comments

  validates_presence_of :name
  validate :presence_of_two_words_with_two_letters,
           :presence_of_dot_sign,
           :presence_of_first_capitalized_word

  def presence_of_two_words_with_two_letters
    if !self.name.nil?
      words = self.name.split(' ')
      words = words.map { |word| has_two_or_more_letters?(word) }.reject {|x| x == false }
      errors.add(:name, 'has no two words with two letters') unless words.count >= 2
    end
  end

  def presence_of_dot_sign
    if !self.name.nil?
      errors.add(:name, "has no '.'") unless self.name&.include?('.')
    end
  end

  def presence_of_first_capitalized_word
    if !self.name.nil?
      errors.add(:name, 'has no first capitalized word') unless capitalized?(self.name)
    end
  end

  private

  def capitalized?(string)
    filtered_string = string.gsub(/\W+/, '')
    filtered_string[0] == Unicode.capitalize(filtered_string[0])
  end

  def has_two_or_more_letters?(word)
    word.gsub(/\W+/, '').size >= 2
  end

end
