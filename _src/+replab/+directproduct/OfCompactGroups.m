classdef OfCompactGroups < replab.CompactGroup
% Describes an external direct product of groups
%
% The type of the factors depends on the instance of direct product
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+directproduct.OfCompactGroups.OfCompactGroups` -- Constructs a direct product of groups
%    - `~+replab.+directproduct.OfCompactGroups.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+directproduct.OfCompactGroups.assertEqv` -- Compares two elements for equality
%    - `~+replab.+directproduct.OfCompactGroups.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+directproduct.OfCompactGroups.compose` -- Composes two monoid/group elements
%    - `~+replab.+directproduct.OfCompactGroups.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+directproduct.OfCompactGroups.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+directproduct.OfCompactGroups.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+directproduct.OfCompactGroups.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+directproduct.OfCompactGroups.directProduct` -- Returns the direct product of groups
%    - `~+replab.+directproduct.OfCompactGroups.directSumRep` -- Constructs a direct sum representation
%    - `~+replab.+directproduct.OfCompactGroups.directSumRepFun` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfCompactGroups.directSumRepFunWithIndex` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfCompactGroups.disp` -- 
%    - `~+replab.+directproduct.OfCompactGroups.eq` -- Equality test
%    - `~+replab.+directproduct.OfCompactGroups.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+directproduct.OfCompactGroups.factor` -- 
%    - `~+replab.+directproduct.OfCompactGroups.factors` -- row cell array: Factor groups
%    - `~+replab.+directproduct.OfCompactGroups.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+directproduct.OfCompactGroups.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+directproduct.OfCompactGroups.identity` -- Monoid identity element
%    - `~+replab.+directproduct.OfCompactGroups.inverse` -- Computes the inverse of an element
%    - `~+replab.+directproduct.OfCompactGroups.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+directproduct.OfCompactGroups.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+directproduct.OfCompactGroups.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+directproduct.OfCompactGroups.longStr` -- Multi-line description of the current object
%    - `~+replab.+directproduct.OfCompactGroups.nFactors` -- 
%    - `~+replab.+directproduct.OfCompactGroups.requiredType` -- 
%    - `~+replab.+directproduct.OfCompactGroups.sample` -- Samples an element from this domain
%    - `~+replab.+directproduct.OfCompactGroups.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+directproduct.OfCompactGroups.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+directproduct.OfCompactGroups.shortStr` -- Single line text description of the current object
%    - `~+replab.+directproduct.OfCompactGroups.tensorRep` -- Constructs a tensor product representation
%    - `~+replab.+directproduct.OfCompactGroups.tensorRepFun` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfCompactGroups.tensorRepFunWithIndex` -- Constructs a direct sum representation from a function that maps factors to representations
%    - `~+replab.+directproduct.OfCompactGroups.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
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
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. attribute:: identity
%
%       Documentation in :attr:`+replab.Monoid.identity`
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
        factors % row cell array: Factor groups
    end
    
    methods
        
        function self = OfCompactGroups(factors)
        % Constructs a direct product of groups
        %
        % Args:
        %   factors (row cell array): Factor groups
            n = length(factors);
            for i = 1:n
                assert(isa(factors{i}, self.requiredType), ['All factors must be instances of' self.requiredType]);
            end
            self.factors = factors;
            self.identity = cellfun(@(f) f.identity, factors, 'uniform', 0);
        end
        
        function t = requiredType(self)
            t = 'replab.CompactGroup';
        end
        
        function n = nFactors(self)
            n = length(self.factors);
        end
        
        function f = factor(self, i)
            f = self.factors{i};
        end
        
        function rep = directSumRep(self, factorReps)
        % Constructs a direct sum representation
        %
        % Args:
        %   factorReps (row cell array): Representations for each of the factor groups
        %                                i.e. factorReps{i} is a representation of factor(i)
        %
        % Returns:
        %   replab.Rep: A direct sum representation
            rep = replab.directproduct.SumRep(self, factorReps);
        end
        
        function rep = directSumRepFun(self, fun)
        % Constructs a direct sum representation from a function that maps factors to representations
        %
        % Enables constructions such as ``directProduct.sumRepFun(@(x) x.definingRep)``
        %
        % Args:
        %   fun (function_handle): A function valid for each factor group that maps the group to one of
        %                          its representations
        %
        % Returns:
        %   replab.Rep: A direct sum representation
            reps = arrayfun(@(i) fun(self.factor(i)), 1:self.nFactors, 'uniform', 0);
            rep = self.directSumRep(reps);
        end
        
        function rep = directSumRepFunWithIndex(self, fun)
        % Constructs a direct sum representation from a function that maps factors to representations
        %
        % Enables constructions such as ``directProduct.sumRepFunWithIndex(@(x, i) x.definingRep)``
        %
        % Args:
        %   fun (function_handle): A function valid for each factor group that maps the group and its index
        %                          to one of its representations
        %
        % Returns:
        %   replab.Rep: A direct sum representation
            reps = arrayfun(@(i) fun(self.factor(i), i), 1:self.nFactors, 'uniform', 0);
            rep = self.directSumRep(reps);
        end
        
        function rep = tensorRep(self, factorReps)
        % Constructs a tensor product representation
        %
        % Args:
        %   factorReps (row cell array): Representations for each of the factor groups
        %                                i.e. factorReps{i} is a representation of factor(i)
        %
        % Returns:
        %   replab.Rep: A tensor representation
            rep = replab.directproduct.TensorRep(self, factorReps);
        end
        
        function rep = tensorRepFun(self, fun)
        % Constructs a direct sum representation from a function that maps factors to representations
        %
        % Enables constructions such as ``directProduct.tensorRepFun(@(x) x.definingRep)``
        %
        % Args:
        %   fun (function_handle): A function valid for each factor group that maps the group to one of
        %                          its representations
        %
        % Returns:
        %   replab.Rep: A tensor representation
            reps = arrayfun(@(i) fun(self.factor(i)), 1:self.nFactors, 'uniform', 0);
            rep = self.tensorRep(reps);
        end

        function rep = tensorRepFunWithIndex(self, fun)
        % Constructs a direct sum representation from a function that maps factors to representations
        %
        % Enables constructions such as ``directProduct.tensorRepFunWithIndex(@(x, i) x.definingRep)``
        %
        % Args:
        %   fun (function_handle): A function valid for each factor group that maps the group and its index
        %                          to one of its representations
        %
        % Returns:
        %   replab.Rep: A tensor representation
            reps = arrayfun(@(i) fun(self.factor(i), i), 1:self.nFactors, 'uniform', 0);
            rep = self.tensorRep(reps);
        end

        
        %% Str methods
        
        function names = hiddenFields(self)
            names = hiddenFields@replab.CompactGroup(self);
            names{1, end+1} = 'factors';
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.CompactGroup(self);
            for i = 1:self.nFactors
                names{1, end+1} = sprintf('factor(%d)', i);
                values{1, end+1} = self.factor(i);
            end
        end
            
        %% Domain methods
        
        function b = eqv(self, x, y)
            b = true;
            for i = 1:self.nFactors
                if ~self.factor(i).eqv(x{i}, y{i})
                    b = false;
                    return
                end
            end
        end
        
        function g = sample(self)
            g = cell(1, self.nFactors);
            for i = 1:self.nFactors
                g{i} = self.factor(i).sample;
            end
        end
        
        %% Monoid methods

        function z = compose(self, x, y)
            z = cell(1, self.nFactors);
            for i = 1:self.nFactors
                z{i} = self.factor(i).compose(x{i}, y{i});
            end
        end
        
        %% Group methods
        
        function xInv = inverse(self, x)
            xInv = cell(1, self.nFactors);
            for i = 1:self.nFactors
                xInv{i} = self.factor(i).inverse(x{i});
            end
        end
        
        %% CompactGroup methods
        
        function g = sampleUniformly(self)
            g = cell(1, self.nFactors);
            for i = 1:self.nFactors
                g{i} = self.factor(i).sampleUniformly;
            end
        end

    end
    
end
