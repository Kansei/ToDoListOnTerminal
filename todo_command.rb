#listの書き込み、削除、Done、確認
#
# todo add "jsndcjn"
#
# todo del タスク番号
#
# todo check
#
# todo done タスク番号
#
# todo done list

# タスクの追加
def add(new_task,list)
  File.open(list, "a") do |f|
    f.puts new_task
  end
end

# タスクの削除
def delete(tsak_num,todo_list)
  delete_task = ""

  File.open(todo_list, "w+") do |f|
    todo_array = f.readlines
    delete_task = todo_array[task_num-1]
    todo_array.delete_at(task_num-1)
    todo_array.each{|todo| f.print(todo)}
  end

  return delete_task
end

# リストの確認
def check(comm,list)

  case comm
  when "check"
    list_name = "  TO DO LIST  "
  when "done"
    list_name = "  DONE LIST   "
  end

  print "<><><><><><><>"
  print list_name
  puts "<><><><><><><>"

  File.open(list, "r") do |f|
    tasks = f.readlines
    tasks.each{|task| print(task)}
  end

  puts "<><><><><><><><><><><><><><><><><><><><><>"
end

def done(task_num,todo_list,done_list)
  done_task = delete(task_num,todo_list)
  add(done_task,done_list)
end
