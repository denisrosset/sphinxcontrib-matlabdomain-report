classdef CallNode < replab.lobster.Node
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lobster.CallNode.CallNode` -- 
%    - `~+replab.+lobster.CallNode.Node` -- 
%    - `~+replab.+lobster.CallNode.add_child` -- 
%    - `~+replab.+lobster.CallNode.children` -- 
%    - `~+replab.+lobster.CallNode.creates_scope` -- 
%    - `~+replab.+lobster.CallNode.enter_scope` -- 
%    - `~+replab.+lobster.CallNode.exit_scope` -- 
%    - `~+replab.+lobster.CallNode.expression` -- 
%    - `~+replab.+lobster.CallNode.process_fragment` -- 
%    - `~+replab.+lobster.CallNode.render` -- 
%    - `~+replab.+lobster.CallNode.render_children` -- 
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
%    .. method:: enter_scope
%
%       No documentation
%
%    .. method:: exit_scope
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
       expression = ''; 
    end
    
    methods
        function self = CallNode(fragment)
            process_fragment(self, fragment);
        end
        
        function process_fragment(self, fragment)
            self.expression = strtrim(fragment);
        end
        
        function str = render(self, context)
            str = replab.lobster.eval_with_context(self.expression, context);
            
            if ~ischar(str)
                error('Lobster:CallError', ...
                    'The output of <%s> was not a string.', self.expression);
            end
        end
    end
    
end