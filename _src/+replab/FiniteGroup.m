classdef FiniteGroup < replab.CompactGroup
% Describes a group with a finite number of elements
%
% More computational primitives are available when a nice monomorphism is provided, see `.NiceFiniteGroup`.
%
% This computational structure must provide:
%
% * An indexed family of the group elements that supports element seeking and retrieval
%
% * A decomposition of the finite group in a product of sets
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.FiniteGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.FiniteGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.FiniteGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.FiniteGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.FiniteGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.FiniteGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.FiniteGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.FiniteGroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.FiniteGroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.FiniteGroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.FiniteGroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.FiniteGroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.FiniteGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.FiniteGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.FiniteGroup.disp` -- 
%    - `~+replab.FiniteGroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.FiniteGroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.FiniteGroup.eq` -- Equality test
%    - `~+replab.FiniteGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.FiniteGroup.generator` -- Returns the i-th group generator
%    - `~+replab.FiniteGroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.FiniteGroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.FiniteGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.FiniteGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.FiniteGroup.identity` -- Monoid identity element
%    - `~+replab.FiniteGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.FiniteGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.FiniteGroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.FiniteGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.FiniteGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.FiniteGroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.FiniteGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.FiniteGroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.FiniteGroup.order` -- Returns the group order
%    - `~+replab.FiniteGroup.order_` -- vpi: Cached group order
%    - `~+replab.FiniteGroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.FiniteGroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.FiniteGroup.sample` -- Samples an element from this domain
%    - `~+replab.FiniteGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.FiniteGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.FiniteGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.FiniteGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: assertEqv
%
%       Documentation in :meth:`+replab.Domain.assertEqv`
%
%    .. method:: assertNotEqv
%
%       Documentation in :meth:`+replab.Domain.assertNotEqv`
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
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
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
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Monoid.lambda`
%
%    .. method:: leftConjugate
%
%       Documentation in :meth:`+replab.Group.leftConjugate`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
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
        generators % row cell array of group elements: Group generators
    end

    properties (Access = protected)
        randomBag_ % `.RandomBag`: Bag of elements used for random sampling
        order_ % vpi: Cached group order
        elements_ % `.IndexedFamily`: Cached indexed family of group elements
        decomposition_ % `.FiniteGroupDecomposition`: Cached decomposition of this group
    end

    methods (Access = protected) % Abstract

        function o = computeOrder(self)
        % Computes the result cached by self.order
            error('Abstract');
        end

        function E = computeElements(self)
        % Computes the result cached by self.elements
            error('Abstract');
        end

        function D = computeDecomposition(self)
        % Computes the result cached by self.decomposition
            error('Abstract');
        end

    end

    methods % Abstract (and cached) methods

        function o = order(self)
        % Returns the group order
        %
        % Returns:
        %   vpi: The group order
            if isempty(self.order_)
                self.order_ = self.computeOrder;
            end
            o = self.order_;
        end

        function E = elements(self)
        % Returns an indexed family of the group elements
        %
        % The order of elements in the family is not guaranteed due to the use of nondeterministic algorithms.
        %
        % Returns:
        %   `.IndexedFamily`: A space-efficient enumeration of the group elements
            if isempty(self.elements_)
                self.elements_ = self.computeElements;
            end
            E = self.elements_;
        end

        function D = decomposition(self)
        % Returns a decomposition of this group as a product of sets
        %
        % Returns:
        %   `.FiniteGroupDecomposition`: The group decomposition
            if isempty(self.decomposition_)
                self.decomposition_ = self.computeDecomposition;
            end
            D = self.decomposition_;
        end

    end

    methods

        %% Own methods

        function n = nGenerators(self)
        % Returns the number of group generators
        %
        % Returns:
        %   integer: Number of group generators
            n = length(self.generators);
        end

        function p = generator(self, i)
        % Returns the i-th group generator
        %
        % Args:
        %   i (integer): Generator index
        %
        % Returns:
        %   element: i-th group generator
            p = self.generators{i};
        end

        function p = generatorInverse(self, i)
        % Returns the inverse of the i-th group generator
        %
        % Args:
        %   i (integer): Generator index
        %
        % Returns:
        %   element: Inverse of the i-th group generator
            p = self.inverse(self.generators{i});
        end

        function b = isTrivial(self)
        % Tests whether this group is trivial
        %
        % Returns:
        %   logical: True if this group is trivial (i.e. has only one element)
            b = self.nGenerators == 0;
        end

        function R = randomBag(self)
        % Returns an instance of the product-replacement algorithm data structure
        %
        % Returns:
        %   `.RandomBag`: The created random bag
            if isempty(self.randomBag_)
                self.randomBag_ = replab.RandomBag(self, self.generators);
            end
            R = self.randomBag_;
        end

        %% Str methods

        function names = hiddenFields(self)
            names = hiddenFields@replab.Group(self);
            names{1, end+1} = 'generators';
        end

        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Group(self);
            for i = 1:self.nGenerators
                names{1, end+1} = sprintf('generator(%d)', i);
                values{1, end+1} = self.generator(i);
            end
        end

        %% Domain methods

        function g = sample(self)
            g = self.randomBag.sample;
        end

        %% CompactGroup methods

        function g = sampleUniformly(self)
            g = self.elements.sample;
        end

        %% Representations

        function rep = leftRegularRep(self)
        % Returns the left regular representation of this group
        %
        % Warning:
        %   The choice of a basis for the regular representation is not deterministic,
        %   and results can vary between runs.
        %
        % Returns:
        %   `.Rep`: The left regular representation as a real permutation representation
            o = self.order;
            assert(o < 1e6);
            o = double(o);
            perms = cell(1, self.nGenerators);
            E = self.elements;
            for i = 1:self.nGenerators
                g = self.generator(i);
                img = zeros(1, o);
                for j = 1:o
                    img(j) = double(E.find(self.compose(g, E.at(j))));
                end
                perms{i} = img;
            end
            rep = self.permutationRep(o, perms);
        end

    end

end
