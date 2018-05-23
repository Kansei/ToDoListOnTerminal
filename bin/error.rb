
def check_argv
  file = $0.split("/")[-1]
  com = file.split(".")[0]
  if ARGV.size < 2
    STDERR.puts "Usage: #{com} add/delete/check/done"
    exit
  end
end

def option_nil?(opt)
  if opt.nil?
    STDERR.puts "Option is not enough."
    exit
  end
end

def is_it_number?(number)
  if !(number =~ /^[1-9]+$/)
    STDERR.puts "Please enter a number."
    exit
  end
end
