# count occurrences of a word

@my_script_name = File.basename($0)

def count(string, my_word)
	num = 0
	string.split(/[^a-zA-Z]/).each do |word|
		num += 1 if word == my_word
	end

	num
end

@ruby_learning = 'http://rubylearning.com'
@chapter3 = 'http://satishtalim.github.com/webruby/chapter3.html'
@text_txt = 'http://rubylearning.com/data/text.txt'

def summarize(url, num_found)
	puts "#{@my_script_name} : found #{num_found} occurrences of the word 'the' from URL #{url}"
end

