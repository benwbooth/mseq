module Mseq
    grammar Controllers
        rule control_keyword
            'control' space+ control_name:name space+ control_number:pos_int
        end
        rule wheel_keyword
            'wheel' space+ wheel_name:int
        end
        rule aftertouch_keyword
            'aftertouch' space+ name
        end
        rule polyphonic_keyword
            'polyphonic' space+ name
        end

        rule controller_event
            duration? [+-=] value:pos_int
        end
        rule rate_keyword
            'rate' 
            (space+ / (space* '=' space*))
            maximum_rate:pos_int
        end
        rule cchannel_keyword
            'cchannel' space+ midi_channel:pos_int
        end
        rule into_keyword
            'into' space+ track_or_track_group_name:name
        end
        rule min_change_keyword
            'min_change' space+ min_change_value:pos_int
        end
        rule range_keyword
            'range'
            (space+ / (space* '=' space*))
            range_low:int
            space* '->' space*
            range_high:int
        end
        rule maximum_keyword
            'maximum'
            (space+ / (space* '=' space*))
            max_send_value:int
        end
        rule minimum_keyword
            'minimum'
            (space+ / (space* '=' space*))
            min_send_value:int
        end
    end
end
