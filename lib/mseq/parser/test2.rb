  start :keyword do
    match(name) do |a| 
      if a == 'start'
        @pos -= 1
        @rules[:test].parse
      else
        a
      end
    end
  end
  rule :test do
    match('start') do |a|
      'end'
    end
  end
