classdef Permutations < replab.PermutationGroup
% Describes permutations over n = "domainSize" elements, i.e. the symmetric group Sn
%
% Example:
%   >>> S5 = replab.Permutations(5);
%   >>> S5.order
%      ans =
%      120
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Permutations.Permutations` -- 
%    - `~+replab.Permutations.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Permutations.alternatingSubgroup` -- 
%    - `~+replab.Permutations.assertEqv` -- Compares two elements for equality
%    - `~+replab.Permutations.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.Permutations.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.Permutations.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.Permutations.compose` -- Composes two monoid/group elements
%    - `~+replab.Permutations.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.Permutations.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.Permutations.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.Permutations.computeChain` -- 
%    - `~+replab.Permutations.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.Permutations.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.Permutations.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.Permutations.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.Permutations.cyclicSubgroup` -- 
%    - `~+replab.Permutations.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.Permutations.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.Permutations.definingRep` -- Returns the natural permutation representation of this permutation group
%    - `~+replab.Permutations.dihedralSubgroup` -- 
%    - `~+replab.Permutations.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.Permutations.directProduct` -- Returns the direct product of groups
%    - `~+replab.Permutations.disp` -- 
%    - `~+replab.Permutations.domainSize` -- integer: The integer ``d``, as this group acts on ``{1, ..., d}``
%    - `~+replab.Permutations.elementOrder` -- Returns the order of a group element
%    - `~+replab.Permutations.elements` -- Returns an indexed family of the group elements
%    - `~+replab.Permutations.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.Permutations.enumeratorAt` -- 
%    - `~+replab.Permutations.enumeratorFind` -- 
%    - `~+replab.Permutations.eq` -- Equality test
%    - `~+replab.Permutations.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.Permutations.fromCycles` -- Constructs a permutation from a product of cycles.
%    - `~+replab.Permutations.fromMatrix` -- Returns the signed permutation corresponding to the given matrix representation
%    - `~+replab.Permutations.generator` -- Returns the i-th group generator
%    - `~+replab.Permutations.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.Permutations.generators` -- row cell array of group elements: Group generators
%    - `~+replab.Permutations.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Permutations.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Permutations.identity` -- Monoid identity element
%    - `~+replab.Permutations.indexRelabelingMorphism` -- Returns the morphism the permutation action of this group on tensor coefficients
%    - `~+replab.Permutations.indexRelabelingPermutation` -- Returns the permutation that acts by permuting tensor coefficients
%    - `~+replab.Permutations.indexRelabelingRep` -- Representation that permutes the indices of a tensor
%    - `~+replab.Permutations.inverse` -- Computes the inverse of an element
%    - `~+replab.Permutations.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.Permutations.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.Permutations.lambda` -- Constructs a monoid from function handles
%    - `~+replab.Permutations.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.Permutations.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.Permutations.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.Permutations.longStr` -- Multi-line description of the current object
%    - `~+replab.Permutations.matrixAction` -- Returns the simultaneous action of permutations on both rows and columns of square matrices
%    - `~+replab.Permutations.nGenerators` -- Returns the number of group generators
%    - `~+replab.Permutations.naturalAction` -- Returns the natural action of elements of this group on its domain
%    - `~+replab.Permutations.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.Permutations.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.Permutations.orbits` -- Returns the partition of the domain into orbits under this group
%    - `~+replab.Permutations.order` -- Returns the group order
%    - `~+replab.Permutations.order_` -- vpi: Cached group order
%    - `~+replab.Permutations.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.Permutations.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.Permutations.quaternionGroup` -- Returns a permutation representation of the quaternion group
%    - `~+replab.Permutations.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.Permutations.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.Permutations.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.Permutations.sample` -- Samples an element from this domain
%    - `~+replab.Permutations.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.Permutations.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.Permutations.shift` -- Returns the cyclic permutation that shifts the domain indices by ``i``.
%    - `~+replab.Permutations.shortStr` -- Single line text description of the current object
%    - `~+replab.Permutations.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.Permutations.sorting` -- Returns the permutation that sorts a cell array using a custom comparison function
%    - `~+replab.Permutations.standardRep` -- Returns the standard representation of this permutation group
%    - `~+replab.Permutations.subgroup` -- Constructs a permutation subgroup from its generators
%    - `~+replab.Permutations.symmetricGroup` -- 
%    - `~+replab.Permutations.toMatrix` -- Returns the permutation matrix corresponding to the given permutation
%    - `~+replab.Permutations.toSparseMatrix` -- Returns the sparse permutation matrix corresponding to the given permutation
%    - `~+replab.Permutations.transposition` -- Returns the transposition permuting ``i`` and ``j``.
%    - `~+replab.Permutations.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.Permutations.trivialSubgroup` -- Returns the trivial subgroup of this group
%    - `~+replab.Permutations.vectorAction` -- Returns the action of permutations on column vectors
%    - `~+replab.Permutations.wreathProduct` -- Returns the wreath product of a compact group by this permutation group
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


    methods % Implementations of abstract methods
        
        function self = Permutations(domainSize)
            self.identity = 1:domainSize;
            self.domainSize = domainSize;
            self.parent = self;
            if self.domainSize < 2
                self.generators = cell(1, 0);
            elseif self.domainSize == 2
                self.generators = {[2 1]};
            else
                self.generators = {[2:domainSize 1] [2 1 3:domainSize]};
            end
        end
        
        %% Str methods
                
        function s = headerStr(self)
            s = sprintf('Permutations acting on %d elements', self.domainSize);
        end

        %% Domain methods
        
        function s = sample(self)
            s = randperm(self.domainSize); % overriden for efficiency
        end

        %% FiniteGroup methods
        
        function b = contains(self, g)
            assert(length(g) == self.domainSize, 'Permutation in wrong domain');
            assert(all(g > 0), 'Permutation should have positive coefficients');
            b = true;
        end
        
        %% NiceFiniteGroup methods
        
        function grp = subgroup(self, generators, order)
        % Constructs a permutation subgroup from its generators
        %
        % Args:
        %   generators (row cell array): List of generators given as a permutations in a row cell array
        %   order (vpi, optional): Argument specifying the group order, if given can speed up computations
        %
        % Returns:
        %   +replab.PermutationSubgroup: The constructed permutation subgroup.
            if nargin < 3
                order = [];
            end
            grp = replab.PermutationSubgroup(self, generators, order);
        end
        
    end
    
    methods (Access = protected)

        function o = computeOrder(self)
            o = factorial(vpi(self.domainSize));
        end
        
        function E = computeElements(self)
            E = replab.IndexedFamily.lambda(self.order, ...
                                            @(ind) self.enumeratorAt(ind), ...
                                            @(el) self.enumeratorFind(el));
        end
        
        function d = computeDecomposition(self)
            G = self.subgroup(self.generators, self.order);
            d = G.decomposition;
        end

        function ind = enumeratorFind(self, g)
            n = self.domainSize;
            ind0 = vpi(0);
            els = 1:n;
            for i = 1:n
                ind0 = ind0 * (n - i + 1);
                ind0 = ind0 + (find(els == g(i)) - 1);
                els = setdiff(els, g(i));
            end
            ind = ind0 + 1;
        end
        
        function g = enumeratorAt(self, ind)
            n = self.domainSize;
            ind0 = ind - 1; % make it 0-based
            inds = zeros(1, n);
            for i = 1:n
                r = mod(ind0, i);
                ind0 = (ind0 - r)/i;
                inds(i) = double(r + 1);
            end
            inds = fliplr(inds);
            els = 1:n;
            g = zeros(1, n);
            for i = 1:n
                e = els(inds(i));
                g(i) = e;
                els = setdiff(els, e);
            end
        end
        
    end

    methods
        
        function p = transposition(self, i, j)
        % Returns the transposition permuting ``i`` and ``j``.
        %
        % Args:
        %   i: First domain element to be transposed.
        %   j: Second domain element to be transposed.
        %
        % Returns:
        %   The constructed transposition.
            assert(1 <= i);
            assert(i <= self.domainSize);
            assert(1 <= j);
            assert(j <= self.domainSize);
            assert(i ~= j);
            p = 1:self.domainSize;
            p([i j]) = [j i];
        end
        
        function p = shift(self, i)
        % Returns the cyclic permutation that shifts the domain indices by ``i``.
        %
        % Args:
        %   i: Shift so that ``j`` is sent to ``j + i`` (wrapping around).
        %
        % Returns:
        %   The constructed cyclic shift.
            n = self.domainSize;
            p = mod((0:n-1)+i, n)+1;
        end
        
        function p = fromCycles(self, varargin)
        % Constructs a permutation from a product of cycles.
        %
        % Each cycle is given as a row vector, and the sequence of cycles is
        % given as variable arguments.
        %
        % Args:
        %  *args: Sequence of cycles as row vectors of indices
        % 
        % Returns:
        %  The permutation corresponding to the product of cycles.
            n = self.domainSize;
            p = self.identity;
            for i = length(varargin):-1:1
                cycle = varargin{i};
                % cycle 2 3 1 means that 2 -> 3, 3 -> 1, 1 -> 2
                cycleImage = [cycle(2:end) cycle(1)];
                newEl = 1:n;
                newEl(cycle) = cycleImage;
                p = self.compose(newEl, p);
            end
        end
               
        function grp = cyclicSubgroup(self)
            n = self.domainSize;
            if n == 1
                grp = self.trivialGroup;
            else
                grp = self.subgroup({[2:n 1]}, vpi(n));
            end
        end
        
        function grp = alternatingSubgroup(self)
            n = self.domainSize;
            if n <= 2
                grp = self.trivialGroup;
            else
                c3 = [2 3 1 4:n];
                if mod(n, 2) == 0
                    s = [1 3:n 2];
                else
                    s = [2:n 1];
                end
                grp = self.subgroup({c3 s}, self.order/2);
            end
        end
        
        function grp = symmetricGroup(self)
            grp = self.subgroup(self.generators, self.order);
        end
        
        function grp = dihedralSubgroup(self)
            n = self.domainSize;
            if n <= 2
                grp = self.symmetricGroup;
            else
                g1 = [2:n 1];
                g2 = fliplr(1:n);
                grp = self.subgroup({g1 g2});
            end
        end
        
    end
    
    methods (Static)
        
        function Q = quaternionGroup(self)
        % Returns a permutation representation of the quaternion group
        %
        % The quaternion group returned can be seen as the multiplication of 
        % of the four quaternion generators 1, i, j, k with a sign +/-1, thus
        % can be represented by permutations on 8 elements.
        %
        % Returns:
        %    +replab.PermutationGroup: Quaternion group as a subgroup of S(8)
            S8 = replab.Permutations(8);
            g1 = S8.fromCycles([1 2 4 7], [3 6 8 5]);
            g2 = S8.fromCycles([1 3 4 8], [2 5 7 6]);
            Q = replab.Permutations(8).subgroup({g1 g2});
        end
        
        function mat = toSparseMatrix(perm)
        % Returns the sparse permutation matrix corresponding to the given permutation
        %
        % The returned matrix is such that matrix multiplication is compatible with composition of
        % permutations, i.e. for ``P = replab.Permutations(domainSize)`` we have
        % ``P.toMatrix(P.compose(x, y)) = P.toMatrix(x) * P.toMatrix(y)``
        %
        % Args:
        %   perm (permutation row vector): Permutation
        %
        % Returns:
        %   The sparse permutation matrix corresponding to `perm`.
            n = length(perm);
            mat = sparse(perm, 1:n, ones(1, n), n, n);
        end
        
        function mat = toMatrix(perm)
        % Returns the permutation matrix corresponding to the given permutation
        %
        % The returned matrix is such that matrix multiplication is compatible with composition of
        % permutations, i.e. for ``P = replab.Permutations(domainSize)`` we have
        % ``P.toMatrix(P.compose(x, y)) = P.toMatrix(x) * P.toMatrix(y)``
        %
        % Args:
        %   perm (permutation row vector): Permutation
        %
        % Returns:
        %   The permutation matrix corresponding to `perm`.
            mat = full(replab.Permutations.toSparseMatrix(perm));
        end
        
        function perm = fromMatrix(mat)
        % Returns the signed permutation corresponding to the given matrix representation
        %
        % See `replab.Permutations.toMatrix`
        %
        % Args:
        %   mat: A permutation matrix.
        %
        % Returns:
        %   The permutation corresponding to matrix `mat`.
        %
        % Raises:
        %   Error: if `mat` is not a permutation matrix, throws an error
            if isequal(size(mat), [0 0])
                perm = zeros(1, 0);
                return
            end
            perm = [];
            n = size(mat, 1);
            [I J V] = find(mat);
            if length(I) ~= n
                error('Not a monomial matrix');
            end
            I = I';
            J = J';
            V = V';
            if ~isequal(V, ones(1, n))
                error('Not a permutation matrix');
            end
            sI = sort(I);
            [sJ IJ] = sort(J);
            if ~isequal(sI, 1:n) || ~isequal(sJ, 1:n)
                error('Not a monomial matrix');
            end
            perm = I(IJ);
        end

        function p = sorting(array, greaterFun)
        % Returns the permutation that sorts a cell array using a custom comparison function
        %
        % Args:
        %   array: A (row or column) vector array containing data
        %          of arbitrary type
        %   greaterFun: A function handle that compares elements such that
        %               ``greaterFun(x, y) == true`` when x > y
        %               and false otherwise
        % Returns:
        %   A permutation ``p`` such that ``sorted = array(p)``
            n = length(array);
            p = 1:n;
            inc = round(n/2);
            while inc > 0
                for i = (inc+1):n
                    tmp = p(i);
                    j = i;
                    if isa(array, 'cell')
                        while (j >= inc+1) && greaterFun(array{p(j-inc)}, array{tmp})
                            p(j) = p(j-inc);
                            j = j - inc;
                        end
                    else
                        while (j >= inc+1) && greaterFun(array(p(j-inc)), array(tmp))
                            p(j) = p(j-inc);
                            j = j - inc;
                        end
                    end
                    p(j) = tmp;
                end
                if inc == 2
                    inc = 1;
                else
                    inc = round(inc/2.2);
                end
            end
        end
        
    end
    
end
