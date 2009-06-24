module Mseq
    grammar Sysex
        rule sysex_keyword
            'sysex' space+ sysex_name:name space* 
                '[' space* sysex_definition+ 
                    (space+ sysex_definition) space* ']'
        end
        rule sysex_definition
            hex / ascii / decimal_number / shift_op / xs / xe / fi
        end
        rule hex
            [a-fA-F] [0-9]
        end
        rule ascii
            "$" (!"$" . )* "$"
        end
        rule decimal_number
            '#' pos_int
        end
        rule shift_op
            '+' pos_int
        end
        rule xs
            'xs'
        end
        rule xe
            'xe'
        end
        rule fi
            'fi' space+ (('"' filename:(!'"' . ) '"') / 
                (filename:(!(space / ']') . )))
        end
    end
end
