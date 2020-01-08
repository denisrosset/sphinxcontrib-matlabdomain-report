classdef OfFiniteGroups < replab.FiniteGroup & replab.directproduct.OfCompactGroups
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+directproduct.OfFiniteGroups.OfCompactGroups` -- Constructs a direct product of groups
%    - `~+replab.+directproduct.OfFiniteGroups.OfFiniteGroups` -- 
%    - `~+replab.+directproduct.OfFiniteGroups.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+directproduct.OfFiniteGroups.assertEqv` -- Compares two elements for equality
%    - `~+replab.+directproduct.OfFiniteGroups.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+directproduct.OfFiniteGroups.atFun` -- See comments in self.elements
%    - `~+replab.+directproduct.OfFiniteGroups.compose` -- Composes two monoid/group elements
%    - `~+replab.+directproduct.OfFiniteGroups.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+directproduct.OfFiniteGroups.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+directproduct.OfFiniteGroups.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+directproduct.OfFiniteGroups.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+directproduct.OfFiniteGroups.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+directproduct.OfFiniteGroups.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+directproduct.OfFiniteGroups.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+directproduct.OfFiniteGroups.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+directproduct.OfFiniteGroups.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+directproduct.OfFiniteGroups.directProduct` -- Returns the direct product of groups
%    - `~+replab.+directproduct.OfFiniteGroups.directSumRep` -- Constructs a direct sum representation
%    - `~+replab.+directproduct.OfFiniteGroups.directSumRepFun` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfFiniteGroups.directSumRepFunWithIndex` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfFiniteGroups.disp` -- 
%    - `~+replab.+directproduct.OfFiniteGroups.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+directproduct.OfFiniteGroups.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+directproduct.OfFiniteGroups.eq` -- Equality test
%    - `~+replab.+directproduct.OfFiniteGroups.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+directproduct.OfFiniteGroups.factor` -- 
%    - `~+replab.+directproduct.OfFiniteGroups.factors` -- row cell array: Factor groups
%    - `~+replab.+directproduct.OfFiniteGroups.findFun` -- See comments in self.elements
%    - `~+replab.+directproduct.OfFiniteGroups.generator` -- Returns the i-th group generator
%    - `~+replab.+directproduct.OfFiniteGroups.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+directproduct.OfFiniteGroups.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+directproduct.OfFiniteGroups.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+directproduct.OfFiniteGroups.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+directproduct.OfFiniteGroups.identity` -- Monoid identity element
%    - `~+replab.+directproduct.OfFiniteGroups.inverse` -- Computes the inverse of an element
%    - `~+replab.+directproduct.OfFiniteGroups.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+directproduct.OfFiniteGroups.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+directproduct.OfFiniteGroups.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+directproduct.OfFiniteGroups.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+directproduct.OfFiniteGroups.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+directproduct.OfFiniteGroups.longStr` -- Multi-line description of the current object
%    - `~+replab.+directproduct.OfFiniteGroups.nFactors` -- 
%    - `~+replab.+directproduct.OfFiniteGroups.nGenerators` -- Returns the number of group generators
%    - `~+replab.+directproduct.OfFiniteGroups.order` -- Returns the group order
%    - `~+replab.+directproduct.OfFiniteGroups.order_` -- vpi: Cached group order
%    - `~+replab.+directproduct.OfFiniteGroups.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+directproduct.OfFiniteGroups.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+directproduct.OfFiniteGroups.requiredType` -- 
%    - `~+replab.+directproduct.OfFiniteGroups.sample` -- Samples an element from this domain
%    - `~+replab.+directproduct.OfFiniteGroups.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+directproduct.OfFiniteGroups.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+directproduct.OfFiniteGroups.shortStr` -- Single line text description of the current object
%    - `~+replab.+directproduct.OfFiniteGroups.tensorRep` -- Constructs a tensor product representation
%    - `~+replab.+directproduct.OfFiniteGroups.tensorRepFun` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfFiniteGroups.tensorRepFunWithIndex` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfFiniteGroups.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: OfCompactGroups
%
%       Documentation in :meth:`+replab.+directproduct.OfCompactGroups.OfCompactGroups`
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
%    .. method:: factor
%
%       No documentation
%
%    .. attribute:: factors
%
%       Documentation in :attr:`+replab.+directproduct.OfCompactGroups.factors`
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
%    .. method:: nFactors
%
%       No documentation
%
%    .. method:: nGenerators
%
%       Documentation in :meth:`+replab.FiniteGroup.nGenerators`
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
%    .. method:: requiredType
%
%       No documentation
%
%    .. method:: semidirectProduct
%
%       Documentation in :meth:`+replab.CompactGroup.semidirectProduct`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
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
% .. raw:: html
%
%    <h3>Own members</h3>

    
    methods (Access = protected)
        
        function g = atFun(self, ind)
        % See comments in self.elements
            g = self.identity;
            ind = ind - 1;
            for i = self.nFactors:-1:1
                f = self.factor(i);
                this = mod(ind, f.order);
                ind = (ind - this)/f.order;
                g{i} = f.elements.at(this + 1);
            end
        end
        
        function ind = findFun(self, g)
        % See comments in self.elements
            ind = vpi(0);
            for i = 1:self.nFactors
                f = self.factor(i);
                ind = ind * f.order;
                ind = ind + f.elements.find(g{i}) - 1;
            end
            ind = ind + 1;
        end

    end
    
    methods
        
        function self = OfFiniteGroups(factors)
            self = self@replab.directproduct.OfCompactGroups(factors);
            % the generators of a direct product of finite groups is
            % the union of the generators of the factors, lifted into the
            % proper tuples
            generators = {};
            for i = 1:length(factors)
                factor = factors{i};
                for j = 1:factor.nGenerators
                    generator = self.identity;
                    generator{i} = factor.generator(j);
                    generators{1, end+1} = generator;
                end
            end
            self.generators = generators;
        end
        
        %% Str methods

        function names = hiddenFields(self)
            names = replab.str.uniqueNames( ...
                hiddenFields@replab.directproduct.OfCompactGroups(self), ...
                hiddenFields@replab.FiniteGroup(self) ...
                );
        end
        
        function [names values] = additionalFields(self)
            [names1 values1] = additionalFields@replab.directproduct.OfCompactGroups(self);
            [names2 values2] = additionalFields@replab.FiniteGroup(self);
            names = replab.str.horzcatForce(names1, names2);
            values = replab.str.horzcatForce(values1, values2);
        end
        
        %% Domain methods
        
        function g = sample(self)
            g = sample@replab.directproduct.OfCompactGroups(self); % force method selection
        end
        
        %% CompactGroup methods
        
        function g = sampleUniformly(self)
            g = sampleUniformly@replab.directproduct.OfCompactGroups(self); % force method selection
        end

        %% FiniteGroup methods
        
        function o = order(self)
            o = vpi(1);
            % The order of a direct product is the product of the
            % order of the factors
            for i = 1:self.nFactors
                o = o * self.factor(i).order;
            end
        end
                
        function e = elements(self)
            e = replab.IndexedFamily.lambda(self.order, ...
                                            @(ind) self.atFun(ind), ...
                                            @(g) self.findFun(g));
            % The elements of a direct product of finite groups can be
            % enumerated by considering the direct product as a cartesian
            % product of sets, and decomposing the index a la ind2sub/sub2ind
            % which is the role of the `atFun` and `findFun` functions
        end
        
        function gd = decomposition(self)
            T = {};
            % The decomposition of a direct product into sets
            % is simply the concatenation of the sequence of sets
            % corresponding to each factor
            for i = 1:self.nFactors
                D = self.factor(i).decomposition.T;
                Ti = cell(1, length(D));
                for j = 1:length(D)
                    Dj = D{j};
                    Tij = cell(1, length(Dj));
                    for k = 1:length(Dj)
                       Djk = Dj{k};
                       Tijk = self.identity;
                       Tijk{i} = Djk;
                       Tij{k} = Tijk;
                    end
                    Ti{j} = Tij;
                end
                T = horzcat(T, Ti);
            end
            gd = replab.FiniteGroupDecomposition(self, T);
        end
        
    end
    
end
