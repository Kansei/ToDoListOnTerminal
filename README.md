# ToDoListOnTerminal
ToDoの追加、削除、確認、Doneができ、これにより他のソフトウェアを使わずにターミナル上でするべきことの管理ができる。　　　
また、ターミナル起動のたびに自動でToDoListの表示を行うことができる。　　　
そのためには、以下のコードを以下のコードを.bashrcや.zshrcに書き込む。　　　
```
todo_check(){
    echo "<><><><><><><>  To Do List  <><><><><><><>"
    cat -n ToDoListOnTerminalのパス/todo_list.txt
    echo "<><><><><><><><><><><><><><><><><><><><><>"
}

todo_check
```
