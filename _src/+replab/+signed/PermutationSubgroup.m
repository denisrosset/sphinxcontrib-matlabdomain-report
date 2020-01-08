classdef PermutationSubgroup < replab.signed.PermutationGroup
% Represents a subgroup of a signed permutation group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+signed.PermutationSubgroup.PermutationSubgroup` -- stuff derived from parent
%    - `~+replab.+signed.PermutationSubgroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+signed.PermutationSubgroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+signed.PermutationSubgroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+signed.PermutationSubgroup.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.+signed.PermutationSubgroup.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.+signed.PermutationSubgroup.compose` -- Composes two monoid/group elements
%    - `~+replab.+signed.PermutationSubgroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+signed.PermutationSubgroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+signed.PermutationSubgroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+signed.PermutationSubgroup.computeChain` -- 
%    - `~+replab.+signed.PermutationSubgroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+signed.PermutationSubgroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+signed.PermutationSubgroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+signed.PermutationSubgroup.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.+signed.PermutationSubgroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+signed.PermutationSubgroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+signed.PermutationSubgroup.definingRep` -- Natural representation on R^d of signed permutations on integers -d..-1, 1..d
%    - `~+replab.+signed.PermutationSubgroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+signed.PermutationSubgroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.+signed.PermutationSubgroup.disp` -- 
%    - `~+replab.+signed.PermutationSubgroup.domainSize` -- d when this group acts on {-d..-1, 1..d}
%    - `~+replab.+signed.PermutationSubgroup.elementOrder` -- Returns the order of a group element
%    - `~+replab.+signed.PermutationSubgroup.elementPermutationPart` -- Returns the permutation part of a signed permutation, by taking image absolute values
%    - `~+replab.+signed.PermutationSubgroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+signed.PermutationSubgroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+signed.PermutationSubgroup.eq` -- Equality test
%    - `~+replab.+signed.PermutationSubgroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+signed.PermutationSubgroup.generator` -- Returns the i-th group generator
%    - `~+replab.+signed.PermutationSubgroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+signed.PermutationSubgroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+signed.PermutationSubgroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+signed.PermutationSubgroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+signed.PermutationSubgroup.identity` -- Monoid identity element
%    - `~+replab.+signed.PermutationSubgroup.inverse` -- Computes the inverse of an element
%    - `~+replab.+signed.PermutationSubgroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+signed.PermutationSubgroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+signed.PermutationSubgroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+signed.PermutationSubgroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+signed.PermutationSubgroup.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.+signed.PermutationSubgroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+signed.PermutationSubgroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+signed.PermutationSubgroup.matrixAction` -- Returns the action of elements of this group on d x d matrices
%    - `~+replab.+signed.PermutationSubgroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.+signed.PermutationSubgroup.naturalAction` -- Returns the action of elements of this group on {-d..-1 1..d}
%    - `~+replab.+signed.PermutationSubgroup.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.+signed.PermutationSubgroup.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.+signed.PermutationSubgroup.order` -- Returns the group order
%    - `~+replab.+signed.PermutationSubgroup.order_` -- vpi: Cached group order
%    - `~+replab.+signed.PermutationSubgroup.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.+signed.PermutationSubgroup.permutationPart` -- Returns the permutation part of the current group
%    - `~+replab.+signed.PermutationSubgroup.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.+signed.PermutationSubgroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+signed.PermutationSubgroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+signed.PermutationSubgroup.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.+signed.PermutationSubgroup.sample` -- Samples an element from this domain
%    - `~+replab.+signed.PermutationSubgroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+signed.PermutationSubgroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+signed.PermutationSubgroup.shortStr` -- Single line text description of the current object
%    - `~+replab.+signed.PermutationSubgroup.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.+signed.PermutationSubgroup.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.+signed.PermutationSubgroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.+signed.PermutationSubgroup.trivialSubgroup` -- Returns the trivial subgroup of this group
%    - `~+replab.+signed.PermutationSubgroup.vectorAction` -- Returns the action of elements of this group on vectors
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
%       Documentation in :meth:`+replab.+signed.PermutationGroup.definingRep`
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
%       Documentation in :attr:`+replab.+signed.PermutationGroup.domainSize`
%
%    .. method:: elementOrder
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.elementOrder`
%
%    .. method:: elementPermutationPart
%
%       Documentation in :meth:`+replab.+signed.PermutationGroup.elementPermutationPart`
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
%    .. method:: matrixAction
%
%       Documentation in :meth:`+replab.+signed.PermutationGroup.matrixAction`
%
%    .. method:: nGenerators
%
%       Documentation in :meth:`+replab.FiniteGroup.nGenerators`
%
%    .. method:: naturalAction
%
%       Documentation in :meth:`+replab.+signed.PermutationGroup.naturalAction`
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
%    .. method:: permutationPart
%
%       Documentation in :meth:`+replab.+signed.PermutationGroup.permutationPart`
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
%    .. method:: vectorAction
%
%       Documentation in :meth:`+replab.+signed.PermutationGroup.vectorAction`
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
            self.generators = generators;
            for i = 1:length(generators)
                assert(~parent.isIdentity(generators{i}), 'Generator cannot be identity');
            end
        end
        
    end
        
end
