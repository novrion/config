export PS1="\w$ "

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function lg() {
	lazygit
}

function t() {
	date +"%H:%M:%S (%Y-%m-%d)"
}

# ort + pdfium
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/libonnxruntime.so:/usr/lib/libpdfium.so
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib

export __GL_MaxFramesAllowed=1
