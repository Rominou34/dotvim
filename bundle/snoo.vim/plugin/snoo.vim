
command! -nargs=* Snoo call GetMain(<f-args>)

function! Echo(res) abort
	echo a:res
endfunction

function! GetMain(...)
	"let l:cmd = '%!curl --silent '
	let Callback = function("Echo")
	let l:url = "https://rominou.moe"
	" call snoo#async#get(l:url, Callback)
	" let l:cmd .= l:url

	" Test buffer
	
	" redir => result
	" silent execute "%!curl -s ".l:url
	" sleep 2000m
	" redir END

	" redir => result
	let result = system("curl -s ".l:url)
	sleep 2000m
	if empty(result)
    	echoerr "no output"
  	else
    	" use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    	tabnew
    	setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    	silent put=result
  	endif

	" new
	" setlocal buftype=nofile
	" setlocal noswapfile

	" echo "HI"
	" :echo l:result
	" let json = JSON#parse(l:result)
	"for id in json
	"	echo id." - "
	" endfor
	" echo l:result
endfunction