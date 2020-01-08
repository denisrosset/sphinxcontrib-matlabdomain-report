classdef ForNode < replab.lobster.Node
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lobster.ForNode.ForNode` -- 
%    - `~+replab.+lobster.ForNode.Node` -- 
%    - `~+replab.+lobster.ForNode.add_child` -- 
%    - `~+replab.+lobster.ForNode.children` -- 
%    - `~+replab.+lobster.ForNode.creates_scope` -- 
%    - `~+replab.+lobster.ForNode.enter_scope` -- 
%    - `~+replab.+lobster.ForNode.exit_scope` -- 
%    - `~+replab.+lobster.ForNode.lhs` -- 
%    - `~+replab.+lobster.ForNode.process_fragment` -- 
%    - `~+replab.+lobster.ForNode.render` -- 
%    - `~+replab.+lobster.ForNode.render_children` -- 
%    - `~+replab.+lobster.ForNode.rhs` -- 
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: Node
%
%       No documentation
%
%    .. method:: add_child
%
%       No documentation
%
%    .. attribute:: children
%
%       No documentation
%
%    .. attribute:: creates_scope
%
%       No documentation
%
%    .. method:: render_children
%
%       No documentation
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        lhs = ''; 
        rhs = '';
    end
    
    methods 
        function self = ForNode(fragment)
            process_fragment(self, fragment);
            self.creates_scope = true;
        end
        
        function process_fragment(self, fragment)
            matches = regexp(fragment, '^(.*?) in (.*)$', 'tokens');
           
            if length(matches{1}) ~=  2
                error('Lobster:TemplateSyntaxError', ...
                    '<%s> seems like invalid syntax', fragment);
            end
            
            self.lhs = strtrim(matches{1}{1});
            self.rhs = strtrim(matches{1}{2});
        end
        
        function str = render(self, context)
            collection = replab.lobster.eval_with_context(self.rhs, context);
            
            % Ensure that the collection to be iterated over is 1D
            if size(collection, 1) > 1
                mat_size = arrayfun(@num2str, size(collection), 'UniformOutput', false);
                error('Lobster:TemplateSyntaxError', ...
                    'Expected range for ''for'' loop to be an array, instead it was a %s matrix.', strjoin(mat_size, 'x'));
            end                    
                 
            str = '';
            for k = 1:length(collection)
               context.loop_idx__ = k;
               
               if iscell(collection)
                   loop_variable = collection{k};
               else
                   loop_variable = collection(k);
               end
               
               context.(self.lhs) = loop_variable;
               
               new_str = self.render_children(context);
			   % Don't use strcat beacause it silently chops whitespace from the
			   % end of the string.
               str = [str, new_str];
            end
        end
        
        function enter_scope(~)
        end
        
        function exit_scope(~)
        end
            
    end
    
end
