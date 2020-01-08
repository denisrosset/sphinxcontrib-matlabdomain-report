classdef PermutationGroup < replab.NiceFiniteGroup
% A base class for all signed permutation groups
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+signed.PermutationGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+signed.PermutationGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+signed.PermutationGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+signed.PermutationGroup.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.+signed.PermutationGroup.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.+signed.PermutationGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.+signed.PermutationGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+signed.PermutationGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+signed.PermutationGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+signed.PermutationGroup.computeChain` -- 
%    - `~+replab.+signed.PermutationGroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+signed.PermutationGroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+signed.PermutationGroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+signed.PermutationGroup.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.+signed.PermutationGroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+signed.PermutationGroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+signed.PermutationGroup.definingRep` -- Natural representation on R^d of signed permutations on integers -d..-1, 1..d
%    - `~+replab.+signed.PermutationGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+signed.PermutationGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.+signed.PermutationGroup.disp` -- 
%    - `~+replab.+signed.PermutationGroup.domainSize` -- d when this group acts on {-d..-1, 1..d}
%    - `~+replab.+signed.PermutationGroup.elementOrder` -- Returns the order of a group element
%    - `~+replab.+signed.PermutationGroup.elementPermutationPart` -- Returns the permutation part of a signed permutation, by taking image absolute values
%    - `~+replab.+signed.PermutationGroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+signed.PermutationGroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+signed.PermutationGroup.eq` -- Equality test
%    - `~+replab.+signed.PermutationGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+signed.PermutationGroup.generator` -- Returns the i-th group generator
%    - `~+replab.+signed.PermutationGroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+signed.PermutationGroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+signed.PermutationGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+signed.PermutationGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+signed.PermutationGroup.identity` -- Monoid identity element
%    - `~+replab.+signed.PermutationGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.+signed.PermutationGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+signed.PermutationGroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+signed.PermutationGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+signed.PermutationGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+signed.PermutationGroup.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.+signed.PermutationGroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+signed.PermutationGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+signed.PermutationGroup.matrixAction` -- Returns the action of elements of this group on d x d matrices
%    - `~+replab.+signed.PermutationGroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.+signed.PermutationGroup.naturalAction` -- Returns the action of elements of this group on {-d..-1 1..d}
%    - `~+replab.+signed.PermutationGroup.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.+signed.PermutationGroup.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.+signed.PermutationGroup.order` -- Returns the group order
%    - `~+replab.+signed.PermutationGroup.order_` -- vpi: Cached group order
%    - `~+replab.+signed.PermutationGroup.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.+signed.PermutationGroup.permutationPart` -- Returns the permutation part of the current group
%    - `~+replab.+signed.PermutationGroup.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.+signed.PermutationGroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+signed.PermutationGroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+signed.PermutationGroup.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.+signed.PermutationGroup.sample` -- Samples an element from this domain
%    - `~+replab.+signed.PermutationGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+signed.PermutationGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+signed.PermutationGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.+signed.PermutationGroup.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.+signed.PermutationGroup.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.+signed.PermutationGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.+signed.PermutationGroup.trivialSubgroup` -- Returns the trivial subgroup of this group
%    - `~+replab.+signed.PermutationGroup.vectorAction` -- Returns the action of elements of this group on vectors
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


    properties (SetAccess = protected)
        domainSize; % d when this group acts on {-d..-1, 1..d}
    end
    
    methods

        %% Domain methods
        
        function b = eqv(self, x, y)
            b = isequal(x, y);
        end

        %% Monoid methods
        
        function z = compose(self, x, y)
            z = x(abs(y)).*sign(y);
        end
        
        %% Group methods
        
        function y = inverse(self, x)
            n = self.domainSize;
            y = zeros(1, n);
            xAbs = abs(x);
            y(xAbs) = 1:n;
            invFlip = xAbs(x < 0);
            y(invFlip) = -y(invFlip);
        end
        
        %% NiceFiniteGroup methods
        
        function p1 = niceMonomorphismImage(self, p)
            p1 = replab.signed.Permutations.toPermutation(p);
        end

        
        %% Methods specific to signed permutation groups
        
        function G = permutationPart(self)
        % Returns the permutation part of the current group
        %
        % Corresponds to the group image under the homomorphism `elementPermutationPart`.
        %
        % Returns:
        %   replab.PermutationGroup: The corresponding permutation group
            newGenerators = cell(1, 0);
            for i = 1:self.nGenerators
                img = self.elementPermutationPart(self.generator(i));
                if ~self.isIdentity(img)
                    newGenerators{1, end+1} = img;
                end
            end
            G = replab.Permutations(self.domainSize).subgroup(newGenerators);
        end
        
        function p = elementPermutationPart(self, g)
        % Returns the permutation part of a signed permutation, by taking image absolute values
        %
        % Computes the permutation p that acts on 1...domainSize as p(i) = abs(g(i))
        %
        % Args:
        %   g (signed permutation): Signed permutation
        %
        % Returns:
        %   permutation: The permutation part of `g`
            p = abs(g);
        end
        
        %% Actions

        function A = naturalAction(self)
        % Returns the action of elements of this group on {-d..-1 1..d}
        %
        % Here, d is self.domainSize
            A = replab.perm.SignedPermutationNaturalAction(self);
        end
        
        function A = vectorAction(self)
        % Returns the action of elements of this group on vectors
        %
        % Vectors are (self.domainSize)-dimensional vectors, and this permutes their coefficients and flips their signs
            A = replab.perm.SignedPermutationVectorAction(self);
        end

        function A = matrixAction(self)
        % Returns the action of elements of this group on d x d matrices
        %
        % Note that d = self.domainSize, and this acts by simultaneous permutations of their
        % rows and columns and flipping their signs
            A = replab.perm.SignedPermutationMatrixAction(self);
        end
        
        %% Representation construction
        
        function rho = definingRep(self)
        % Natural representation on R^d of signed permutations on integers -d..-1, 1..d
            rho = self.signedPermutationRep(self.domainSize, self.generators);
        end
        
    end
    
end
