Module Mseq
    grammar Time
        rule meter_keyword
            'meter' 
            (space+ / (space* '=' space*)) 
            beats_per_measure:pos_int 
            '/' 
            beats_per_whole_note:pos_int
        end
        rule tempo_keyword
            'tempo'
            (space+ / (space* [+-=] space*))
            beats_per_minute:decimal
        end
        rule ppq_keyword
            'ppq'
            (space+ / (space* '=' space*)) 
            value:pos_int
        end

        rule smpte_keyword
            'smpte'
            (space+ / (space* '=' space*)) 
            frames_per_second:pos_int
            (space+ 'drop')?
        end
        rule list_smpte_keyword
            'list_smpte'
        end
        rule smpte_offset_keyword
            'smpte_offset' smpte_time:smpte
        end

        rule time
            smpte / mbt
        end
        rule smpte
            (((hours:pos_int ';')? 
                minutes:pos_int ';')? 
                    seconds:pos_int )? 
                        ';' frames:pos_int
        end
        rule mbt
            measures:pos_int 
                (':' beats:pos_int 
                    (':' ticks:pos_int)?)?
        end

        rule barline
            '|-' / ('|' [+-=]? time)
        end
        rule restart_keyword
            'restart'
        end
        rule time_keyword
            'time' space+ name
        end

        rule mbt_duration
            ((measures:pos_int)? 
                ':' beats:pos_int)? 
                    ':' ticks:pos_int
        end
        rule duration
            fraction / decimal / mbt_duration / smpte
        end
        rule duration_keyword
            'duration'
            (space+ / (space* '=' space*)) 
            new_duration_unit:duration
        end

        rule displacement_keyword
            'displacement'
            (space+ / (space* '=' space*)) 
            new_displ_unit:duration
        end
        rule cursor_keyword
            'cursor'
        end
    end
end
