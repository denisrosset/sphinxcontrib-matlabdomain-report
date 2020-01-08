classdef SignedPermutationVectorAction < replab.Action
% Describes the action of signed permutations on vectors by permuting the coefficients and flipping their signs
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+perm.SignedPermutationVectorAction.G` -- replab.Group: Group acting
%    - `~+replab.+perm.SignedPermutationVectorAction.P` -- replab.Domain: Set acted upon
%    - `~+replab.+perm.SignedPermutationVectorAction.SignedPermutationVectorAction` -- 
%    - `~+replab.+perm.SignedPermutationVectorAction.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+perm.SignedPermutationVectorAction.disp` -- 
%    - `~+replab.+perm.SignedPermutationVectorAction.eq` -- Equality test
%    - `~+replab.+perm.SignedPermutationVectorAction.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+perm.SignedPermutationVectorAction.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+perm.SignedPermutationVectorAction.lambda` -- Constructs an action from a function handle
%    - `~+replab.+perm.SignedPermutationVectorAction.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+perm.SignedPermutationVectorAction.longStr` -- Multi-line description of the current object
%    - `~+replab.+perm.SignedPermutationVectorAction.rightAction` -- Computes the right action of a group element on a set element
%    - `~+replab.+perm.SignedPermutationVectorAction.shortStr` -- Single line text description of the current object
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
        function self = SignedPermutationVectorAction(G)
            assert(isa(G, 'replab.signed.PermutationGroup'));
            d = G.domainSize;
            self.G = G;
            self.P = replab.domain.intAsDoubleMatrix(d, 1, 1, G.domainSize);
        end
        function str = headerStr(self)
            d = self.G.domainSize;
            str = sprintf('Action of signed permutations on vectors of %d elements', d);
        end
        function vec = leftAction(self, signedPerm, vec)
            vec(abs(signedPerm)) = vec .* sign(signedPerm(:));
        end
        function vec1 = rightAction(self, vec, signedPerm)
            perm = abs(signedPerm);
            vec1 = vec(perm);
            vec1 = vec1 .* sign(signedPerm(:));
        end
    end
end
