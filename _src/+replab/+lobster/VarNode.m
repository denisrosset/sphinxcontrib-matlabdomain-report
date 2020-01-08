classdef VarNode < replab.lobster.Node
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lobster.VarNode.Node` -- 
%    - `~+replab.+lobster.VarNode.VarNode` -- 
%    - `~+replab.+lobster.VarNode.add_child` -- 
%    - `~+replab.+lobster.VarNode.children` -- 
%    - `~+replab.+lobster.VarNode.creates_scope` -- 
%    - `~+replab.+lobster.VarNode.enter_scope` -- 
%    - `~+replab.+lobster.VarNode.exit_scope` -- 
%    - `~+replab.+lobster.VarNode.name` -- 
%    - `~+replab.+lobster.VarNode.process_fragment` -- 
%    - `~+replab.+lobster.VarNode.render` -- 
%    - `~+replab.+lobster.VarNode.render_children` -- 
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
       name = ''; 
    end
    
    methods
        
        function self = VarNode(fragment)
            process_fragment(self, fragment);
        end
        
        function process_fragment(self, fragment)
            self.name = fragment;
        end
        
        function str = render(self, context)
            var = replab.lobster.eval_with_context(self.name, context);
            if ischar(var) && isrow(var)
                str = var;
            elseif ischar(var) && isempty(var)
                str = '';
            else
                str = replab.shortStr(var);
            end
        end
        
    end
    
end
