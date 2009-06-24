module Mseq
    grammar Text
        rule lyrics
            '"' text:(!'"' . )* '"'
        end
        rule marker_keyword
            'marker' space+ '[' text:(!']' . )* ']'
        end
        rule cue_keyword
            'cue' space+ '[' text:(!']' . )* ']'
        end
        rule text_keyword
            'text' space+ '[' text:(!']' . )* ']'
        end
        rule copyright_keyword
            'copyright' space+ '[' text:(!']' . )* ']'
        end
        rule author_keyword
            'author' space+ '[' text:(!']' . )* ']'
        end
        rule mci_keyword
            'mci' space+ '[' text:(!']' . )* ']'
        end
        rule wave_keyword
            'wave' space+ '[' filename:(!']' . )* ']'
        end

    end
end
