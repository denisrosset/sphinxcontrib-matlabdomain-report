classdef OfFiniteGroup < replab.semidirectproduct.OfFiniteGroups & replab.wreathproduct.Common
% Wreath product of a permutation group acting on a finite group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+wreathproduct.OfFiniteGroup.A` -- replab.CompactGroup: factor of base group
%    - `~+replab.+wreathproduct.OfFiniteGroup.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+wreathproduct.OfFiniteGroup.N` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+wreathproduct.OfFiniteGroup.OfCompactGroups` -- 
%    - `~+replab.+wreathproduct.OfFiniteGroup.OfFiniteGroup` -- 
%    - `~+replab.+wreathproduct.OfFiniteGroup.OfFiniteGroups` -- 
%    - `~+replab.+wreathproduct.OfFiniteGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+wreathproduct.OfFiniteGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+wreathproduct.OfFiniteGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+wreathproduct.OfFiniteGroup.atFun` -- 
%    - `~+replab.+wreathproduct.OfFiniteGroup.compose` -- Composition
%    - `~+replab.+wreathproduct.OfFiniteGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+wreathproduct.OfFiniteGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+wreathproduct.OfFiniteGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+wreathproduct.OfFiniteGroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+wreathproduct.OfFiniteGroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+wreathproduct.OfFiniteGroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+wreathproduct.OfFiniteGroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+wreathproduct.OfFiniteGroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+wreathproduct.OfFiniteGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+wreathproduct.OfFiniteGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.+wreathproduct.OfFiniteGroup.disp` -- 
%    - `~+replab.+wreathproduct.OfFiniteGroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+wreathproduct.OfFiniteGroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+wreathproduct.OfFiniteGroup.eq` -- Equality test
%    - `~+replab.+wreathproduct.OfFiniteGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+wreathproduct.OfFiniteGroup.findFun` -- 
%    - `~+replab.+wreathproduct.OfFiniteGroup.generator` -- Returns the i-th group generator
%    - `~+replab.+wreathproduct.OfFiniteGroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+wreathproduct.OfFiniteGroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+wreathproduct.OfFiniteGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+wreathproduct.OfFiniteGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+wreathproduct.OfFiniteGroup.identity` -- Monoid identity element
%    - `~+replab.+wreathproduct.OfFiniteGroup.imprimitivePermutation` -- Returns the permutation corresponding to the canonical imprimitive action
%    - `~+replab.+wreathproduct.OfFiniteGroup.imprimitiveRep` -- Returns an imprimitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfFiniteGroup.imprimitiveRepFun` -- Returns an imprimitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfFiniteGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.+wreathproduct.OfFiniteGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+wreathproduct.OfFiniteGroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+wreathproduct.OfFiniteGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+wreathproduct.OfFiniteGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+wreathproduct.OfFiniteGroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+wreathproduct.OfFiniteGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+wreathproduct.OfFiniteGroup.n` -- integer: Number of copies of the base group
%    - `~+replab.+wreathproduct.OfFiniteGroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.+wreathproduct.OfFiniteGroup.order` -- Returns the group order
%    - `~+replab.+wreathproduct.OfFiniteGroup.order_` -- vpi: Cached group order
%    - `~+replab.+wreathproduct.OfFiniteGroup.phi` -- replab.Action: Action of H on N
%    - `~+replab.+wreathproduct.OfFiniteGroup.primitivePermutation` -- Returns the permutation corresponding to the canonical primitive action
%    - `~+replab.+wreathproduct.OfFiniteGroup.primitiveRep` -- Returns a primitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfFiniteGroup.primitiveRepFun` -- Returns an primitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfFiniteGroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+wreathproduct.OfFiniteGroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+wreathproduct.OfFiniteGroup.requiredType` -- 
%    - `~+replab.+wreathproduct.OfFiniteGroup.sample` -- Samples an element from this domain
%    - `~+replab.+wreathproduct.OfFiniteGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+wreathproduct.OfFiniteGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+wreathproduct.OfFiniteGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.+wreathproduct.OfFiniteGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
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
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
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
%    .. method:: inverse
%
%       Documentation in :meth:`+replab.Group.inverse`
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
%    .. method:: order
%
%       Documentation in :meth:`+replab.FiniteGroup.order`
%
%    .. attribute:: order_
%
%       Documentation in :attr:`+replab.FiniteGroup.order_`
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


    methods
        
        function self = OfFiniteGroup(H, A)
            assert(isa(H, 'replab.PermutationGroup'));
            n = H.domainSize;
            base = A.directPower(n);
            phi = replab.perm.PermutationCellAction(H, base);
            self@replab.semidirectproduct.OfFiniteGroups(phi);
            assert(isa(A, self.requiredType));
            self.n = n;
            self.A = A;
        end

        function t = requiredType(self)
            t = 'replab.FiniteGroup';
        end
        
    end
    
end
