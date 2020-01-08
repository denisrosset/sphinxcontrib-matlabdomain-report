classdef NiceFiniteGroup < replab.FiniteGroup
% A nice finite group is a finite group equipped with an injective homomorphism into a permutation group
%
% The class that subclasses `.NiceFiniteGroup` implements a method `.niceMonomorphismImage` that returns a
% permutation row vector corresponding to a group element.
%
% In turn, the `.NiceFiniteGroup` infrastructure will use that method to build a BSGS chain to describe
% the structure of the finite group; this chain also provides a way to compute the preimage of a permutation.
%
% Thus, an isomorphism is established between the present `.NiceFiniteGroup` and a permutation group; as
% permutation groups can be handled by efficient BSGS algorithms, the requested computations can be
% translated back and forth between this group and a permutation group.
%
% In particular, the decomposition of the finite group in a product of sets (`.FiniteGroupDecomposition`),
% the enumeration of elements using a `.IndexedFamily`, the construction of subgroups is all handled
% by permutation group algorithms.
%
% Handling subgroups
%
% Each nice finite group has a parent object, that describes the most general group embedding
% elements of a particular type. For example, permutations of domain size ``n`` are embedded in the
% symmetric group of degree ``n`` (for such groups, their nice monomorphism is the identity).
%
% If this group is its own parent, the methods that are delegated to the parent group
% (including `.eqv`/`compose`/`inverse`) needs to be overriden, otherwise call to their
% methods will end up recursing to the infinity.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.NiceFiniteGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.NiceFiniteGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.NiceFiniteGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.NiceFiniteGroup.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.NiceFiniteGroup.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.NiceFiniteGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.NiceFiniteGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.NiceFiniteGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.NiceFiniteGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.NiceFiniteGroup.computeChain` -- 
%    - `~+replab.NiceFiniteGroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.NiceFiniteGroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.NiceFiniteGroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.NiceFiniteGroup.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.NiceFiniteGroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.NiceFiniteGroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.NiceFiniteGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.NiceFiniteGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.NiceFiniteGroup.disp` -- 
%    - `~+replab.NiceFiniteGroup.elementOrder` -- Returns the order of a group element
%    - `~+replab.NiceFiniteGroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.NiceFiniteGroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.NiceFiniteGroup.eq` -- Equality test
%    - `~+replab.NiceFiniteGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.NiceFiniteGroup.generator` -- Returns the i-th group generator
%    - `~+replab.NiceFiniteGroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.NiceFiniteGroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.NiceFiniteGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.NiceFiniteGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.NiceFiniteGroup.identity` -- Monoid identity element
%    - `~+replab.NiceFiniteGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.NiceFiniteGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.NiceFiniteGroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.NiceFiniteGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.NiceFiniteGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.NiceFiniteGroup.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.NiceFiniteGroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.NiceFiniteGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.NiceFiniteGroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.NiceFiniteGroup.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.NiceFiniteGroup.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.NiceFiniteGroup.order` -- Returns the group order
%    - `~+replab.NiceFiniteGroup.order_` -- vpi: Cached group order
%    - `~+replab.NiceFiniteGroup.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.NiceFiniteGroup.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.NiceFiniteGroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.NiceFiniteGroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.NiceFiniteGroup.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.NiceFiniteGroup.sample` -- Samples an element from this domain
%    - `~+replab.NiceFiniteGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.NiceFiniteGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.NiceFiniteGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.NiceFiniteGroup.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.NiceFiniteGroup.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.NiceFiniteGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.NiceFiniteGroup.trivialSubgroup` -- Returns the trivial subgroup of this group
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
%    .. method:: order
%
%       Documentation in :meth:`+replab.FiniteGroup.order`
%
%    .. attribute:: order_
%
%       Documentation in :attr:`+replab.FiniteGroup.order_`
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


    properties (SetAccess = protected)
        parent % `.NiceFiniteGroup`: Parent nice finite group
    end


    properties (Access = protected)
        chain_ % `+replab.+bsgs.Chain`: BSGS chain describing this group
    end

    methods

        function sub = subgroup(self, generators, order)
        % Constructs a subgroup of the current group from generators
        %
        % Args:
        %   generators (row cell array of elements of this group): List of generators
        %   order (vpi, optional): Subgroup order
        %
        % Returns:
        %   `+replab.NiceFiniteSubgroup`: The subgroup generated by `.generators`
            if nargin < 3
                order = [];
            end
            if self.parent == self
                sub = replab.NiceFiniteSubgroup(self, generators, order);
            else
                sub = self.parent.subgroup(generators, order);
            end
        end

        function conj = leftConjugateGroup(self, by)
        % Returns the left conjugate of the current group by the given element
        %
        % ``res = self.leftConjugateGroup(by)``
        %
        % In particular, it ensures that
        % ``res.generator(i) = self.parent.leftConjugate(by, self.generator(i))``
        %
        % Args:
        %   by (element of `parent`): Element to conjugate the group with
        %
        % Returns:
        %   `+replab.NiceFiniteGroup`: The conjugated group
            newGenerators = cellfun(@(g) self.leftConjugate(by, g), self.generators, 'uniform', 0);
            newOrder = self.order;
            conj = self.parent.subgroup(newGenerators, newOrder);
        end

        function grp = trivialSubgroup(self)
        % Returns the trivial subgroup of this group
        %
        % Returns:
        %   `+replab.NiceFiniteGroup`: The trivial subgroup
            grp = self.subgroup({}, vpi(1));
        end

        function g = niceMonomorphismPreimage(self, p)
        % Returns the group element corresponding to a permutation
        %
        % See also `.niceMonomorphismImage`
        %
        % Args:
        %   p (permutation): Permutation representation
        %
        % Returns:
        %   g (element): Group element corresponding to the permutation
            g = self.chain.image(p);
        end

        function p = niceMonomorphismImage(self, g)
        % Returns a permutation representation of the given group element
        %
        % A nice monomorphism is the GAP System terminology for injective
        % homomorphism into a permutation group.
        %
        % Args:
        %   g (element): Group element to represent as a permutation
        %
        % Returns:
        %   permutation: Permutation representation of ``g``
            p = self.parent.niceMonomorphismImage(g);
        end

        %% Domain methods

        function b = eqv(self, x, y)
            b = self.parent.eqv(x, y);
        end

        %% Monoid methods

        function z = compose(self, x, y)
            z = self.parent.compose(x, y);
        end

        %% Group methods

        function xInv = inverse(self, x)
            xInv = self.parent.inverse(x);
        end

        %% CompactGroup methods

        function g = sampleUniformly(self)
            [~, g] = self.chain.sampleUniformlyWithImage;
        end

    end

    methods (Access = protected)

        %% FiniteGroup methods

        function order = computeOrder(self)
            order = self.chain.order;
        end

        function chain = computeChain(self)
            imgId = self.niceMonomorphismImage(self.identity);
            n = length(imgId);
            nG = self.nGenerators;
            S = zeros(n, nG);
            for i = 1:nG
                S(:,i) = self.niceMonomorphismImage(self.generator(i));
            end
            chain = replab.bsgs.Chain.makeWithImages(n, S, self, self.generators);
        end

        function E = computeElements(self)
            E = replab.IndexedFamily.lambda(self.order, ...
                                            @(ind) self.chain.imageFromIndex(ind), ...
                                            @(el) self.chain.indexFromElement(self.niceMonomorphismImage(el)));
        end

        function dec = computeDecomposition(self)
            dec = replab.FiniteGroupDecomposition(self, self.chain.imagesDecomposition);
        end

    end

    methods

        function o = elementOrder(self, g)
        % Returns the order of a group element
        %
        % Args:
        %   g (element): Group element
        %
        % Returns:
        %   integer: The order of ``g``, i.e. the smallest ``o`` such that ``g^o == identity``
            p = self.niceMonomorphismImage(g);
            orbits = replab.Partition.permutationsOrbits(p);
            orders = unique(orbits.blockSizes);
            o = 1;
            for i = 1:length(orders)
                o = lcm(o, orders(i));
            end
        end

        function c = chain(self)
        % Returns the BSGS chain corresponding to this group
        %
        % Returns:
        %   `+replab.+bsgs.Chain`: BSGS chain describing this group
            if isempty(self.chain_)
                self.chain_ = self.computeChain;
            end
            c = self.chain_;
        end

        %% Methods enabled by the BSGS algorithms

        function b = contains(self, g)
        % Tests whether this group contains the given parent group element
        %
        % Abstract in `+replab.FiniteSubgroup`
        %
        % Args:
        %   g (element of `self.parent`): Element to test membership of
        %
        % Returns:
        %   logical: True if this group contains ``g`` and false otherwise
            b = self.chain.contains(self.niceMonomorphismImage(g));
        end

        %% Representation construction

        function rho = repByImages(self, field, dimension, isUnitary, images, inverseImages)
        % Constructs a finite dimensional representation of this group from generator images
        %
        % Args:
        %   field ({'R', 'C'}): Whether the representation is real (R) or complex (C)
        %   dimension (integer): Representation dimension
        %   isUnitary ({true, false, []}): Whether the representation is unitary (or ``[]`` for unknown)
        %   images (row cell array of matrices): Images of the group generators
        %   inverseImages (row cell array of matrices): Inverse images of the group generators
        % Returns:
        %   `+replab.Rep`: The constructed group representation
            if nargin < 6
                inverseImages = [];
            end
            rho = replab.RepByImages(self, field, dimension, isUnitary, images, inverseImages);
        end

        function rho = permutationRep(self, dimension, permutations)
        % Constructs a permutation representation of this group
        %
        % The returned representation is real. Use ``rep.complexification`` to obtain a complex representation.
        %
        % Args:
        %   dimension: Dimension of the representation
        %   permutations (row cell array of permutations): Images of the generators as permutations of size ``dimension``
        %
        % Returns:
        %   `+replab.Rep`: The constructed group representation
            S = replab.Permutations(dimension);
            f = @(g) S.toMatrix(g);
            images = cellfun(f, permutations, 'uniform', 0);
            rho = self.repByImages('R', dimension, true, images);
        end

        function rho = signedPermutationRep(self, dimension, signedPermutations)
        % Returns a real signed permutation representation of this group
        %
        % The returned representation is real. Use ``rep.complexification`` to obtain a complex representation.
        %
        % Args:
        %   dimension: Dimension of the representation
        %   signedPermutations (row cell array of signed permutations): Images of the generators as signed permutations of size ``dimension``
        %
        % Returns:
        %   `+replab.Rep`: The constructed group representation
            f = @(g) replab.signed.Permutations.toMatrix(g);
            images = cellfun(f, signedPermutations, 'uniform', 0);
            rho = self.repByImages('R', dimension, true, images);
        end

    end

end