classdef PermutationVectorAction < replab.Action
% Describes the action of permutations on vectors by permuting the coefficients
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+perm.PermutationVectorAction.G` -- replab.Group: Group acting
%    - `~+replab.+perm.PermutationVectorAction.P` -- replab.Domain: Set acted upon
%    - `~+replab.+perm.PermutationVectorAction.PermutationVectorAction` -- 
%    - `~+replab.+perm.PermutationVectorAction.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+perm.PermutationVectorAction.disp` -- 
%    - `~+replab.+perm.PermutationVectorAction.eq` -- Equality test
%    - `~+replab.+perm.PermutationVectorAction.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+perm.PermutationVectorAction.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+perm.PermutationVectorAction.lambda` -- Constructs an action from a function handle
%    - `~+replab.+perm.PermutationVectorAction.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+perm.PermutationVectorAction.longStr` -- Multi-line description of the current object
%    - `~+replab.+perm.PermutationVectorAction.rightAction` -- Computes the right action of a group element on a set element
%    - `~+replab.+perm.PermutationVectorAction.shortStr` -- Single line text description of the current object
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
        function self = PermutationVectorAction(G)
            d = G.domainSize;
            assert(isa(G, 'replab.PermutationGroup'));
            self.G = G;
            self.P = replab.domain.intAsDoubleMatrix(d, 1, 1, G.domainSize);
        end
        function str = headerStr(self)
            d = self.G.domainSize;
            str = sprintf('Action of permutations on vectors of %d elements', d);
        end
        function vec1 = leftAction(self, perm, vec)
            vec1(perm) = vec;
            vec1 = vec1(:);
        end
        function vec1 = rightAction(self, vec, perm)
            vec1 = vec(perm);
        end
    end
end
