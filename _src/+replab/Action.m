classdef Action < replab.Str
% A group action describing the action of a group on a set
%
% Elements of the group `G` act upon elements of type `P`.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Action.G` -- replab.Group: Group acting
%    - `~+replab.Action.P` -- replab.Domain: Set acted upon
%    - `~+replab.Action.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Action.disp` -- 
%    - `~+replab.Action.eq` -- Equality test
%    - `~+replab.Action.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Action.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Action.lambda` -- Constructs an action from a function handle
%    - `~+replab.Action.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.Action.longStr` -- Multi-line description of the current object
%    - `~+replab.Action.rightAction` -- Computes the right action of a group element on a set element
%    - `~+replab.Action.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        G % replab.Group: Group acting
        P % replab.Domain: Set acted upon
    end
    
    methods 
        
        %% Abstract methods
        
        function p1 = leftAction(self, g, p)
        % Computes the left action of a group element on a set element
        %
        % Returns the left action, often denoted by ``p1 = g(p)`` of G over P, 
        % which is compatible with group composition as in:
        %
        % `` p2 = g(h(p)) = (g compose h)(p) ``
        %
        % Args:
        %   g (element of `self.G`): Group element acting
        %   p (element of `self.P`): Element acted upon
        %
        % Returns:
        %   element of `self.P`: Result of the left action
            error('Abstract');
        end
        
        %% Default implementations
        
        function p1 = rightAction(self, p, g)
        % Computes the right action of a group element on a set element
        %
        % Returns the right action, often denoted ``p1 = p^g``, 
        % compatible with the group composition as in
        %
        % ``p2 = (p^g)^h = p^(g compose h)``
        %
        % Args:
        %   p (element of `self.P`): Element acted upon
        %   g (element of `self.G`): Group element acting
        %
        % Returns:
        %   element of `self.P`: Result of the right action
            p1 = self.leftAction(self.G.inverse(g), p);
        end

    end
    
    methods (Static)
        
        function action = lambda(header, G, P, leftActionFun)
        % Constructs an action from a function handle
        %
        % Args:
        %   G (`replab.Group`): Group acting
        %   P (`replab.Domain`: Set acted upon
        %   leftActionFun (function_handle): Handle implementing `leftAction`
        %
        % Returns:
        %   replab.Action: The action
            action = replab.lambda.Action(header, G, P, leftActionFun);
        end
        
    end
    
end
