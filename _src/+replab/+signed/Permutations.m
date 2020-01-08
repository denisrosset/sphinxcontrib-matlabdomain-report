classdef Permutations < replab.signed.PermutationGroup
% Describes the signed permutation group over {-n...-1, 1...n} where n = domainSize
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+signed.Permutations.Permutations` -- 
%    - `~+replab.+signed.Permutations.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+signed.Permutations.assertEqv` -- Compares two elements for equality
%    - `~+replab.+signed.Permutations.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+signed.Permutations.chain` -- Returns the BSGS chain corresponding to this group
%    - `~+replab.+signed.Permutations.chain_` -- `+replab.+bsgs.Chain`: BSGS chain describing this group
%    - `~+replab.+signed.Permutations.compose` -- Composes two monoid/group elements
%    - `~+replab.+signed.Permutations.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+signed.Permutations.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+signed.Permutations.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+signed.Permutations.computeChain` -- 
%    - `~+replab.+signed.Permutations.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+signed.Permutations.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+signed.Permutations.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+signed.Permutations.contains` -- Tests whether this group contains the given parent group element
%    - `~+replab.+signed.Permutations.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+signed.Permutations.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+signed.Permutations.definingRep` -- Natural representation on R^d of signed permutations on integers -d..-1, 1..d
%    - `~+replab.+signed.Permutations.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+signed.Permutations.directProduct` -- Returns the direct product of groups
%    - `~+replab.+signed.Permutations.disp` -- 
%    - `~+replab.+signed.Permutations.domainSize` -- d when this group acts on {-d..-1, 1..d}
%    - `~+replab.+signed.Permutations.elementOrder` -- Returns the order of a group element
%    - `~+replab.+signed.Permutations.elementPermutationPart` -- Returns the permutation part of a signed permutation, by taking image absolute values
%    - `~+replab.+signed.Permutations.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+signed.Permutations.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+signed.Permutations.enumeratorAt` -- 
%    - `~+replab.+signed.Permutations.enumeratorFind` -- 
%    - `~+replab.+signed.Permutations.eq` -- Equality test
%    - `~+replab.+signed.Permutations.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+signed.Permutations.fromMatrix` -- Returns the signed permutation corresponding to the given matrix representation or throws an error
%    - `~+replab.+signed.Permutations.fromPermutation` -- Returns the signed permutation corresponding to the given permutation encoding
%    - `~+replab.+signed.Permutations.generator` -- Returns the i-th group generator
%    - `~+replab.+signed.Permutations.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+signed.Permutations.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+signed.Permutations.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+signed.Permutations.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+signed.Permutations.identity` -- Monoid identity element
%    - `~+replab.+signed.Permutations.inverse` -- Computes the inverse of an element
%    - `~+replab.+signed.Permutations.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+signed.Permutations.isSignedPermutationMatrix` -- Returns true when "mat" is a signed permutation matrix, i.e. a monomial matrix with nonzero entries equal to +1 or -1
%    - `~+replab.+signed.Permutations.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+signed.Permutations.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+signed.Permutations.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+signed.Permutations.leftConjugateGroup` -- Returns the left conjugate of the current group by the given element
%    - `~+replab.+signed.Permutations.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+signed.Permutations.longStr` -- Multi-line description of the current object
%    - `~+replab.+signed.Permutations.matrixAction` -- Returns the action of elements of this group on d x d matrices
%    - `~+replab.+signed.Permutations.nGenerators` -- Returns the number of group generators
%    - `~+replab.+signed.Permutations.naturalAction` -- Returns the action of elements of this group on {-d..-1 1..d}
%    - `~+replab.+signed.Permutations.niceMonomorphismImage` -- Returns a permutation representation of the given group element
%    - `~+replab.+signed.Permutations.niceMonomorphismPreimage` -- Returns the group element corresponding to a permutation
%    - `~+replab.+signed.Permutations.order` -- Returns the group order
%    - `~+replab.+signed.Permutations.order_` -- vpi: Cached group order
%    - `~+replab.+signed.Permutations.parent` -- `.NiceFiniteGroup`: Parent nice finite group
%    - `~+replab.+signed.Permutations.permutationPart` -- Returns the permutation part of the current group
%    - `~+replab.+signed.Permutations.permutationRep` -- Constructs a permutation representation of this group
%    - `~+replab.+signed.Permutations.quaternionGroup` -- Returns a signed representation of the quaternion group
%    - `~+replab.+signed.Permutations.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+signed.Permutations.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+signed.Permutations.repByImages` -- Constructs a finite dimensional representation of this group from generator images
%    - `~+replab.+signed.Permutations.sample` -- Samples an element from this domain
%    - `~+replab.+signed.Permutations.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+signed.Permutations.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+signed.Permutations.shortStr` -- Single line text description of the current object
%    - `~+replab.+signed.Permutations.signedPermutationRep` -- Returns a real signed permutation representation of this group
%    - `~+replab.+signed.Permutations.subgroup` -- Constructs a subgroup of the current group from generators
%    - `~+replab.+signed.Permutations.toMatrix` -- Returns the signed permutation matrix corresponding to the given signed permutation
%    - `~+replab.+signed.Permutations.toPermutation` -- Returns the permutation corresponding to the given signed permutation where the permutation acts on the list [-d,..,-1,1,..,d]
%    - `~+replab.+signed.Permutations.toSparseMatrix` -- 
%    - `~+replab.+signed.Permutations.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%    - `~+replab.+signed.Permutations.trivialSubgroup` -- Returns the trivial subgroup of this group
%    - `~+replab.+signed.Permutations.vectorAction` -- Returns the action of elements of this group on vectors
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
        
        function self = Permutations(domainSize)
            self.identity = 1:domainSize;
            self.domainSize = domainSize;
            self.parent = self;
            switch self.domainSize
              case 0
                self.generators = cell(1, 0);
              case 1
                self.generators = {[-1]};
              case 2
                self.generators = {[2 1] [-1 2]};
              otherwise
                shift = [2:self.domainSize 1];
                trans = [2 1 3:self.domainSize];
                flip = [-1 2:self.domainSize];
                self.generators = {shift trans flip};
            end
        end
        
        %% Str methods
                
        function s = headerStr(self)
            s = sprintf('Signed permutations acting on {-%d..-1 1..%d}', self.domainSize, self.domainSize);
        end
        
        %% Domain methods
        
        function s = sample(self)
            n = self.domainSize;
            s = randperm(n) .* (randi([0 1], 1, n)*2-1);
        end
        
        %% Finite group methods
                
        function b = contains(self, g)
            assert(length(g) == self.domainSize, 'Signed permutation in wrong domain');
            assert(all(g ~= 0) && all(abs(g) <= self.domainSize), ...
                   'Signed permutation has out of range coefficients');
            b = true;
        end
        
        
        function G = subgroup(self, generators, order)
            if nargin < 3
                order = [];
            end
            G = replab.signed.PermutationSubgroup(self, generators, order);
        end
        
    end
    
    methods (Access = protected)
        
        function o = computeOrder(self)
            o = factorial(vpi(self.domainSize)) * vpi(2)^self.domainSize;
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
            els = [-n:-1 1:n];
            for i = 1:n
                ind0 = ind0 * 2*(n - i + 1);
                ind0 = ind0 + (find(els == g(i)) - 1);
                els = setdiff(els, [g(i) -g(i)]);
            end
            ind = ind0 + 1;
        end
        
        function g = enumeratorAt(self, ind)
            n = self.domainSize;
            ind0 = ind - 1; % make it 0-based
            inds = zeros(1, n);
            for i = 1:n
                r = mod(ind0, 2*i);
                ind0 = (ind0 - r)/(2*i);
                inds(i) = double(r + 1);
            end
            inds = fliplr(inds);
            els = [-n:-1 1:n];
            g = zeros(1, n);
            for i = 1:n
                e = els(inds(i));
                g(i) = e;
                els = setdiff(els, [e -e]);
            end
        end

    end
        
    methods (Static)
        
        function perm = toPermutation(signedPerm)
        % Returns the permutation corresponding to the given signed permutation where the permutation acts on the list [-d,..,-1,1,..,d]
            n = length(signedPerm);
            perm = zeros(1, 2*n);
            for i = 1:length(signedPerm)
                im = n - i + 1; % position of -i in the list
                ip = n + i; % position of i in the list
                j = signedPerm(i);
                jm = n - abs(j) + 1;
                jp = n + abs(j);
                if j > 0
                    perm(im) = jm;
                    perm(ip) = jp;
                else
                    perm(im) = jp;
                    perm(ip) = jm;
                end
            end
        end
        
        function signedPerm = fromPermutation(perm)
        % Returns the signed permutation corresponding to the given permutation encoding
        %
        % See `.SignedPermutations.toPermutation`
            n2 = length(perm);
            if mod(n2, 2) ~= 0
                error('Not an image of a signed permutation');
            end
            n = n2/2; % domain size of the signed permutation
            perm(perm <= n) = -(n - perm(perm <= n) + 1);
            perm(perm > n) = perm(perm > n) - n;
            mperm = -fliplr(perm(1:n));
            pperm = perm(n+1:n2);
            assert(isequal(mperm, pperm), 'Not an image of a signed permutation');
            signedPerm = pperm;
        end

        function mat = toSparseMatrix(signedPerm)
            n = length(signedPerm);
            mat = sparse(abs(signedPerm), 1:n, sign(signedPerm), n, n);
        end

        function mat = toMatrix(signedPerm)
        % Returns the signed permutation matrix corresponding to the given signed permutation
        %
        % Such that matrix multiplication is
        % compatible with composition of permutations, i.e. 
        % S.toMatrix(S.compose(x, y)) = 
        % S.toMatrix(x) * S.toMatrix(y)
        % where S = SignedPermutations(domainSize)
            mat = full(replab.signed.Permutations.toSparseMatrix(signedPerm));
        end

        function b = isSignedPermutationMatrix(mat)
        % Returns true when "mat" is a signed permutation matrix, i.e. a monomial matrix with nonzero entries equal to +1 or -1
            if isequal(size(mat), [0 0])
                b = true;
                return
            end
            n = size(mat, 1);
            [I J S] = find(mat);
            I = I';
            J = J';
            S = S';
            sI = sort(I);
            [sJ IJ] = sort(J);
            b = isequal(sI, 1:n) && isequal(sJ, 1:n) && isequal(abs(S), ones(1, n));
        end
        
        function signedPerm = fromMatrix(mat)
        % Returns the signed permutation corresponding to the given matrix representation or throws an error
            if isequal(size(mat), [0 0])
                signedPerm = zeros(1, 0);
                return
            end
            signedPerm = [];
            n = size(mat, 1);
            [I J S] = find(mat);
            if length(I) ~= n
                error('Not a monomial matrix');
            end
            I = I';
            J = J';
            S = S';
            sI = sort(I);
            [sJ IJ] = sort(J);
            if ~isequal(sI, 1:n) || ~isequal(sJ, 1:n)
                error('Not a monomial matrix');
            end
            if ~isequal(abs(S), ones(1, n))
                error('Monomial matrix with entries other than +1, -1');
            end
            signedPerm = I.*S;
            signedPerm = signedPerm(IJ);
        end
    
    end
    
    methods (Static)
        
        function Q = quaternionGroup(self)
        % Returns a signed representation of the quaternion group
            SS4 = replab.signed.Permutations(4);
            g1 = [-1 -2 -3 -4];
            gi = [2 -1 4 -3];
            gj = [3 -4 -1 2];
            Q = SS4.subgroup({g1 gi gj});
        end
        
    end
    
end
