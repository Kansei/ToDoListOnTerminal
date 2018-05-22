# ToDoListOnTerminal
ToDoの追加、削除、確認、Doneができ、これにより他のソフトウェアを使わずにターミナル上でするべきことの管理ができる。 
もう、todoに限らず自由にリストを作成することができる。

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
    cat -n ToDoListOnTerminalのパス/today_todo_list.txt
    echo "<><><><><><><><><><><><><><><><><><><><><>"
}

todo_check
```
## コマンド
### todo set <操作するリスト名>
これから扱うリストを指定する。
指定したリストが存在していなかった場合は新規で作成する。
### todo lists
存在するリストの一覧を表示する。
### todo add <追加するタスク>
setしたリストに新規のタスクを追加できる
### todo delete <削除するタスクのタスク番号>
登録したタスクの削除が行える
### todo check <リスト名>
指定したリストで登録したタスクの確認が行える
引数を指定しない場合はsetされているリストのタスクを確認できる
### todo done <完了したタスクのタスク番号>
登録したタスクの完了が行える
ToDoListからは消える
todoという単語が存在するリストでのみ使用可
