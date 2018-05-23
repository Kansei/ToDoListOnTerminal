#初期化
#listsディレクトリとtodo_list, today_todo_list, done_listの作成
#set.txtの作成
def init(lists_path, set_path)
  Dir.mkdir(lists_path)
  File.open(lists_path+"todo_list.txt","w")
  File.open(lists_path+"today_todo_list.txt","w")
  File.open(lists_path+"done_list.txt","w")

  File.open(set_path,"w") do |f|
    f.puts "todo_list.txt"
  end
end
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

# 指定したリストの中身の確認
def check(list_path)
  list_name = list_path.split("/")[-1].split(".")[0].gsub(/_/," ").upcase

  header = "<><><><><><><> #{list_name} <><><><><><><>"
  footer = "<>"*(header.length/2).to_i
  puts header

  i = 1
  File.open(list_path, "r") do |f|
    tasks = f.readlines
    tasks.each do |task|
      print("   #{i}  #{task}")
      i += 1
    end
  end

  puts footer
end

# 作成したリストの確認
def check_lists(lists_path, set_list_name)
  Dir.open(lists_path) do |dir|
    dir.each do |f|
      set = "  "
      next if '.' == f or '..' == f
      set = "* " if set_list_name == f
      list_name =  f.split(".")[0]
      puts set+list_name
    end
  end
end

#扱うリストをセットする
def set(list_name,lists_path,set_path)
  if File.exist?(lists_path + list_name)
    puts "changed set-file: #{list_name}"
  else
    File.open(lists_path + list_name,"w")
    puts "created and changed set-file: #{list_name}"
  end

  File.open(set_path,"w") do |f|
    f.print list_name
  end
end
