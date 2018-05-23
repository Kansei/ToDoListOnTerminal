load_path=File.expand_path("../",__FILE__)
require "#{load_path}/todo_command"
require "#{load_path}/error"

lists_path = load_path + "/../lists/"
set_path = load_path+"/set.txt"
set_list_path = ""

File.open(set_path,"r") do |f|
  set_list_path = lists_path + f.read.chomp
end

command = ARGV[0]
case command
when "add"
  option_nil?(ARGV[1])
  new_task = ARGV[1]
  add(new_task,set_list_path)

  puts "added: #{new_task}"

  check(set_list_path)
when "delete"
  option_nil?(ARGV[1])
  is_it_number?(ARGV[1])
  task_num = ARGV[1].to_i
  delete_task= delete(task_num,set_list_path)

  puts "deleted: #{delete_task}"

  check(set_list_path)

when "check"
  if ARGV[1].nil?
    check(set_list_path)
  else
    list_name = ARGV[1]+".txt"
    check(lists_path+list_name)
  end

when "lists"
  set_list_name = set_list_path.split("/")[-1]
  check_lists(lists_path,set_list_name)

when "done"
  set_list_name = set_list_path.split("/")[-1]

  exit unless set_list_name.include?("todo")

  done_list_path = lists_path + "/done_list.txt"

  option_nil?(ARGV[1])
  is_it_number?(ARGV[1])
  task_num = ARGV[1].to_i

  done_task = done(task_num, set_list_path, done_list_path)

  puts "done: #{done_task}"

  check(done_list_path)

when "set"
  option_nil?(ARGV[1])
  set_list_name = ARGV[1]+".txt"

  set(set_list_name,lists_path, set_path)
end
