require File.dirname(__FILE__)+'/rdparser'
require File.dirname(__FILE__)+'/ast'

parser = RDParser.new do
  s = /[\t\r\n ]*/
  sp = /[\t\r\n ]+/
  names = {}

  start :score do
    match(s, :exprs) do |_, exprs|
      Score.new(*exprs)
    end
  end

  rule :exprs do
    match() do |first_expr|
      exprs = []
      while (expr = @rules[:expr].parse) do
        exprs << expr
      end
      exprs
    end
  end

  rule :expr do
    match(:term, s) do |term|
      term
    end
  end

  rule :term do
    match(:comment) { |m| m }
    match(:name) { |m| m }
  end

  rule :comment do
    match(/'(.*?)(?:'|(?:\r?\n)|\Z)/) do |comment|
      Comment.new(comment[0])
    end
  end

  rule :name do
    match(/[[:alpha:]]+/u) do |name|
      if names[name] 
        back_up
        @rules[names[name]].parse
      else
        back_up
        @rules[:notes].parse
      end
    end
  end

  rule :notes do
    match() do 
      notes = []
      while (note = @rules[:note].parse)
        notes << note
      end
      if notes.length >= 1
        Notes.new(*notes)
      else
        nil
      end
    end
  end

  rule :note do
    match(/[a-gA-G]/) do |note|
      Note.new(note)
    end
  end
end

# tests
puts parser.parse('A B EFG  \'This is a comment \' cd e')

