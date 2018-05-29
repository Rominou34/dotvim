
command! -nargs=* Snoo call GetSubreddit("all")
command! -nargs=* SnooS call GetSubreddit(<f-args>)

" /!\
" @TODO DELETE
" /!\
function! GetMain(...)
	" --- let l:cmd = '%!curl --silent '
	" --- let Callback = function("Echo")

	let l:url = "https://www.reddit.com/r/madeinabyss.json"
	let l:reddit_username = "AyXiit34"

	" --- let l:url = "https://jsonplaceholder.typicode.com/posts/1"
	" --- call snoo#async#get(l:url, Callback)
	" --- let l:cmd .= l:url

	" --- Test buffer
	
	" --- redir => result
	" --- silent execute "%!curl -s ".l:url
	" --- sleep 2000m
	" --- redir END
	" --- redir => result

	let result = system('curl -s '.l:url.' -H "User-Agent: Snoo.vim, used by /u/AyXiit34"')
	sleep 2000m
	if empty(result)
    	echoerr "No output"
  	else
    	call snoo#util#parseSubreddit(result)
    	
    	" --- use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    	" --- tabnew
    	" --- setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    	" --- silent put=result
		" --- syntax keyword testKeyword div
		" --- highlight link testKeyword img
  	endif

	" --- new
	" --- setlocal buftype=nofile
	" --- setlocal noswapfile

	" --- echo "HI"
	" --- :echo l:result
	" --- let json = JSON#parse(l:result)
	" --- for id in json
	"	--- echo id." - "
	" --- endfor
	" --- echo l:result

	call snoo#util#highlight()
endfunction

function! GetSubreddit(...)
	let l:url = "https://www.reddit.com/r/"
	let l:url .= a:1
	let l:url .= ".json"
	let l:reddit_username = "AyXiit34"

	let result = system('curl -s '.l:url.' -H "User-Agent: Snoo.vim, used by /u/'.l:reddit_username.'"')
	sleep 2000m
	if empty(result)
		echoerr "No output"
	else
		call snoo#util#parseSubreddit(result)
	endif

	call snoo#util#highlight()
endfunction
	