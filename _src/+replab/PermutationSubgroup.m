classdef PermutationSubgroup < replab.PermutationGroup
% Represents a subgroup of a permutation group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.PermutationSubgroup.PermutationSubgroup` -- stuff derived from parent
%    - `~+replab.PermutationSubgroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.PermutationSubgroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.PermutationSubgroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.PermutationSubgroup.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.PermutationSubgroup.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.PermutationSubgroup.compose` -- Composes two monoid/group elements
%    - `~+replab.PermutationSubgroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.PermutationSubgroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.PermutationSubgroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.PermutationSubgroup.computeChain` -- 
%    - `~+replab.PermutationSubgroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.PermutationSubgroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.PermutationSubgroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.PermutationSubgroup.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.PermutationSubgroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.PermutationSubgroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.PermutationSubgroup.definingRep` -- Returns the natural permutation representation of this permutation group
%    - `~+replab.PermutationSubgroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.PermutationSubgroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.PermutationSubgroup.disp` -- 
%    - `~+replab.PermutationSubgroup.domainSize` -- integer: The integer ``d``, as this group acts on ``{1, ..., d}``
%    - `~+replab.PermutationSubgroup.elementOrder` -- Returns the order of a group element
%    - `~+replab.PermutationSubgroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.PermutationSubgroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.PermutationSubgroup.eq` -- Equality test
%    - `~+replab.PermutationSubgroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.PermutationSubgroup.generator` -- Returns the i-th group generator
%    - `~+replab.PermutationSubgroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.PermutationSubgroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.PermutationSubgroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.PermutationSubgroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.PermutationSubgroup.identity` -- Monoid identity element
%    - `~+replab.PermutationSubgroup.indexRelabelingMorphism` -- Returns the morphism the permutation action of this group on tensor coefficients
%    - `~+replab.PermutationSubgroup.indexRelabelingPermutation` -- Returns the permutation that acts by permuting tensor coefficients
%    - `~+replab.PermutationSubgroup.indexRelabelingRep` -- Representation that permutes the indices of a tensor
%    - `~+replab.PermutationSubgroup.inverse` -- Computes the inverse of an element
%    - `~+replab.PermutationSubgroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.PermutationSubgroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.PermutationSubgroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.PermutationSubgroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.PermutationSubgroup.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.PermutationSubgroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.PermutationSubgroup.longStr` -- Multi-line description of the current object
%    - `~+replab.PermutationSubgroup.matrixAction` -- Returns the simultaneous action of permutations on both rows and columns of square matrices
%    - `~+replab.PermutationSubgroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.PermutationSubgroup.naturalAction` -- Returns the natural action of elements of this group on its domain
%    - `~+replab.PermutationSubgroup.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.PermutationSubgroup.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.PermutationSubgroup.orbits` -- Returns the partition of the domain into orbits under this group
%    - `~+replab.PermutationSubgroup.order` -- Returns the group order
%    - `~+replab.PermutationSubgroup.order_` -- vpi: Cached group order
%    - `~+replab.PermutationSubgroup.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.PermutationSubgroup.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.PermutationSubgroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.PermutationSubgroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.PermutationSubgroup.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.PermutationSubgroup.sample` -- Samples an element from this domain
%    - `~+replab.PermutationSubgroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.PermutationSubgroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.PermutationSubgroup.shortStr` -- Single line text description of the current object
%    - `~+replab.PermutationSubgroup.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.PermutationSubgroup.standardRep` -- Returns the standard representation of this permutation group
%    - `~+replab.PermutationSubgroup.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.PermutationSubgroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.PermutationSubgroup.trivialSubgroup` -- Returns the trivial subgroup of this group
%    - `~+replab.PermutationSubgroup.vectorAction` -- Returns the action of permutations on column vectors
%    - `~+replab.PermutationSubgroup.wreathProduct` -- Returns the wreath product of a compact group by this permutation group
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
%    .. method:: definingRep
%
%       Documentation in :meth:`+replab.PermutationGroup.definingRep`
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
%    .. attribute:: domainSize
%
%       Documentation in :attr:`+replab.PermutationGroup.domainSize`
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
%    .. method:: indexRelabelingMorphism
%
%       Documentation in :meth:`+replab.PermutationGroup.indexRelabelingMorphism`
%
%    .. method:: indexRelabelingPermutation
%
%       Documentation in :meth:`+replab.PermutationGroup.indexRelabelingPermutation`
%
%    .. method:: indexRelabelingRep
%
%       Documentation in :meth:`+replab.PermutationGroup.indexRelabelingRep`
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
%    .. method:: matrixAction
%
%       Documentation in :meth:`+replab.PermutationGroup.matrixAction`
%
%    .. method:: nGenerators
%
%       Documentation in :meth:`+replab.FiniteGroup.nGenerators`
%
%    .. method:: naturalAction
%
%       Documentation in :meth:`+replab.PermutationGroup.naturalAction`
%
%    .. method:: niceMonomorphismImage
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.niceMonomorphismImage`
%
%    .. method:: niceMonomorphismPreimage
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.niceMonomorphismPreimage`
%
%    .. method:: orbits
%
%       Documentation in :meth:`+replab.PermutationGroup.orbits`
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
%    .. method:: standardRep
%
%       Documentation in :meth:`+replab.PermutationGroup.standardRep`
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
%    .. method:: vectorAction
%
%       Documentation in :meth:`+replab.PermutationGroup.vectorAction`
%
%    .. method:: wreathProduct
%
%       Documentation in :meth:`+replab.PermutationGroup.wreathProduct`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    methods
        
        function self = PermutationSubgroup(parent, generators, order)
            % stuff derived from parent
            self.parent = parent;
            self.domainSize = parent.domainSize;
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
