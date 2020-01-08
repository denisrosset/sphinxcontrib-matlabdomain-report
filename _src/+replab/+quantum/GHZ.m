classdef GHZ < replab.semidirectproduct.OfCompactGroups
% Symmetry group of the GHZ states
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+quantum.GHZ.GHZ` -- Constructs the GHZ group for a given number of parties and levels
%    - `~+replab.+quantum.GHZ.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+quantum.GHZ.N` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+quantum.GHZ.OfCompactGroups` -- 
%    - `~+replab.+quantum.GHZ.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+quantum.GHZ.assertEqv` -- Compares two elements for equality
%    - `~+replab.+quantum.GHZ.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+quantum.GHZ.compose` -- Composition
%    - `~+replab.+quantum.GHZ.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+quantum.GHZ.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+quantum.GHZ.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+quantum.GHZ.definingRep` -- Returns the natural representation of this group
%    - `~+replab.+quantum.GHZ.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+quantum.GHZ.directProduct` -- Returns the direct product of groups
%    - `~+replab.+quantum.GHZ.disp` -- 
%    - `~+replab.+quantum.GHZ.eq` -- Equality test
%    - `~+replab.+quantum.GHZ.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+quantum.GHZ.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+quantum.GHZ.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+quantum.GHZ.identity` -- Monoid identity element
%    - `~+replab.+quantum.GHZ.inverse` -- Computes the inverse of an element
%    - `~+replab.+quantum.GHZ.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+quantum.GHZ.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+quantum.GHZ.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+quantum.GHZ.longStr` -- Multi-line description of the current object
%    - `~+replab.+quantum.GHZ.nLevels` -- integer: Number of levels for each party (=2 for qubits)
%    - `~+replab.+quantum.GHZ.nParties` -- integer: Number of parties
%    - `~+replab.+quantum.GHZ.phi` -- replab.Action: Action of H on N
%    - `~+replab.+quantum.GHZ.requiredType` -- 
%    - `~+replab.+quantum.GHZ.sample` -- Samples an element from this domain
%    - `~+replab.+quantum.GHZ.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+quantum.GHZ.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+quantum.GHZ.shortStr` -- Single line text description of the current object
%    - `~+replab.+quantum.GHZ.toMatrix` -- Returns the natural matrix action of a group element
%    - `~+replab.+quantum.GHZ.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. attribute:: H
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.H`
%
%    .. attribute:: N
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.N`
%
%    .. method:: OfCompactGroups
%
%       No documentation
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
%    .. method:: compose
%
%       Documentation in :meth:`+replab.+semidirectproduct.OfCompactGroups.compose`
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
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
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
%    .. method:: inverse
%
%       Documentation in :meth:`+replab.Group.inverse`
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
%    .. attribute:: phi
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.phi`
%
%    .. method:: requiredType
%
%       No documentation
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Domain.sample`
%
%    .. method:: sampleUniformly
%
%       Documentation in :meth:`+replab.CompactGroup.sampleUniformly`
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
        nLevels % integer: Number of levels for each party (=2 for qubits)
    end
    
    methods
        
        function self = GHZ(nParties, nLevels)
        % Constructs the GHZ group for a given number of parties and levels
        %
        % Args:
        %   nParties (integer): Number of parties
        %   nLevels (integer): Number of levels
            base = replab.quantum.GHZBase(nParties, nLevels);
            SParties = replab.S(nParties);
            SLevels = replab.S(nLevels);
            discrete = directProduct(SParties, SLevels);
            f = @(q, b) base.permuteParties(q{1}, base.permuteLevels(q{2}, b));
            phi = replab.Action.lambda('Permutation of parties/levels', discrete, base, f);
            self@replab.semidirectproduct.OfCompactGroups(phi);
            self.nParties = nParties;
            self.nLevels = nLevels;
        end
        
        function rho = toMatrix(self, g)
        % Returns the natural matrix action of a group element
        %
        % It represents the action on a tensor space (C^d)^n, where
        % d = self.nLevels and n = self.nParties.
        %
        % For the action of the phase part (connected group part), 
        % see `replab.quantum.GHZBase.toMatrix`. This action is complemented
        % by the permutation of parties, and the correlated permutation of subsystem levels.
        %
        % Args:
        %   g (element): Group element
        %
        % Returns:
        %   double matrix: Unitary matrix representing `g`
            h = g{1};
            h1 = h{1};
            h2 = h{2};
            H1 = self.H.factor(1);
            H2 = self.H.factor(2);
            nL = self.nLevels;
            partyRho = replab.Permutations.toMatrix(H1.indexRelabelingPermutation(h1, nL));
            levelMat = replab.Permutations.toMatrix(h2);
            levelRho = 1;
            for i = 1:self.nParties
                levelRho = kron(levelRho, levelMat);
            end
            phaseRho = self.N.toMatrix(g{2});
            rho = partyRho*levelRho*phaseRho;
        end
        
        function rep = definingRep(self)
        % Returns the natural representation of this group
        %
        % Returns:
        %   replab.Rep: The unitary natural representation
            rep = replab.Rep.lambda(self, 'C', self.N.definingRep.dimension, true, @(g) self.toMatrix(g));
        end
        
    end
    
end
