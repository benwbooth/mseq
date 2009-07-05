class RDParser
  attr_accessor :pos
  attr_accessor :input_pos
  attr_accessor :lex_token_stack
  attr_reader :rules

  def initialize(&block)
    @lex_token_stack = [[]]
    @rules = {}
    @start = nil
    instance_eval(&block)
  end

  def parse(string)
    @tokens = []
    @input = string
    @pos = 0
    @input_pos = 0
    @max_pos = 0
    @expected = []
    result = @start.parse
    if @input_pos != @input.length
      raise "Parse error. expected: '#{@expected.join(', ')}', found '#{@tokens[@max_pos]}'"
    end
    return result
  end

  def next_token
    @pos += 1

    token=nil
    @lex_token_stack.last.any? do |tok|
      match = tok.pattern.match(@input[@input_pos, @input.length-@input_pos])
      if match
        @input_pos += match.end(0)
        token = tok.block.call(match.to_s) if tok.block
        true
      else
        false
      end
    end
    return token
  end

  def expect(tok)
    t = next_token
    if @pos - 1 > @max_pos
      @max_pos = @pos - 1
      @expected = []
    end
    return t if tok === t
    @expected << tok if @max_pos == @pos - 1 && !@expected.include?(tok)
    return nil
  end

  private

  LexToken = Struct.new(:pattern, :block)

  def token(pattern, &block)
    @lex_token_stack.last << LexToken.new(Regexp.new('\\A(?:' + pattern.source + ')', pattern.options), block)
  end

  def start(name, &block)
    rule(name, &block)
    @start = @rules[name]
  end

  def rule(name)
    @current_rule = Rule.new(name, self)
    @rules[name] = @current_rule
    yield
    @current_rule = nil
  end

  def match(*pattern, &block)
    @current_rule.add_match(pattern, block)
  end

  class Rule
    Match = Struct.new :pattern, :block

    def initialize(name, parser)
      @name = name
      @parser = parser
      @matches = []
      @lrmatches = []
    end

    def add_match(pattern, block)
      match = Match.new(pattern, block)
      if pattern[0] == @name
        pattern.shift
        @lrmatches << match
      else
        @matches << match
      end
    end

    def parse
      match_result = try_matches(@matches)
      return nil unless match_result
      loop do
        result = try_matches(@lrmatches, match_result)
        return match_result unless result
        match_result = result
      end
    end

    private

    def try_matches(matches, pre_result = nil)
      match_result = nil
      start = @parser.pos
      start_input = @parser.input_pos
      matches.each do |match|
        r = pre_result ? [pre_result] : []
        match.pattern.each do |token|
          if @parser.rules[token]
            r << @parser.rules[token].parse
            unless r.last
              r = nil
              break
            end
          else
            nt = @parser.expect(token)
            if nt
              r << nt
            else
              r = nil
              break
            end
          end
        end
        if r
          if match.block
            match_result = match.block.call(*r)
          else
            match_result = r[0]
          end
          break
        else
          @parser.pos = start
          @parser.input_pos = start_input
        end
      end
      return match_result
    end
  end
end

