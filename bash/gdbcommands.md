# GDB cheatsheet

- basics

| Command       | Description                           |
| --------------| ------------------------------------- |
| run           | Start the program                     |
| c             | Continue                              |
| fin           | Finish current function call and stop |
| n             | Next                                  |
| s             | Step into function                    |
| break main:23 | Break at line number                  |
| break func    | Break at function                     |

- print outs 

| Command          | Description                   | 
| ---------------- | ----------------------------- |
| p                | Print variable                |
| what             | whatis type of variable       |
| display          | Print variable every time     |
| undisplay        | Stop displaying variable      |
| watch            | Print when variable changes   |
| bt               | Print stack trace (backtrace) |
| info args        | Print function arguments      |
| info locals      | Print local variables         |
| info breakpoints | Print breakpoints             |
| list             | show lines near               |

- navigating and breakpoint management 

| Command          | Description                    | 
| ---------------- | ------------------------------ |
| up               | Move up the stack              |
| down             | Move down the stack            |
| delete           | Delete breakpoint/ watchpoint  |
| disable          | Disable breakpoint/ watchpoint |
| enable           | Enable breakpoint              |
| clear            | Clear breakpoint               |
| info breakpoints | Print breakpoints              |

- TUI 

| Command     | Description      |
| ----------- | ---------------- | 
| tui enable  | Enable TUI       |
| layout src  | Show source code |
| layout next | Show next layout |

- advanced

| Command            | Description       |
| ------------------ | ----------------  | 
| target record-full | record ERYTING    |
| rn                 | reverse next      |
| rs                 | reverse step      |
| rc                 | reverse continue  |
| set var            | reassign variable |
 

<br>
- eg

```bash
break main
break main.rs:10
break main.rs:main
break main.rs:10 if n == 5
set var x = 15 
```

