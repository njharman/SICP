For fun my coworkers__ and I are watching the SICP videos and doing the releated `6.001 MIT opencourseware`__.  The `Python Version of SICP`__.

__ http://www.mutualmobile.com/company/jobs/
__ http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/
__ http://www-inst.eecs.berkeley.edu/~cs61a/fa11/61a-python/content/www/index.html

These are my solutions to the problems/tests from the book and course.


Install Tools
=============
Ubuntu assumed. ::

  apt-get install mit-scheme rlwrap
  rlwrap scheme -large

rlwrap makes the repl not suck(paren matching, readline like history).

Slimey Vim
----------
Butchered from this__ vim plugin.  ::

  function Send_to_Screen(text)
    if !exists("b:slime")
      call Screen_Vars()
    end
    let escaped_text = substitute(shellescape(a:text), "\\\\\n", "\n", "g")
    call system("screen -S " . b:slime["sessionname"] . " -X stuff " . escaped_text)
  endfunction
  function Screen_Vars()
    if !exists("b:slime")
      let b:slime = {"sessionname": ""}
    end
    let b:slime["sessionname"] = input("session name: ", b:slime["sessionname"], "custom,Screen_Session_Names")
  endfunction

  " send visual selection
  vmap <C-c><C-c> "ry:call Send_to_Screen(@r)<CR>
  " send paragraph under cursor
  nmap <C-c><C-c> vip<C-c><C-c>
  " send whole file
  nmap <F10> :0,$y r<CR>:call Send_to_Screen(@r)<CR>

__ https://github.com/jpalardy/vim-slime/blob/master/plugin/slime.vim


This will starts (in other terminal) the screen session running scheme repl::

  screen -S sicp rlwrap scheme -large


Notes and Things
================
`The Adventures of a Pythonista in Schemeland.`__

__ http://www.phyast.pitt.edu/~micheles/scheme/index.html
