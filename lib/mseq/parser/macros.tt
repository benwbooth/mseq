Module Mseq
    grammar Macros
        rule set_keyword
            'set' space+ macro_name:name space* '{' space* macro_definition space* '}'
        end
        rule set_multi_keyword
            'set' space+ '[' space* (macroName:name space* 
                '{' space* macro_definition space* '}' space*)* ']'
        end
        rule macro_definition
            (space* expression space*) / argument
        end
        rule argument
            ('?' [1-9a-z])
        end
        rule call_macro
            '{' macro_name:name space* (',' space* expression )* space* '}'
        end

        rule pick_keyword
            'pick' space+ '[' pick_index? space* macro_name_list space* ']'
        end
        rule pick_index
            decimal / fraction
        end
        rule macro_name_list
            (macro_name:name space+ weight:pos_int)*
        end
        rule seed_keyword
            'seed' space+ value:pos_int
        end
    end
end
