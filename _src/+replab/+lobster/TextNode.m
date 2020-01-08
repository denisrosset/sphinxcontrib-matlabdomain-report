classdef TextNode < replab.lobster.Node
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lobster.TextNode.Node` -- 
%    - `~+replab.+lobster.TextNode.TextNode` -- 
%    - `~+replab.+lobster.TextNode.add_child` -- 
%    - `~+replab.+lobster.TextNode.children` -- 
%    - `~+replab.+lobster.TextNode.creates_scope` -- 
%    - `~+replab.+lobster.TextNode.enter_scope` -- 
%    - `~+replab.+lobster.TextNode.exit_scope` -- 
%    - `~+replab.+lobster.TextNode.process_fragment` -- 
%    - `~+replab.+lobster.TextNode.render` -- 
%    - `~+replab.+lobster.TextNode.render_children` -- 
%    - `~+replab.+lobster.TextNode.text` -- 
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
       text = ''; 
    end
    
    methods
        
        function self = TextNode(fragment)
            process_fragment(self, fragment);
        end
        
        function process_fragment(self, fragment)
            self.text = fragment;
        end
        
        function str = render(self, ~)
           str = self.text; 
       end
       
    end
    
end
