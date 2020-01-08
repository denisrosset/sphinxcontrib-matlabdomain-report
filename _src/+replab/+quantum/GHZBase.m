classdef GHZBase < replab.CompactGroup
% The GHZ abelian invariant group
%
% An element of the GHZ abelian group is a nParties x nLevels
% matrix containing real values between 0 and 2*pi, such that
% the sum of the phase of a level, over all parties, is 0 modulo 2*pi.
%
% We also require the first level phase to be one.
%
% Let g be an element of the group. We then have the following constraints:
%
% 1. `` 0 <= g(i,j) < 2*pi ``, for all i,j,
%
% 2. mod(sum(g, 1), 2*pi) == 0
%
% 3. g(:, 1) == 0
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+quantum.GHZBase.GHZBase` -- Constructs a GHZ base group
%    - `~+replab.+quantum.GHZBase.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+quantum.GHZBase.assertEqv` -- Compares two elements for equality
%    - `~+replab.+quantum.GHZBase.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+quantum.GHZBase.canonical` -- Returns the canonical form of an element of the GHZ base group
%    - `~+replab.+quantum.GHZBase.compose` -- Composes two monoid/group elements
%    - `~+replab.+quantum.GHZBase.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+quantum.GHZBase.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+quantum.GHZBase.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+quantum.GHZBase.definingRep` -- Returns the natural representation of this group
%    - `~+replab.+quantum.GHZBase.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+quantum.GHZBase.directProduct` -- Returns the direct product of groups
%    - `~+replab.+quantum.GHZBase.disp` -- 
%    - `~+replab.+quantum.GHZBase.eq` -- Equality test
%    - `~+replab.+quantum.GHZBase.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+quantum.GHZBase.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+quantum.GHZBase.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+quantum.GHZBase.identity` -- Monoid identity element
%    - `~+replab.+quantum.GHZBase.inverse` -- Computes the inverse of an element
%    - `~+replab.+quantum.GHZBase.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+quantum.GHZBase.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+quantum.GHZBase.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+quantum.GHZBase.longStr` -- Multi-line description of the current object
%    - `~+replab.+quantum.GHZBase.nLevels` -- integer: Number of levels for each party (i.e. qubit = 2)
%    - `~+replab.+quantum.GHZBase.nParties` -- integer: Number of parties
%    - `~+replab.+quantum.GHZBase.permuteLevels` -- 
%    - `~+replab.+quantum.GHZBase.permuteParties` -- 
%    - `~+replab.+quantum.GHZBase.sample` -- Samples an element from this domain
%    - `~+replab.+quantum.GHZBase.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+quantum.GHZBase.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+quantum.GHZBase.shortStr` -- Single line text description of the current object
%    - `~+replab.+quantum.GHZBase.toMatrix` -- Returns the natural matrix action of a group element
%    - `~+replab.+quantum.GHZBase.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: assertEqv
%
%       Documentation in :meth:`+replab.Domain.assertEqv`
%
%    .. method:: assertNotEqv
%
%       Documentation in :meth:`+replab.Domain.assertNotEqv`
%
%    .. method:: composeAll
%
%       Documentation in :meth:`+replab.Monoid.composeAll`
%
%    .. method:: composeN
%
%       Documentation in :meth:`+replab.Monoid.composeN`
%
%    .. method:: composeWithInverse
%
%       Documentation in :meth:`+replab.Group.composeWithInverse`
%
%    .. method:: directPower
%
%       Documentation in :meth:`+replab.CompactGroup.directPower`
%
%    .. method:: directProduct
%
%       Documentation in :meth:`+replab.CompactGroup.directProduct`
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
%    .. attribute:: identity
%
%       Documentation in :attr:`+replab.Monoid.identity`
%
%    .. method:: isIdentity
%
%       Documentation in :meth:`+replab.Monoid.isIdentity`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Monoid.lambda`
%
%    .. method:: leftConjugate
%
%       Documentation in :meth:`+replab.Group.leftConjugate`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: semidirectProduct
%
%       Documentation in :meth:`+replab.CompactGroup.semidirectProduct`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. method:: trivialRep
%
%       Documentation in :meth:`+replab.CompactGroup.trivialRep`
%
% .. raw:: html
%
%    <h3>Own members</h3>


    properties
        nParties % integer: Number of parties
        nLevels % integer: Number of levels for each party (i.e. qubit = 2)
    end
    
    methods
        
        function self = GHZBase(nParties, nLevels)
        % Constructs a GHZ base group
        %
        % Args:
        %   nParties (integer): Number of parties
        %   nLevels (integer): Number of levels
            self.nParties = nParties;
            self.nLevels = nLevels;
            self.identity = zeros(nParties, nLevels);
        end
        
        function rho = toMatrix(self, g)
        % Returns the natural matrix action of a group element
        %
        % The matrix corresponds to kron(U_1, U_2, ..., U_nParties)
        % where each U_i is a nLevels x nLevels diagonal matrix with
        % the i-th party phases on the diagonal
        %
        % Args:
        %   g (element): Group element
        %
        % Returns:
        %   double matrix: Complex diagonal matrix representation
            rho = 1;
            for i = 1:self.nParties
                D = diag(exp(1i*g(i,:)));
                rho = kron(rho, D);
            end
        end
        
        function g = canonical(self, g)
        % Returns the canonical form of an element of the GHZ base group
        %
        % Given a nParties x nLevels matrix with nonnegative entries,
        % adjust the phases modulo 2*pi so that they are in range,
        % makes sure that the first level phase is one, and that
        % the product of phases for each level accross parties is one.
            assert(all(all(g >= 0)));
            % force range
            g = mod(g, 2*pi);
            % force level phases multiply to one
            for l = 1:self.nLevels
                s = (mod(sum(g(:, l)) + pi, 2*pi) - pi)/self.nParties;
                g(:,l) = mod(g(:,l) + 2*pi - s, 2*pi);
            end
            % canonical under party global phase (set first level = 1) 
            for p = 1:self.nParties
                e = g(p,1);
                g(:,l) = mod(g(:,l) + 2*pi - e, 2*pi);
            end
        end
        
        function rep = definingRep(self)
        % Returns the natural representation of this group
        %
        % Returns:
        %   replab.Rep: The unitary natural representation
            d = self.nLevels^self.nParties;
            rep = replab.Rep.lambda(self, 'C', d, true, @(g) self.toMatrix(g));
        end
        
        function g = permuteParties(self, p, g)
            g(p, :) = g;
            g = self.canonical(g);
        end
        
        function g = permuteLevels(self, p, g)
            g(:, p) = g;
            g = self.canonical(g);
        end
        
        %% Domain methods
        
        function b = eqv(self, x, y)
            diff = mod(2*pi + pi + x - y, 2*pi) - pi;
            b = ~replab.isNonZeroMatrix(diff, replab.Parameters.doubleEigTol);
        end
        
        function g = sample(self)
            g = self.canonical(rand(self.nParties, self.nLevels));
        end
        
        %% Monoid methods
        
        function z = compose(self, x, y)
            z = self.canonical(x + y);
        end
        
        %% Group methods
        
        function xInv = inverse(self, x)
            xInv = self.canonical(2*pi - x);
        end
        
        %% CompactGroup methods
        
        function g = sampleUniformly(self)
            g = self.sample;
        end

    end

end
