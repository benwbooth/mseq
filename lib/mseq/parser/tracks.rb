Module Mseq
    grammar Tracks
        rule track_keyword
            'track'
            space+ 
            track_name:name
        end
        rule track_multi_keyword
            'track'
            space*
            '[' space* track_name:name
            ( space+ track_name:name)*
            space* 
            ']'
        end
        rule track_group_keyword
            'track'
            space*
            '[' space* track_group (space* track_group)* space* ']'
        end
        rule track_group
            group_name:name space* '[' space* 
                (track_name:name / track_group) 
                (space+ (track_name:name / track_group))* 
                space*
            ']'
        end
        rule do_not_affect_clock_operator
            '++'
        end
        rule context
            ('(' expressions ')')+ repeat:pos_int? consume_time:'~'?
        end
        rule bracket_context
            '[' expressions ']' repeat:pos_int? consume_time:'~'?
        end
            
        rule wipe_keyword
            'wipe' space+ track_or_track_group_name:name
        end

    end
end
