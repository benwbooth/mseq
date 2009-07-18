class Score
  attr_reader :exprs

  def initialize(*exprs)
    @exprs = exprs
  end

  def to_s
    'Score['+@exprs.to_s+']'
  end
end

class Comment
  attr_reader :comment

  def initialize(comment)
    @comment = comment
  end

  def to_s
    'Comment['+@comment.to_s+']'
  end
end

class Notes
  attr_reader :notes

  def initialize(*notes)
    @notes = notes
  end

  def to_s
    'Notes['+@notes.to_s+']'
  end
end

class Note
  attr_reader :note
  
  def initialize(note)
    @note = note
  end

  def to_s
    'Note['+@note.to_s+']'
  end
end

