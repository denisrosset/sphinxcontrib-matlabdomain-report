classdef NiceFiniteSubgroup < replab.NiceFiniteGroup
% A generic implementation of a subgroup of a nice finite group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.NiceFiniteSubgroup.NiceFiniteSubgroup` -- 
%    - `~+replab.NiceFiniteSubgroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.NiceFiniteSubgroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.NiceFiniteSubgroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.NiceFiniteSubgroup.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.NiceFiniteSubgroup.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.NiceFiniteSubgroup.compose` -- Composes two monoid/group elements
%    - `~+replab.NiceFiniteSubgroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.NiceFiniteSubgroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.NiceFiniteSubgroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.NiceFiniteSubgroup.computeChain` -- 
%    - `~+replab.NiceFiniteSubgroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.NiceFiniteSubgroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.NiceFiniteSubgroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.NiceFiniteSubgroup.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.NiceFiniteSubgroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.NiceFiniteSubgroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.NiceFiniteSubgroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.NiceFiniteSubgroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.NiceFiniteSubgroup.disp` -- 
%    - `~+replab.NiceFiniteSubgroup.elementOrder` -- Returns the order of a group element
%    - `~+replab.NiceFiniteSubgroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.NiceFiniteSubgroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.NiceFiniteSubgroup.eq` -- Equality test
%    - `~+replab.NiceFiniteSubgroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.NiceFiniteSubgroup.generator` -- Returns the i-th group generator
%    - `~+replab.NiceFiniteSubgroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.NiceFiniteSubgroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.NiceFiniteSubgroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.NiceFiniteSubgroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.NiceFiniteSubgroup.identity` -- Monoid identity element
%    - `~+replab.NiceFiniteSubgroup.inverse` -- Computes the inverse of an element
%    - `~+replab.NiceFiniteSubgroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.NiceFiniteSubgroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.NiceFiniteSubgroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.NiceFiniteSubgroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.NiceFiniteSubgroup.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.NiceFiniteSubgroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.NiceFiniteSubgroup.longStr` -- Multi-line description of the current object
%    - `~+replab.NiceFiniteSubgroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.NiceFiniteSubgroup.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.NiceFiniteSubgroup.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.NiceFiniteSubgroup.order` -- Returns the group order
%    - `~+replab.NiceFiniteSubgroup.order_` -- vpi: Cached group order
%    - `~+replab.NiceFiniteSubgroup.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.NiceFiniteSubgroup.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.NiceFiniteSubgroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.NiceFiniteSubgroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.NiceFiniteSubgroup.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.NiceFiniteSubgroup.sample` -- Samples an element from this domain
%    - `~+replab.NiceFiniteSubgroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.NiceFiniteSubgroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.NiceFiniteSubgroup.shortStr` -- Single line text description of the current object
%    - `~+replab.NiceFiniteSubgroup.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.NiceFiniteSubgroup.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.NiceFiniteSubgroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.NiceFiniteSubgroup.trivialSubgroup` -- Returns the trivial subgroup of this group
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
%    .. method:: chain
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.chain`
%
%    .. attribute:: chain_
%
%       Documentation in :attr:`+replab.NiceFiniteGroup.chain_`
%
%    .. method:: compose
%
%       Documentation in :meth:`+replab.Monoid.compose`
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
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
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
%    .. method:: niceMonomorphismImage
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.niceMonomorphismImage`
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

        function self = NiceFiniteSubgroup(parent, generators, order)
            self.parent = parent;
            self.identity = parent.identity;
            % own stuff
            if nargin > 2 && ~isempty(order)
                self.order_ = order;
            end
            for i = 1:length(generators)
                assert(~parent.isIdentity(generators{i}), 'Generator cannot be identity');
            end
            self.generators = generators;
        end

    end

end
