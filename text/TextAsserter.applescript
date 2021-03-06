(*
 * Assserts if theWord is in theString
 * Todo: does this work with partial words ?, if it doesnt create a regexp has match method
 *)
on has_word(the_string, the_word)
	the_word is in (words of the_string)
end has_word
(*
 * Todo: untested
 *)
on has_any_word(the_text, the_words)
	repeat with the_word in the_words
		if (has_word(the_text, the_word)) then
			return true
		end if
	end repeat
	return false
end has_any_word
(*
 * you can also use "is equal to" instead of the equal sign, the opposite is "is not equal to"
 * Note: if you want to log a boolean just add some adition text to the log like: log "toggle: " & false
 *)
on is_equal(a, b)
	return (a = b)
end is_equal
(*
 * Asserts if theText is of class text
 *)
on is_text(the_text)
	if class of the_text = text then
		return true
	else
		return false
	end if
end is_text
(*
 * Example: Asserts if a word is duoble quated: is_wrapped_in("\"abc123\"", "\"")--true
 *)
on is_wrapped_in(the_text, wrapper)
	return (the first character in the_text is wrapper) and (the last character in the_text is wrapper)
end is_wrapped_in