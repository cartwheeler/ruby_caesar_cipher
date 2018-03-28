text = gets.chomp
x = gets.chomp.to_i

def transform(l, x)
	low_letters = ('a'..'z').to_a
	low1 = low_letters.map { |e| e.ord  }
	low2 = low1.map { |e| (e+x) < 123 ? (e+=x) : (e=e+x-26) }
	low3 = Hash[low_letters.zip low2]
	capital_letters = ('A'..'Z').to_a
	capital1 = capital_letters.map { |e| e.ord  }
	capital2 = capital1.map { |e| (e+x) < 91 ? (e+=x) : (e=e+x-26) }
	capital3 = Hash[capital_letters.zip capital2]
	transform = low3.merge(capital3)
	transform.has_key?(l) ?	transform[l].to_i.chr : l
end

def caesar_cipher(text, x)
	letters = text.chars
		letters.each do |e|
			e.replace transform(e, x)
			end
		caesar_text = letters.join("")
	return caesar_text
end

puts caesar_cipher(text, x)

# caesar_cipher("What a string!", 5)

# should return: "Bmfy f xywnsl!"