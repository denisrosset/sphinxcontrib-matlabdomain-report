classdef OfNiceFiniteGroups < replab.NiceFiniteGroup & replab.directproduct.OfFiniteGroups
% A direct product of nice finite groups
%    
% In particular, the permutation image of an element of a direct product group
% is simply the concatenation of the permutation images of the factors (which
% are nice finite groups themselves).
%
% We overload a bunch of methods to make sure we use the `replab.directproduct.OfFiniteGroups`
% more efficient variants, that do not require the BSGS chain construction.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+directproduct.OfNiceFiniteGroups.OfCompactGroups` -- Constructs a direct product of groups
%    - `~+replab.+directproduct.OfNiceFiniteGroups.OfFiniteGroups` -- 
%    - `~+replab.+directproduct.OfNiceFiniteGroups.OfNiceFiniteGroups` -- 
%    - `~+replab.+directproduct.OfNiceFiniteGroups.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+directproduct.OfNiceFiniteGroups.assertEqv` -- Compares two elements for equality
%    - `~+replab.+directproduct.OfNiceFiniteGroups.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+directproduct.OfNiceFiniteGroups.atFun` -- See comments in self.elements
%    - `~+replab.+directproduct.OfNiceFiniteGroups.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.+directproduct.OfNiceFiniteGroups.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.+directproduct.OfNiceFiniteGroups.compose` -- Composes two monoid/group elements
%    - `~+replab.+directproduct.OfNiceFiniteGroups.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+directproduct.OfNiceFiniteGroups.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+directproduct.OfNiceFiniteGroups.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.computeChain` -- 
%    - `~+replab.+directproduct.OfNiceFiniteGroups.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+directproduct.OfNiceFiniteGroups.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+directproduct.OfNiceFiniteGroups.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+directproduct.OfNiceFiniteGroups.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+directproduct.OfNiceFiniteGroups.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+directproduct.OfNiceFiniteGroups.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+directproduct.OfNiceFiniteGroups.directProduct` -- Returns the direct product of groups
%    - `~+replab.+directproduct.OfNiceFiniteGroups.directSumRep` -- Constructs a direct sum representation
%    - `~+replab.+directproduct.OfNiceFiniteGroups.directSumRepFun` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfNiceFiniteGroups.directSumRepFunWithIndex` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfNiceFiniteGroups.disp` -- 
%    - `~+replab.+directproduct.OfNiceFiniteGroups.elementOrder` -- Returns the order of a group element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+directproduct.OfNiceFiniteGroups.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+directproduct.OfNiceFiniteGroups.eq` -- Equality test
%    - `~+replab.+directproduct.OfNiceFiniteGroups.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+directproduct.OfNiceFiniteGroups.factor` -- 
%    - `~+replab.+directproduct.OfNiceFiniteGroups.factors` -- row cell array: Factor groups
%    - `~+replab.+directproduct.OfNiceFiniteGroups.findFun` -- See comments in self.elements
%    - `~+replab.+directproduct.OfNiceFiniteGroups.generator` -- Returns the i-th group generator
%    - `~+replab.+directproduct.OfNiceFiniteGroups.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+directproduct.OfNiceFiniteGroups.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+directproduct.OfNiceFiniteGroups.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+directproduct.OfNiceFiniteGroups.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+directproduct.OfNiceFiniteGroups.identity` -- Monoid identity element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.inverse` -- Computes the inverse of an element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+directproduct.OfNiceFiniteGroups.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+directproduct.OfNiceFiniteGroups.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+directproduct.OfNiceFiniteGroups.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+directproduct.OfNiceFiniteGroups.longStr` -- Multi-line description of the current object
%    - `~+replab.+directproduct.OfNiceFiniteGroups.nFactors` -- 
%    - `~+replab.+directproduct.OfNiceFiniteGroups.nGenerators` -- Returns the number of group generators
%    - `~+replab.+directproduct.OfNiceFiniteGroups.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.+directproduct.OfNiceFiniteGroups.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.+directproduct.OfNiceFiniteGroups.order` -- Returns the group order
%    - `~+replab.+directproduct.OfNiceFiniteGroups.order_` -- vpi: Cached group order
%    - `~+replab.+directproduct.OfNiceFiniteGroups.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.+directproduct.OfNiceFiniteGroups.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.+directproduct.OfNiceFiniteGroups.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+directproduct.OfNiceFiniteGroups.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+directproduct.OfNiceFiniteGroups.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.+directproduct.OfNiceFiniteGroups.requiredType` -- 
%    - `~+replab.+directproduct.OfNiceFiniteGroups.sample` -- Samples an element from this domain
%    - `~+replab.+directproduct.OfNiceFiniteGroups.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+directproduct.OfNiceFiniteGroups.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+directproduct.OfNiceFiniteGroups.shortStr` -- Single line text description of the current object
%    - `~+replab.+directproduct.OfNiceFiniteGroups.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.+directproduct.OfNiceFiniteGroups.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.+directproduct.OfNiceFiniteGroups.tensorRep` -- Constructs a tensor product representation
%    - `~+replab.+directproduct.OfNiceFiniteGroups.tensorRepFun` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfNiceFiniteGroups.tensorRepFunWithIndex` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfNiceFiniteGroups.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.+directproduct.OfNiceFiniteGroups.trivialSubgroup` -- Returns the trivial subgroup of this group
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: OfCompactGroups
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.OfCompactGroups`
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
%       Documentation in :meth:`+replab.+directproduct.OfFiniteGroups.atFun`
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
%    .. method:: directSumRep
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.directSumRep`
%
%    .. method:: directSumRepFun
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.directSumRepFun`
%
%    .. method:: directSumRepFunWithIndex
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.directSumRepFunWithIndex`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: elementOrder
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.elementOrder`
%
%    .. attribute:: elements_
%
%       Documentation in :attr:`+replab.FiniteGroup.elements_`
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: factor
%
%       No documentation
%
%    .. attribute:: factors
%
%       Documentation in :attr:`+replab.+directproduct.OfCompactGroups.factors`
%
%    .. method:: findFun
%
%       Documentation in :meth:`+replab.+directproduct.OfFiniteGroups.findFun`
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
%    .. method:: nFactors
%
%       No documentation
%
%    .. method:: nGenerators
%
%       Documentation in :meth:`+replab.FiniteGroup.nGenerators`
%
%    .. method:: niceMonomorphismPreimage
%
%       Documentation in :meth:`+replab.NiceFiniteGroup.niceMonomorphismPreimage`
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
%    .. method:: tensorRep
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.tensorRep`
%
%    .. method:: tensorRepFun
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.tensorRepFun`
%
%    .. method:: tensorRepFunWithIndex
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.tensorRepFunWithIndex`
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
        
        function self = OfNiceFiniteGroups(factors)
            self = self@replab.directproduct.OfFiniteGroups(factors);
            self.parent = self;
        end
        
        function t = requiredType(self)
            t = 'replab.NiceFiniteGroup';
        end

        %% Domain methods
        
        function b = eqv(self, x, y)
            b = eqv@replab.directproduct.OfCompactGroups(self, x, y);
        end
        
        %% Monoid methods
        
        function z = compose(self, x, y)
            z = compose@replab.directproduct.OfCompactGroups(self, x, y);
        end
 
        %% Group methods
        
        function xInv = inverse(self, x)
            xInv = inverse@replab.directproduct.OfCompactGroups(self, x);
        end

        %% CompactGroup methods
        
        function g = sampleUniformly(self)
            g = sampleUniformly@replab.directproduct.OfCompactGroups(self); 
            % force method selection
        end
        
        %% FiniteGroup methods
        
        function o = order(self)
            o = order@replab.directproduct.OfFiniteGroups(self);
            % force efficient method selection, avoid BSGS chain computation
        end

        
        function e = elements(self)
            e = elements@replab.directproduct.OfFiniteGroups(self);
            % force efficient method selection, avoid BSGS chain computation
        end
        
        function gd = decomposition(self)
            gd = decomposition@replab.directproduct.OfFiniteGroups(self);
            % force efficient method selection, avoid BSGS chain computation
        end
        
        %% NiceFiniteGroup methods
        
        function p = niceMonomorphismImage(self, g)
            shift = 0;
            p = [];
            % concatenates the permutation images of the factors
            for i = 1:self.nFactors
                pf = self.factor(i).niceMonomorphismImage(g{i});
                p = [p pf+shift];
                shift = shift + length(pf);
            end
        end
        
    end

end
