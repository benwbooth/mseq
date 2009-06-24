module Mseq
    grammar Attributes
        rule chord_attribute
            (velocity_attr / octave_attr / chord_transpose_chromatic /
            chord_transpose_diatonic / chord_channel_attr / displace_start /
            displace_end)* duration_expr?
        end

        rule note_attribute
            (velocity_attr / octave_attr / note_transpose_chromatic /
            note_transpose_diatonic / note_channel_attr / displace_start /
            displace_end)* duration_expr?
        end

        rule track_velocity_attr
           '!!' (duration:pos_int? [+-=])? velocity_modifier:pos_int 
        end
        rule velocity_attr
           '!' [+-=]? velocity_modifier:pos_int 
        end
        rule velocity_range_keyword
            'velocity_range'
            (space+ / (space* '=' space*)) 
            minimum:pos_int
            space* '->' space*
            maximum:pos_int
        end
        rule accent_keyword
            'accent' space*
            [+-=] space*
            accent_value:pos_int
        end

        rule track_octave_attr
            '@@' [+-=] octave_modifier:pos_int
        end
        rule octave_attr
            ('@' [+-=] octave_modifier:pos_int) /
            ('@'+)
        end

        rule track_transpose_chromatic
            '##' [+-=] transpose:pos_int
        end
        rule chord_transpose_chromatic
            '#' [+-=] transpose:pos_int
        end
        rule note_transpose_chromatic
            '#' ('\\' [+-=] transpose:pos_int)?
        end
        rule track_transpose_diatonic
            '^^' [+-=] transpose:pos_int
        end
        rule chord_transpose_diatonic
            '^' [+-=] transpose:pos_int
        end
        rule note_transpose_diatonic
            '^' ('\\' [+-=] transpose:pos_int)?
        end

        rule track_channel_attr
            '$$' [+-=] channel:pos_int
        end
        rule chord_channel_attr
            '$' [+-=] channel:pos_int
        end
        rule note_channel_attr
            '$' ([+-=] channel:pos_int)?
        end

        rule shift_keyword
            'shift' space* [+-=]? space* value:pos_int
        end
        rule track_shift_attr
            '>>' [+-=]? value:pos_int
        end

        rule gap_keyword
            'gap' space* [+-=]? space* value:pos_int
        end
        rule track_gap_attr
            '<<' [+-=]? value:pos_int
        end

        rule stretch_keyword
            'stretch' space* [+-=]? space* value:pos_int
        end
        rule track_stretch_attr
            '<>' [+-=]? value:pos_int
        end

        rule squeeze_keyword
            'squeeze' space* [+-=] space* value:pos_int
        end
        rule track_squeeze_attr
            '><' [+-=] value:pos_int
        end

        rule displace_start
            '>' [+-=] value:pos_int
        end
        rule displace_end
            '<' [+-=] value:pos_int
        end

        rule track_duration_attr
            '**' duration_multiplier:duration
        end
        rule duration_expr
            ((duration_expr [+-*] duration_expr) / duration) '.'*
        end

        rule displacement_keyword
            'displacement'
            (space+ / (space* '=' space*))
            duration_expr
        end

        rule break_keyword
            'break' (space+ ('on' / 'off'))?
        end

        rule glissando_attr
            '~' [+-=] value:pos_int
        end

    end
end
