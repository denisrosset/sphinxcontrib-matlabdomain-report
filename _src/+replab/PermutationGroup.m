classdef PermutationGroup < replab.NiceFiniteGroup
% A base class for all permutation groups
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.PermutationGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.PermutationGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.PermutationGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.PermutationGroup.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.PermutationGroup.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.PermutationGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.PermutationGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.PermutationGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.PermutationGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.PermutationGroup.computeChain` -- 
%    - `~+replab.PermutationGroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.PermutationGroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.PermutationGroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.PermutationGroup.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.PermutationGroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.PermutationGroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.PermutationGroup.definingRep` -- Returns the natural permutation representation of this permutation group
%    - `~+replab.PermutationGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.PermutationGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.PermutationGroup.disp` -- 
%    - `~+replab.PermutationGroup.domainSize` -- integer: The integer ``d``, as this group acts on ``{1, ..., d}``
%    - `~+replab.PermutationGroup.elementOrder` -- Returns the order of a group element
%    - `~+replab.PermutationGroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.PermutationGroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.PermutationGroup.eq` -- Equality test
%    - `~+replab.PermutationGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.PermutationGroup.generator` -- Returns the i-th group generator
%    - `~+replab.PermutationGroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.PermutationGroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.PermutationGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.PermutationGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.PermutationGroup.identity` -- Monoid identity element
%    - `~+replab.PermutationGroup.indexRelabelingMorphism` -- Returns the morphism the permutation action of this group on tensor coefficients
%    - `~+replab.PermutationGroup.indexRelabelingPermutation` -- Returns the permutation that acts by permuting tensor coefficients
%    - `~+replab.PermutationGroup.indexRelabelingRep` -- Representation that permutes the indices of a tensor
%    - `~+replab.PermutationGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.PermutationGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.PermutationGroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.PermutationGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.PermutationGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.PermutationGroup.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.PermutationGroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.PermutationGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.PermutationGroup.matrixAction` -- Returns the simultaneous action of permutations on both rows and columns of square matrices
%    - `~+replab.PermutationGroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.PermutationGroup.naturalAction` -- Returns the natural action of elements of this group on its domain
%    - `~+replab.PermutationGroup.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.PermutationGroup.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.PermutationGroup.orbits` -- Returns the partition of the domain into orbits under this group
%    - `~+replab.PermutationGroup.order` -- Returns the group order
%    - `~+replab.PermutationGroup.order_` -- vpi: Cached group order
%    - `~+replab.PermutationGroup.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.PermutationGroup.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.PermutationGroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.PermutationGroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.PermutationGroup.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.PermutationGroup.sample` -- Samples an element from this domain
%    - `~+replab.PermutationGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.PermutationGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.PermutationGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.PermutationGroup.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.PermutationGroup.standardRep` -- Returns the standard representation of this permutation group
%    - `~+replab.PermutationGroup.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.PermutationGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.PermutationGroup.trivialSubgroup` -- Returns the trivial subgroup of this group
%    - `~+replab.PermutationGroup.vectorAction` -- Returns the action of permutations on column vectors
%    - `~+replab.PermutationGroup.wreathProduct` -- Returns the wreath product of a compact group by this permutation group
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
        domainSize % integer: The integer ``d``, as this group acts on ``{1, ..., d}``
    end

    methods

        %% Domain methods

        function b = eqv(self, x, y)
            b = isequal(x, y);
        end

        %% Monoid methods

        function z = compose(self, x, y)
            z = x(y);
        end

        %% Group methods

        function y = inverse(self, x)
            n = self.domainSize;
            y = zeros(1, n);
            y(x) = 1:n;
        end

        %% NiceFiniteGroup methods

        function p = niceMonomorphismImage(self, p)
            p = p;
        end

        %% Methods specific to permutation groups

        function o = orbits(self)
        % Returns the partition of the domain into orbits under this group
        %
        % Permutation group orbits are also called domains of transitivity,
        % see https://www.encyclopediaofmath.org/index.php/Transitive_group
        %
        % Returns:
        %   `.Partition`: The orbit partition
            G = zeros(self.nGenerators, self.domainSize);
            for i = 1:self.nGenerators
                G(i, :) = self.generators{i};
            end
            o = replab.Partition.permutationsOrbits(G);
        end

        %% Group construction

        function w = wreathProduct(self, A)
        % Returns the wreath product of a compact group by this permutation group
        %
        % See https://en.wikipedia.org/wiki/Wreath_product
        %
        % Note that our notation is reversed compared to the Wikipedia page,
        % the permutation group is on the left hand side, as our convention
        % for semidirect product places the group acted upon on the right.
        %
        % Note that the return type depends on the argument type:
        % if ``A`` is a `.FiniteGroup`, the result will be a finite group too,
        % and if ``A`` is a `.NiceFiniteGroup`, the result will be of that type.
        %
        % Args:
        %   A (`.CompactGroup`): The group whose copies are acted upon
        %
        % Returns:
        %   `+replab.+wreathproduct.Common`: A wreath product group
            w = replab.wreathproduct.of(self, A);
        end

        %% Actions

        function A = naturalAction(self)
        % Returns the natural action of elements of this group on its domain
        %
        % This group natural domain is the set of integers ``{1..domainSize}``
        %
        % Returns:
        %   replab.Action: The natural action
            A = replab.perm.PermutationNaturalAction(self);
        end
        
        function A = vectorAction(self)
        % Returns the action of permutations on column vectors
        %
        % Acts on vectors of size `self.domainSize` by permuting their coefficients
        %
        % Returns:
        %   replab.Action: The vector action
            A = replab.perm.PermutationVectorAction(self);
        end

        function A = matrixAction(self)
        % Returns the simultaneous action of permutations on both rows and columns of square matrices
        %
        % Acts on matrices of size ``self.domainSize x self.domainSize``
        %
        % Returns:
        %   replab.Action: The matrix action
            A = replab.perm.PermutationMatrixAction(self);
        end
        
        function perm = indexRelabelingPermutation(self, g, indexRange)
        % Returns the permutation that acts by permuting tensor coefficients
        %
        % Let I = (i1, ..., id) be a sequence of indices, where d = self.domainSize
        % and 1 <= i1,...,id <= indexRange
        %
        % We enumerate elements of I by first incrementing id, then i_(d-1), etc...
        %
        % We compute the permutation of domain size ``indexRange^domainSize`` that acts on the
        % indices of I according to the argument `g`.
        %
        % Args:
        %   g (permutation): Permutation of subindices
        %   indexRange (integer): Dimension of each subindex
        %
        % Returns:
        %   permutation: The permutation on the enumeration of indices
            n = self.domainSize;
            dims = indexRange * ones(1, n);
            perm = permute(reshape(1:prod(dims), dims), fliplr(n +  1 - g));
            perm = perm(:)';
        end
        
        function phi = indexRelabelingMorphism(self, indexRange)
        % Returns the morphism the permutation action of this group on tensor coefficients
        %
        % The tensor coefficients correspond to R^ir x R^ir ... (domainSize times)
        % where ir = indexRange
        %
        % See also:
        %   `replab.PermutationGroup.indexRelabelingPermutation`
        %
        % Args:
        %   indexRange (integer): Dimension of each subindex
        %
        % Returns:
        %   function_handle: The permutation group homomorphism
            phi = @(g) self.indexRelabelingPermutation(g, indexRange);
        end

        %% Representation construction

        function rho = indexRelabelingRep(self, indexRange)
        % Representation that permutes the indices of a tensor
        %
        % It acts on the tensor space R^ir x R^ir ... (domainSize times)
        % where ir = indexRange, by permuting the indices. 
        %
        % The representation returned is real.
        %
        % See also:
        %   `replab.PermutationGroup.indexRelabelingPermutation`
        %
        % Args:
        %   indexRange (integer): Dimension of the tensor components/range of the subindices
        %
        % Returns:
        %   replab.Rep: The desired permutation representation
            rho = replab.rep.IndexRelabelingRep(self, indexRange);
        end

        function rho = definingRep(self)
        % Returns the natural permutation representation of this permutation group
        %
        % Returns:
        %   replab.Rep: The (real) natural permutation representation
            rho = self.permutationRep(self.domainSize, self.generators);
        end

        function rho = standardRep(self)
        % Returns the standard representation of this permutation group
        %
        % It corresponds to the representation orthogonal to the
        % trivial representation with basis [1, 1, ..., 1]'/sqrt(d)
        %
        % Returns:
        %   replab.Rep: The (real) standard representation
            V = replab.rep.standardBasis(self.domainSize);
            V = V(2:end, :);
            niceBasis = replab.NiceBasis.fromIntegerBasis(V);
            if isa(self, 'replab.Permutations')
                % special case for the symmetric group
                irrepInfo = replab.IrrepInfo([], 'R', []);
            else
                irrepInfo = [];
            end
            rho = self.definingRep.subRepUnitary(niceBasis.U, niceBasis, irrepInfo);
        end

    end

end
