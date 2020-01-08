classdef SignedPermutationNaturalAction < replab.Action
% Describes the natural action of signed permutations on their domain
%
% i.e. a permutation described by a vector of images of length n,
% with a possible sign, acts on signed integers {-n,..,-1, 1,..,n}
%
% The behavior is undefined for integers outside that range
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+perm.SignedPermutationNaturalAction.G` -- replab.Group: Group acting
%    - `~+replab.+perm.SignedPermutationNaturalAction.P` -- replab.Domain: Set acted upon
%    - `~+replab.+perm.SignedPermutationNaturalAction.SignedPermutationNaturalAction` -- 
%    - `~+replab.+perm.SignedPermutationNaturalAction.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+perm.SignedPermutationNaturalAction.disp` -- 
%    - `~+replab.+perm.SignedPermutationNaturalAction.eq` -- Equality test
%    - `~+replab.+perm.SignedPermutationNaturalAction.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+perm.SignedPermutationNaturalAction.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+perm.SignedPermutationNaturalAction.lambda` -- Constructs an action from a function handle
%    - `~+replab.+perm.SignedPermutationNaturalAction.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+perm.SignedPermutationNaturalAction.longStr` -- Multi-line description of the current object
%    - `~+replab.+perm.SignedPermutationNaturalAction.rightAction` -- Finds the inverse image by walking around the cycle
%    - `~+replab.+perm.SignedPermutationNaturalAction.shortStr` -- Single line text description of the current object
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
        function self = SignedPermutationNaturalAction(G)
            assert(isa(G, 'replab.signed.PermutationGroup'));
            self.G = G;
            self.P = replab.domain.signedIntAsDouble(1, G.domainSize);
        end
        function str = headerStr(self)
            d = self.G.domainSize;
            str = sprintf('Natural signed permutation action on 2*%d elements', d);
        end
        function p1 = leftAction(self, g, p)
            p1 = g(abs(p))*sign(p);
        end
        function p1 = rightAction(self, p, g)
        % Finds the inverse image by walking around the cycle
            p1 = abs(p);
            q = abs(g(abs(p)));
            while q ~= abs(p)
                p1 = q;
                q = abs(g(q));
            end
            p1 = p1*sign(p)*sign(g(p1));
        end
    end
end
