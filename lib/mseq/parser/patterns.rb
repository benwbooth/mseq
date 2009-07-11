module Mseq
    grammar Patterns
        rule note_pattern_keyword
            'note_pattern' space+ pattern_name:name 
                space* '{' space* expressions space* '}'
        end
        rule chord_pattern_keyword
            'chord_pattern' space+ pattern_name:name 
                space* '{' space* expressions space* '}'
        end
        rule note_effect_keyword
            'note_effect' space+ effect_name:name 
                space* '{' space* expressions space* '}'
        end
        rule chord_effect_keyword
            'chord_effect' space+ effect_name:name 
                space* '{' space* expressions space* '}'
        end

        rule call_pattern
            pattern_name:name 
            space+ on_duration:duration 
            space+ repeat_duration:duration
        end
        rule end_pattern
            pattern_name:name space+ '0'
        end

        rule pattern_keyword
            'pattern' space+ pattern_name:name space* '['  
                ( '(' space* name space* ')' duration )+ 
                duration space* 
            ']'
        end
    end
end
