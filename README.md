# ToDoListOnTerminal
ToDoの追加、削除、確認、Doneができ、これにより他のソフトウェアを使わずにターミナル上でするべきことの管理ができる。 　　　　

## 初期設定
### エイリアスの登録
todoで実行できるようにエイリアスの登録を行う。
.bashrcに以下のコードを追加。
```
alias todo='ruby ToDoListOnTerminalのパス\
  /bin/todo.rb'
```
### ターミナル起動時に自動でToDoListの表示
.bashrcに以下のコードを追加。
```
todo_check(){
    echo "<><><><><><><>  To Do List  <><><><><><><>"
    cat -n ToDoListOnTerminalのパス/todo_list.txt
    echo "<><><><><><><><><><><><><><><><><><><><><>"
}

todo_check
```
## コマンド
### todo add <追加するタスク>
新規のタスクを追加ができる
### todo delete <削除するタスクのタスク番号>
登録したタスクの削除が行える
### todo check
登録したタスクの確認が行える
### todo done <完了したタスクのタスク番号>
登録したタスクの完了が行える
ToDoListからは消える
### todo done list
完了したタスクの確認が行える
