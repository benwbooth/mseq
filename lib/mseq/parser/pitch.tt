module Mseq
    grammar Pitch
        rule pitch
            [a-gA-G]
        end
        rule orig_pitch
            '_' pitch
        end

        rule accidental
            '#' / '##' / '###' / '&' / '&&' / '&&&' / '^'
        end
        rule note
            pitch accidental? note_attribute?
        end
        
        rule key_keyword
            'key'
            (space+ / (space* '=' space*))
            pitch [#&]?
        end

        rule w_operator
            [wW] displacement_units:pos_int
        end

        rule h_note
            [hH] transpose:pos_int [+-]?
        end

        rule t_note
            [tT] transpose:pos_int [+-=]?
        end

        rule mode_keyword
            'mode' space+ mode_name:name space* 
                '[' space* (space+ mode_direction:[#&^])? 
                space* mode_note (space+ mode_note)* space* ']'
        end
        rule mode_note
            pitch accidental?
        end

        rule m_note
            [mM] note_number:pos_int [+-]?
        end

        rule mode_transpose
            '^' mode_note
        end

        rule inversion
            'inv' space+ name space* '[' space* int (space+ int) space* ']'
        end

    end
end
