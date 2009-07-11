require File.dirname(__FILE__) + '/rdparser'
require File.dirname(__FILE__) + '/ast'

parser = RDParser.new do
  s = /[\t\r\n ]*/
  sp = /[\t\r\n ]+/
  names = {}

  start :score do
    match(s, :exprs) do |_, exprs|
      Score.new(exprs)
    end
  end

  rule :exprs do
    match(:expr, s) do |first_expr, _|
      exprs = [first_expr]
      while (expr = @parser.rules[:expr].parse) do
        exprs << expr
      end
      exprs
    end
  end

  rule :expr do
    match(:comment) do
    end
    match(:name) do
    end
  end

  rule :comment do
    match(/'(.*?)(?:'|(?:\r?\n))/) do |comment|
      Comment.new(comment)
    end
  end

  rule :name do
    match(/[[:alpha:]]+/u) do |name|
      if names[name] 
        @parser.rules[names[name]].parse
      else
      end
    end
  end
  

  instance_eval(File.open('attributes.rb').read)
  instance_eval(File.open('controllers.rb').read)
  instance_eval(File.open('macros.rb').read)
  instance_eval(File.open('patterns.rb').read)
  instance_eval(File.open('pitch.rb').read)
  instance_eval(File.open('sequences.rb').read)
  instance_eval(File.open('sysex.rb').read)
  instance_eval(File.open('text.rb').read)
  instance_eval(File.open('time.rb').read)
  instance_eval(File.open('tracks.rb').read)
end

