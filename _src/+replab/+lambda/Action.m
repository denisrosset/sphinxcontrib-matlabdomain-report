classdef Action < replab.Action
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lambda.Action.Action` -- 
%    - `~+replab.+lambda.Action.G` -- replab.Group: Group acting
%    - `~+replab.+lambda.Action.P` -- replab.Domain: Set acted upon
%    - `~+replab.+lambda.Action.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+lambda.Action.disp` -- 
%    - `~+replab.+lambda.Action.eq` -- Equality test
%    - `~+replab.+lambda.Action.header` -- 
%    - `~+replab.+lambda.Action.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+lambda.Action.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+lambda.Action.lambda` -- Constructs an action from a function handle
%    - `~+replab.+lambda.Action.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+lambda.Action.leftActionFun` -- 
%    - `~+replab.+lambda.Action.longStr` -- Multi-line description of the current object
%    - `~+replab.+lambda.Action.rightAction` -- Computes the right action of a group element on a set element
%    - `~+replab.+lambda.Action.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. attribute:: G
%
%       Documentation in :attr:`+replab.Action.G`
%
%    .. attribute:: P
%
%       Documentation in :attr:`+replab.Action.P`
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
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Action.lambda`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: rightAction
%
%       Documentation in :meth:`+replab.Action.rightAction`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        header
        leftActionFun
    end
    
    methods
        
        function self = Action(header, G, P, leftActionFun)
            self.header = header;
            self.G = G;
            self.P = P;
            self.leftActionFun = leftActionFun;
        end
        
        function str = headerStr(self)
            str = self.header;
        end
        
        function names = hiddenFields(self)
            names = replab.str.uniqueNames( ...
                hiddenFields@replab.Action(self), ...
                {'header'} ...
                );
        end
    
        function p1 = leftAction(self, g, p)
            f = self.leftActionFun;
            p1 = f(g, p);
        end
        
    end
    
end
