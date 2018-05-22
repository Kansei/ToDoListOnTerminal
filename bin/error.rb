
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
