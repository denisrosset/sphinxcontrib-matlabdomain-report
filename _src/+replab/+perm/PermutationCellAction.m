classdef PermutationCellAction < replab.Action
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+perm.PermutationCellAction.G` -- replab.Group: Group acting
%    - `~+replab.+perm.PermutationCellAction.P` -- replab.Domain: Set acted upon
%    - `~+replab.+perm.PermutationCellAction.PermutationCellAction` -- 
%    - `~+replab.+perm.PermutationCellAction.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+perm.PermutationCellAction.disp` -- 
%    - `~+replab.+perm.PermutationCellAction.eq` -- Equality test
%    - `~+replab.+perm.PermutationCellAction.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+perm.PermutationCellAction.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+perm.PermutationCellAction.lambda` -- Constructs an action from a function handle
%    - `~+replab.+perm.PermutationCellAction.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+perm.PermutationCellAction.longStr` -- Multi-line description of the current object
%    - `~+replab.+perm.PermutationCellAction.rightAction` -- Computes the right action of a group element on a set element
%    - `~+replab.+perm.PermutationCellAction.shortStr` -- Single line text description of the current object
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
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Action.lambda`
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

    methods
        function self = PermutationCellAction(G, P)
            d = G.domainSize;
            assert(isa(G, 'replab.PermutationGroup'));
            self.G = G;
            self.P = P;
        end
        function C1 = leftAction(self, perm, C)
            C1 = C;
            C1(perm) = C;
        end
        function C1 = rightAction(self, C, perm)
            C1 = C(perm);
        end
    end
end
