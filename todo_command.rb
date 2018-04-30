# タスクの追加
def add(new_task,list)
  File.open(list, "a") do |f|
    f.puts new_task
  end
end

# タスクの削除
def delete(task_num,todo_list)
  delete_task = ""
  todo_array = []

  File.open(todo_list, "r") do |file|

    todo_array = file.readlines

    delete_task = todo_array[task_num-1]

    if delete_task.nil?
      STDERR.print "The task does not exist\n"
      file.close
      exit
    end

    todo_array.delete_at(task_num-1)
  end

  File.open(todo_list, "w") do |file|
    todo_array.each{|todo| file.print(todo)}
  end

  return delete_task
end

# todoからdoneへのタスクの移動
def done(task_num,todo_list,done_list)
  done_task = delete(task_num,todo_list)
  add(done_task,done_list)

  return done_task
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

  i = 1
  File.open(list, "r") do |f|
    tasks = f.readlines
    tasks.each do |task|
      print("   #{i}  #{task}")
      i += 1
    end
  end

  puts "<><><><><><><><><><><><><><><><><><><><><>"
end
