module Mseq
    grammar Sequences
        rule copy_keyword
            'copy' space+ '[' space* 
                track_name:name 
                ( (space+ start_time:('1' / mbt / smpte)
                    (space+ end_time:(mbt / smpte))?) /
                  ([+-=~] extract_duration:duration) 
                )?
                (space+ filter)*
                space* ']' repeat_count:pos_int?
        end
        rule filter_type
            'duration' / 'diatonic' / 'chromatic' / 'pitch' / 
                'channel' / 'velocity' / 'interval'
        end
        rule fixed_filter
            filter_type 'fixed' value:int
        end
        rule timed_filter
            filter_type 'timed' space* '[' space* sequence:name space* ']'
        end
        rule sequenced_filter
            filter_type 'sequenced' 
                ((space+ number_in_seq:pos_int)? 
                    '(' space* (space+ vector:pos_int)+ space* ')' )? 
                space* '[' space* sequence:name space* ']'
        end
    end
end
