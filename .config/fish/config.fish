if status --is-login
	if test -z "$DISPLAY"
		exec startx
	end
end

set fish_greeting
