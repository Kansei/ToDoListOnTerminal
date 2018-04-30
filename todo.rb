load_path=File.expand_path("../",__FILE__)
require "#{load_path}/todo_command"

def check_argv
  file = $0.split("/")[-1]
  com = file.split(".")[0]
  if ARGV.size < 2
    STDERR.print "Usage: #{com} add/delete/check/done\n"
    exit
  end
end

def option_nil?(opt)
  if opt.nil?
    STDERR.print "Option is not enough.\n"
    exit
  end
end

def is_it_number?(number)
  if !(number =~ /^[1-9]+$/)
    STDERR.print "Please enter a number.\n"
    exit
  end
end

todo_list = load_path + "/"+"todo_list.txt"
done_list = load_path + "/"+"done_list.txt"

command = ARGV[0]

case command
when "add"
  option_nil?(ARGV[1])
  new_task = ARGV[1]

  add(new_task,todo_list)

  puts "added: #{new_task}"

  check("check",todo_list)
when "delete"
  option_nil?(ARGV[1])
  is_it_number?(ARGV[1])

  task_num = ARGV[1].to_i

  delete_task= delete(task_num,todo_list)

  puts "deleted: #{delete_task}"

  check("check",todo_list)
when "check"
  check(command,todo_list)
when "done"
  option_nil?(ARGV[1])
  opt = ARGV[1]

  if opt == "list"
    check(command, done_list)
  else
    is_it_number?(opt)
    task_num = ARGV[1].to_i
    done_task = done(task_num, todo_list, done_list)

    puts "done: #{done_task}"

    check(command, done_list)
  end
end
