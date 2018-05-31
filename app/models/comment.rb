class Comment < ApplicationRecord
  belongs_to :post

  validates_presence_of :author
  validates_presence_of :content
  validate :presence_of_two_words_with_two_letters,
           :presence_of_dot_sign,
           :presence_of_each_capitalized_word

  def presence_of_two_words_with_two_letters
    if !self.author.nil?
      words = self.author.split(' ')
      words = words.map { |word| has_two_or_more_letters?(word) }.reject {|x| x == false }
      errors.add(:name, 'has no two words with two letters') unless words.count >= 2
    end
  end

  def presence_of_dot_sign
    if !self.author.nil?
      errors.add(:author, "has no '.'") unless self.author&.include?('.')
    end
  end

  def presence_of_each_capitalized_word
    if !self.author.nil?
      errors.add(:name, 'has no first capitalized word') unless capitalized_each_word?(self.author)
    end
  end

  private

  def capitalized_each_word?(string)
    words = string.split(' ')
    each_word_capitalized = string.split(' ').map { |word| Unicode.capitalize(word) }
    words == each_word_capitalized
  end

  def has_two_or_more_letters?(word)
    word.gsub(/\W+/, '').size >= 2
  end

end
