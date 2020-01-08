classdef PermutationMatrixAction < replab.Action
% Describes the action of permutations on square matrices by simultaneous permutations of rows and columns
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+perm.PermutationMatrixAction.G` -- replab.Group: Group acting
%    - `~+replab.+perm.PermutationMatrixAction.P` -- replab.Domain: Set acted upon
%    - `~+replab.+perm.PermutationMatrixAction.PermutationMatrixAction` -- 
%    - `~+replab.+perm.PermutationMatrixAction.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+perm.PermutationMatrixAction.disp` -- 
%    - `~+replab.+perm.PermutationMatrixAction.eq` -- Equality test
%    - `~+replab.+perm.PermutationMatrixAction.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+perm.PermutationMatrixAction.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+perm.PermutationMatrixAction.lambda` -- Constructs an action from a function handle
%    - `~+replab.+perm.PermutationMatrixAction.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+perm.PermutationMatrixAction.longStr` -- Multi-line description of the current object
%    - `~+replab.+perm.PermutationMatrixAction.rightAction` -- Computes the right action of a group element on a set element
%    - `~+replab.+perm.PermutationMatrixAction.shortStr` -- Single line text description of the current object
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
        function self = PermutationMatrixAction(G)
            assert(isa(G, 'replab.PermutationGroup'));
            d = G.domainSize;
            self.G = G;
            self.P = replab.domain.intAsDoubleMatrix(d, d, 1, G.domainSize);
        end
        function str = headerStr(self)
            d = self.G.domainSize;
            str = sprintf('Action of permutations on %d x %d matrices', d, d);
        end
        function M = leftAction(self, perm, M)
            M(perm, perm) = M;
        end
        function M = rightAction(self, M, perm)
            M = M(perm, perm);
        end
    end
end
