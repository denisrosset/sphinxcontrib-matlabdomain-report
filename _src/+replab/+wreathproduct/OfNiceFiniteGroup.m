classdef OfNiceFiniteGroup < replab.NiceFiniteGroup & replab.semidirectproduct.OfFiniteGroups & replab.wreathproduct.Common
% Wreath product of a permutation group acting on a nice finite group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.A` -- replab.CompactGroup: factor of base group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.N` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.OfCompactGroups` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.OfFiniteGroups` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.OfNiceFiniteGroup` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.atFun` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.compose` -- Composition
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.computeChain` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.disp` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.elementOrder` -- Returns the order of a group element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.eq` -- Equality test
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.findFun` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.generator` -- Returns the i-th group generator
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.identity` -- Monoid identity element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.imprimitivePermutation` -- Returns the permutation corresponding to the canonical imprimitive action
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.imprimitiveRep` -- Returns an imprimitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.imprimitiveRepFun` -- Returns an imprimitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.n` -- integer: Number of copies of the base group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.order` -- Returns the group order
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.order_` -- vpi: Cached group order
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.phi` -- replab.Action: Action of H on N
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.primitivePermutation` -- Returns the permutation corresponding to the canonical primitive action
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.primitiveRep` -- Returns a primitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.primitiveRepFun` -- Returns an primitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.requiredType` -- 
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.sample` -- Samples an element from this domain
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.+wreathproduct.OfNiceFiniteGroup.trivialSubgroup` -- Returns the trivial subgroup of this group
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. attribute:: A
%
%       Documentation in :attr:`+replab.+wreathproduct.Common.A`
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
%    .. method:: imprimitivePermutation
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.imprimitivePermutation`
%
%    .. method:: imprimitiveRep
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.imprimitiveRep`
%
%    .. method:: imprimitiveRepFun
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.imprimitiveRepFun`
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
%    .. attribute:: n
%
%       Documentation in :attr:`+replab.+wreathproduct.Common.n`
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
%    .. method:: primitivePermutation
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.primitivePermutation`
%
%    .. method:: primitiveRep
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.primitiveRep`
%
%    .. method:: primitiveRepFun
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.primitiveRepFun`
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
        
        function self = OfNiceFiniteGroup(H, A)
            assert(isa(H, 'replab.PermutationGroup'));
            n = H.domainSize;
            base = A.directPower(n);
            phi = replab.perm.PermutationCellAction(H, base);
            self@replab.semidirectproduct.OfFiniteGroups(phi);
            self.parent = self;
            assert(isa(A, self.requiredType));
            self.n = n;
            self.A = A;
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

        function p = niceMonomorphismImage(self, w)
            p = self.imprimitivePermutation(w, @(a) self.A.niceMonomorphismImage(a));
        end

    end
    
end
