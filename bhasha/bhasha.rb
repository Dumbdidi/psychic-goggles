class Language
  def initialize(language)
    @words = language
  end

  def combinations(max_length, min_length = 1)
    combos = Array.new
    @words.each { |word| combos.push word if (min_length..max_length).include? word.length }

    begin
      keep_going = false
      new_words = Array.new
      combos.each do |combo|
        @words.each do |word|
          w = combo + word
          if ((min_length..max_length).include? w.length) and not combos.include? w
            keep_going = true
            new_words.push w
          end
        end
      end
      combos += new_words
    end while keep_going

    combos.uniq.sort { |a, b| (a.length <=> b.length) != 0 ? a.length <=> b.length : a <=> b }
  end
end
