classdef Root < replab.lobster.Node
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lobster.Root.Node` -- 
%    - `~+replab.+lobster.Root.add_child` -- 
%    - `~+replab.+lobster.Root.children` -- 
%    - `~+replab.+lobster.Root.creates_scope` -- 
%    - `~+replab.+lobster.Root.enter_scope` -- 
%    - `~+replab.+lobster.Root.exit_scope` -- 
%    - `~+replab.+lobster.Root.process_fragment` -- 
%    - `~+replab.+lobster.Root.render` -- 
%    - `~+replab.+lobster.Root.render_children` -- 
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
%    .. method:: process_fragment
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

  
    methods
        
        function str = render(self, context)
            if nargin < 2
                context = struct();
            end
            
            str = self.render_children(context);
        end        
        
    end
    
end
