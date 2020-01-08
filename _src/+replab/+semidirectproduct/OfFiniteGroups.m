classdef OfFiniteGroups < replab.semidirectproduct.OfCompactGroups & replab.FiniteGroup
% Describes an external semidirect product of finite groups    
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+semidirectproduct.OfFiniteGroups.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+semidirectproduct.OfFiniteGroups.N` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+semidirectproduct.OfFiniteGroups.OfCompactGroups` -- 
%    - `~+replab.+semidirectproduct.OfFiniteGroups.OfFiniteGroups` -- 
%    - `~+replab.+semidirectproduct.OfFiniteGroups.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+semidirectproduct.OfFiniteGroups.assertEqv` -- Compares two elements for equality
%    - `~+replab.+semidirectproduct.OfFiniteGroups.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+semidirectproduct.OfFiniteGroups.atFun` -- 
%    - `~+replab.+semidirectproduct.OfFiniteGroups.compose` -- Composition
%    - `~+replab.+semidirectproduct.OfFiniteGroups.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+semidirectproduct.OfFiniteGroups.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+semidirectproduct.OfFiniteGroups.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+semidirectproduct.OfFiniteGroups.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+semidirectproduct.OfFiniteGroups.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+semidirectproduct.OfFiniteGroups.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+semidirectproduct.OfFiniteGroups.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+semidirectproduct.OfFiniteGroups.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+semidirectproduct.OfFiniteGroups.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+semidirectproduct.OfFiniteGroups.directProduct` -- Returns the direct product of groups
%    - `~+replab.+semidirectproduct.OfFiniteGroups.disp` -- 
%    - `~+replab.+semidirectproduct.OfFiniteGroups.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+semidirectproduct.OfFiniteGroups.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+semidirectproduct.OfFiniteGroups.eq` -- Equality test
%    - `~+replab.+semidirectproduct.OfFiniteGroups.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+semidirectproduct.OfFiniteGroups.findFun` -- 
%    - `~+replab.+semidirectproduct.OfFiniteGroups.generator` -- Returns the i-th group generator
%    - `~+replab.+semidirectproduct.OfFiniteGroups.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+semidirectproduct.OfFiniteGroups.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+semidirectproduct.OfFiniteGroups.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+semidirectproduct.OfFiniteGroups.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+semidirectproduct.OfFiniteGroups.identity` -- Monoid identity element
%    - `~+replab.+semidirectproduct.OfFiniteGroups.inverse` -- Computes the inverse of an element
%    - `~+replab.+semidirectproduct.OfFiniteGroups.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+semidirectproduct.OfFiniteGroups.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+semidirectproduct.OfFiniteGroups.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+semidirectproduct.OfFiniteGroups.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+semidirectproduct.OfFiniteGroups.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+semidirectproduct.OfFiniteGroups.longStr` -- Multi-line description of the current object
%    - `~+replab.+semidirectproduct.OfFiniteGroups.nGenerators` -- Returns the number of group generators
%    - `~+replab.+semidirectproduct.OfFiniteGroups.order` -- Returns the group order
%    - `~+replab.+semidirectproduct.OfFiniteGroups.order_` -- vpi: Cached group order
%    - `~+replab.+semidirectproduct.OfFiniteGroups.phi` -- replab.Action: Action of H on N
%    - `~+replab.+semidirectproduct.OfFiniteGroups.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+semidirectproduct.OfFiniteGroups.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+semidirectproduct.OfFiniteGroups.requiredType` -- 
%    - `~+replab.+semidirectproduct.OfFiniteGroups.sample` -- Samples an element from this domain
%    - `~+replab.+semidirectproduct.OfFiniteGroups.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+semidirectproduct.OfFiniteGroups.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+semidirectproduct.OfFiniteGroups.shortStr` -- Single line text description of the current object
%    - `~+replab.+semidirectproduct.OfFiniteGroups.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. attribute:: H
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.H`
%
%    .. attribute:: N
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.N`
%
%    .. method:: OfCompactGroups
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
%    .. method:: compose
%
%       Documentation in :meth:`+replab.+semidirectproduct.OfCompactGroups.compose`
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
%    .. attribute:: order_
%
%       Documentation in :attr:`+replab.FiniteGroup.order_`
%
%    .. attribute:: phi
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.phi`
%
%    .. method:: randomBag
%
%       Documentation in :meth:`+replab.FiniteGroup.randomBag`
%
%    .. attribute:: randomBag_
%
%       Documentation in :attr:`+replab.FiniteGroup.randomBag_`
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

    
    methods
        
        function self = OfFiniteGroups(phi)
            self = self@replab.semidirectproduct.OfCompactGroups(phi);
            H = phi.G;
            N = phi.P;
            generators = cell(1, H.nGenerators + N.nGenerators);
            for i = 1:length(H.generators)
                generators{i} = {H.generator(i) N.identity};
            end
            for i = 1:length(N.generators)
                generators{H.nGenerators + i} = {H.identity N.generator(i)};
            end
            self.generators = generators;
        end
                    
        function t = requiredType(self)
            t = 'replab.FiniteGroup';
        end

        %% Domain methods
        
        function g = sample(self)
            g = sample@replab.semidirectproduct.OfCompactGroups(self); % force method selection
        end
        
        %% CompactGroup methods
        
        function g = sampleUniformly(self)
            g = sampleUniformly@replab.semidirectproduct.OfCompactGroups(self); % force method selection
        end
        
        %% FiniteGroup methods
        
        function o = order(self)
            o = self.H.order * self.N.order;
        end
        
        function e = elements(self)
            e = replab.IndexedFamily.lambda(self.order, ...
                                            @(ind) self.atFun(ind), ...
                                            @(g) self.findFun(g));
        end
        
        function gd = decomposition(self)
            TH = self.H.decomposition.T;
            TN = self.N.decomposition.T;
            idN = self.N.identity;
            idH = self.H.identity;
            TH1 = cellfun(@(t) cellfun(@(h) {h idN}, t, 'uniform', 0), TH, 'uniform', 0);
            TN1 = cellfun(@(t) cellfun(@(n) {idH n}, t, 'uniform', 0), TN, 'uniform', 0);
            gd = replab.FiniteGroupDecomposition(self, horzcat(TH1, TN1));
        end

    end

    methods (Access = protected)
        
        function g = atFun(self, ind)
            ind = ind - 1;
            indN = mod(ind, self.N.order);
            indH = (ind - indN)/self.N.order;
            g = {self.H.elements.at(indH + 1) self.N.elements.at(indN + 1)};
        end
        
        function ind = findFun(self, g)
            indH = self.H.elements.find(g{1});
            indN = self.N.elements.find(g{2});
            ind = (indH - 1)*self.N.order + indN;
        end
        
    end
    

end
