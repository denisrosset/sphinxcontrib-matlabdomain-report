classdef SignedPermutationMatrixAction < replab.Action
% Describes the action of signed permutations on square matrices by simultaneous permutations of rows and columns and sign flips
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+perm.SignedPermutationMatrixAction.G` -- replab.Group: Group acting
%    - `~+replab.+perm.SignedPermutationMatrixAction.P` -- replab.Domain: Set acted upon
%    - `~+replab.+perm.SignedPermutationMatrixAction.SignedPermutationMatrixAction` -- 
%    - `~+replab.+perm.SignedPermutationMatrixAction.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+perm.SignedPermutationMatrixAction.disp` -- 
%    - `~+replab.+perm.SignedPermutationMatrixAction.eq` -- Equality test
%    - `~+replab.+perm.SignedPermutationMatrixAction.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+perm.SignedPermutationMatrixAction.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+perm.SignedPermutationMatrixAction.lambda` -- Constructs an action from a function handle
%    - `~+replab.+perm.SignedPermutationMatrixAction.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+perm.SignedPermutationMatrixAction.longStr` -- Multi-line description of the current object
%    - `~+replab.+perm.SignedPermutationMatrixAction.rightAction` -- Computes the right action of a group element on a set element
%    - `~+replab.+perm.SignedPermutationMatrixAction.shortStr` -- Single line text description of the current object
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
        function self = SignedPermutationMatrixAction(G)
            assert(isa(G, 'replab.signed.PermutationGroup'));
            d = G.domainSize;
            self.G = G;
            self.P = replab.domain.intAsDoubleMatrix(d, d, 1, G.domainSize);
        end
        function str = headerStr(self)
            d = self.G.domainSize;
            str = sprintf('Action of signed permutations on %d x %d matrices', d, d);
        end
        function M = leftAction(self, signedPerm, M)
            minusSign = find(signedPerm < 0);
            if length(minusSign) > 0
                M(minusSign, :) = -M(minusSign, :);
                M(:, minusSign) = -M(:, minusSign);
            end
            M(abs(signedPerm), abs(signedPerm)) = M;
        end
        function M = rightAction(self, M, signedPerm)
            perm = abs(signedPerm);
            M = M(perm, perm);
            minusSign = find(signedPerm < 0);
            if length(minusSign) > 0
                M(minusSign, :) = -M(minusSign, :);
                M(:, minusSign) = -M(:, minusSign);
            end
        end
    end
end
