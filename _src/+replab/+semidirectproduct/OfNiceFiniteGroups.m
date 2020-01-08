classdef OfNiceFiniteGroups < replab.NiceFiniteGroup & replab.semidirectproduct.OfFiniteGroups
% Describes an external semidirect product of nice finite groups
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.N` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.OfCompactGroups` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.OfFiniteGroups` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.OfNiceFiniteGroups` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.assertEqv` -- Compares two elements for equality
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.atFun` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.compose` -- Composition
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.computeChain` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.directProduct` -- Returns the direct product of groups
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.disp` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.elementOrder` -- Returns the order of a group element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.eq` -- Equality test
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.findFun` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.generator` -- Returns the i-th group generator
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.identity` -- Monoid identity element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.inverse` -- Computes the inverse of an element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.longStr` -- Multi-line description of the current object
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.nGenerators` -- Returns the number of group generators
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.order` -- Returns the group order
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.order_` -- vpi: Cached group order
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.phi` -- replab.Action: Action of H on N
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.requiredType` -- 
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.sample` -- Samples an element from this domain
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.shortStr` -- Single line text description of the current object
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.+semidirectproduct.OfNiceFiniteGroups.trivialSubgroup` -- Returns the trivial subgroup of this group
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
%    .. method:: OfFiniteGroups
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
%    .. method:: atFun
%
%       No documentation
%
%    .. method:: chain
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.chain`
%
%    .. attribute:: chain_
%
%       Documentation in :attr:`+replab.NiceFiniteGroup.chain_`
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
%    .. method:: computeChain
%
%       No documentation
%
%    .. method:: computeDecomposition
%
%       Documentation in :meth:`+replab.FiniteGroup.computeDecomposition`
%
%    .. method:: computeElements
%
%       Documentation in :meth:`+replab.FiniteGroup.computeElements`
%
%    .. method:: computeOrder
%
%       Documentation in :meth:`+replab.FiniteGroup.computeOrder`
%
%    .. method:: contains
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.contains`
%
%    .. method:: decomposition
%
%       Documentation in :meth:`+replab.FiniteGroup.decomposition`
%
%    .. attribute:: decomposition_
%
%       Documentation in :attr:`+replab.FiniteGroup.decomposition_`
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
%    .. method:: elementOrder
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.elementOrder`
%
%    .. method:: elements
%
%       Documentation in :meth:`+replab.FiniteGroup.elements`
%
%    .. attribute:: elements_
%
%       Documentation in :attr:`+replab.FiniteGroup.elements_`
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: findFun
%
%       No documentation
%
%    .. method:: generator
%
%       Documentation in :meth:`+replab.FiniteGroup.generator`
%
%    .. method:: generatorInverse
%
%       Documentation in :meth:`+replab.FiniteGroup.generatorInverse`
%
%    .. attribute:: generators
%
%       Documentation in :attr:`+replab.FiniteGroup.generators`
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
%    .. method:: isTrivial
%
%       Documentation in :meth:`+replab.FiniteGroup.isTrivial`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Monoid.lambda`
%
%    .. method:: leftConjugate
%
%       Documentation in :meth:`+replab.Group.leftConjugate`
%
%    .. method:: leftConjugateGroup
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.leftConjugateGroup`
%
%    .. method:: leftRegularRep
%
%       Documentation in :meth:`+replab.FiniteGroup.leftRegularRep`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: nGenerators
%
%       Documentation in :meth:`+replab.FiniteGroup.nGenerators`
%
%    .. method:: niceMonomorphismPreimage
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.niceMonomorphismPreimage`
%
%    .. method:: order
%
%       Documentation in :meth:`+replab.FiniteGroup.order`
%
%    .. attribute:: order_
%
%       Documentation in :attr:`+replab.FiniteGroup.order_`
%
%    .. attribute:: parent
%
%       Documentation in :attr:`+replab.NiceFiniteGroup.parent`
%
%    .. method:: permutationRep
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.permutationRep`
%
%    .. attribute:: phi
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.phi`
%
%    .. method:: randomBag
%
%       Documentation in :meth:`+replab.FiniteGroup.randomBag`
%
%    .. attribute:: randomBag_
%
%       Documentation in :attr:`+replab.FiniteGroup.randomBag_`
%
%    .. method:: repByImages
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.repByImages`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Domain.sample`
%
%    .. method:: semidirectProduct
%
%       Documentation in :meth:`+replab.CompactGroup.semidirectProduct`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. method:: signedPermutationRep
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.signedPermutationRep`
%
%    .. method:: subgroup
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.subgroup`
%
%    .. method:: trivialRep
%
%       Documentation in :meth:`+replab.CompactGroup.trivialRep`
%
%    .. method:: trivialSubgroup
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.trivialSubgroup`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    methods
        
        function self = OfNiceFiniteGroups(phi)
            self = self@replab.semidirectproduct.OfFiniteGroups(phi);
            self.parent = self;
        end

        function t = requiredType(self)
            t = 'replab.NiceFiniteGroup';
        end

        %% Domain methods

        function b = eqv(self, x, y)
            b = eqv@replab.semidirectproduct.OfCompactGroups(self, x, y);
        end

        %% Monoid methods

        function z = compose(self, x, y)
            z = compose@replab.semidirectproduct.OfCompactGroups(self, x, y);
        end

        %% Group methods

        function xInv = inverse(self, x)
            xInv = inverse@replab.semidirectproduct.OfCompactGroups(self, x);
        end

        %% CompactGroup methods

        function g = sampleUniformly(self)
            g = sampleUniformly@replab.semidirectproduct.OfCompactGroups(self); % force method selection
        end

        %% NiceFiniteGroup methods

        function p = niceMonomorphismImage(self, g)
            h = g{1};
            n = g{2};
            hp = self.H.niceMonomorphismImage(h);
            np = self.N.niceMonomorphismImage(n);
            p = [hp np+length(hp)];
        end

    end

end
