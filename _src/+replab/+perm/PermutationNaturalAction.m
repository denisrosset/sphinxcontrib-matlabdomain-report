classdef PermutationNaturalAction < replab.Action
% Describes the natural action of permutations on their domain
%
% i.e. a permutation described by a vector of images of length n
% acts on integers 1..n
%
% The behavior is undefined for integers outside that range
% (< 1 or > n)
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+perm.PermutationNaturalAction.G` -- replab.Group: Group acting
%    - `~+replab.+perm.PermutationNaturalAction.P` -- replab.Domain: Set acted upon
%    - `~+replab.+perm.PermutationNaturalAction.PermutationNaturalAction` -- 
%    - `~+replab.+perm.PermutationNaturalAction.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+perm.PermutationNaturalAction.disp` -- 
%    - `~+replab.+perm.PermutationNaturalAction.eq` -- Equality test
%    - `~+replab.+perm.PermutationNaturalAction.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+perm.PermutationNaturalAction.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+perm.PermutationNaturalAction.lambda` -- Constructs an action from a function handle
%    - `~+replab.+perm.PermutationNaturalAction.leftAction` -- Computes the left action of a group element on a set element
%    - `~+replab.+perm.PermutationNaturalAction.longStr` -- Multi-line description of the current object
%    - `~+replab.+perm.PermutationNaturalAction.rightAction` -- Finds the inverse image by walking around the cycle
%    - `~+replab.+perm.PermutationNaturalAction.shortStr` -- Single line text description of the current object
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
        function self = PermutationNaturalAction(G)
            assert(isa(G, 'replab.PermutationGroup'));
            self.G = G;
            self.P = replab.domain.intAsDouble(1, G.domainSize);
        end
        function str = headerStr(self)
            str = sprintf('Natural permutation action on %d elements', self.G.domainSize);
        end
        function p1 = leftAction(self, g, p)
            p1 = g(p);
        end
        function p1 = rightAction(self, p, g)
        % Finds the inverse image by walking around the cycle
            p1 = p;
            q = g(p);
            while q ~= p
                p1 = q;
                q = g(q);
            end
        end
    end
end
