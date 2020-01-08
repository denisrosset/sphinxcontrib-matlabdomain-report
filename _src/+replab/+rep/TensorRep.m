classdef TensorRep < replab.Rep
% A tensor product of representations
%
% All factor representations must be defined on the same group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+rep.TensorRep.TensorRep` -- Constructs a tensor representation from a cell array of representations
%    - `~+replab.+rep.TensorRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+rep.TensorRep.blkdiag` -- Direct sum of representations
%    - `~+replab.+rep.TensorRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+rep.TensorRep.commutant_` -- 
%    - `~+replab.+rep.TensorRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+rep.TensorRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+rep.TensorRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+rep.TensorRep.decomposition_` -- 
%    - `~+replab.+rep.TensorRep.dimension` -- integer: Representation dimension
%    - `~+replab.+rep.TensorRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+rep.TensorRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+rep.TensorRep.disp` -- 
%    - `~+replab.+rep.TensorRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+rep.TensorRep.eq` -- Equality test
%    - `~+replab.+rep.TensorRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+rep.TensorRep.factor` -- 
%    - `~+replab.+rep.TensorRep.factors` -- row cell array of replab.Rep: Factor representations
%    - `~+replab.+rep.TensorRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+rep.TensorRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+rep.TensorRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+rep.TensorRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+rep.TensorRep.image` -- Returns the image of a group element
%    - `~+replab.+rep.TensorRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+rep.TensorRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+rep.TensorRep.kron` -- Tensor product of representations
%    - `~+replab.+rep.TensorRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+rep.TensorRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+rep.TensorRep.longStr` -- Multi-line description of the current object
%    - `~+replab.+rep.TensorRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.+rep.TensorRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.+rep.TensorRep.nFactors` -- 
%    - `~+replab.+rep.TensorRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+rep.TensorRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+rep.TensorRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+rep.TensorRep.shortStr` -- Single line text description of the current object
%    - `~+replab.+rep.TensorRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+rep.TensorRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.TensorRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.TensorRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+rep.TensorRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+rep.TensorRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+rep.TensorRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: blkdiag
%
%       Documentation in :meth:`+replab.Rep.blkdiag`
%
%    .. method:: commutant
%
%       Documentation in :meth:`+replab.Rep.commutant`
%
%    .. attribute:: commutant_
%
%       No documentation
%
%    .. method:: complexification
%
%       Documentation in :meth:`+replab.Rep.complexification`
%
%    .. method:: conj
%
%       Documentation in :meth:`+replab.Rep.conj`
%
%    .. method:: decomposition
%
%       Documentation in :meth:`+replab.Rep.decomposition`
%
%    .. attribute:: decomposition_
%
%       No documentation
%
%    .. attribute:: dimension
%
%       Documentation in :attr:`+replab.Rep.dimension`
%
%    .. method:: directSum
%
%       Documentation in :meth:`+replab.Rep.directSum`
%
%    .. method:: directSumOfCopies
%
%       Documentation in :meth:`+replab.Rep.directSumOfCopies`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: dual
%
%       Documentation in :meth:`+replab.Rep.dual`
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: equivariant
%
%       Documentation in :meth:`+replab.Rep.equivariant`
%
%    .. attribute:: field
%
%       Documentation in :attr:`+replab.Rep.field`
%
%    .. attribute:: group
%
%       Documentation in :attr:`+replab.Rep.group`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: inverseImage
%
%       Documentation in :meth:`+replab.Rep.inverseImage`
%
%    .. attribute:: isUnitary
%
%       Documentation in :attr:`+replab.Rep.isUnitary`
%
%    .. method:: kron
%
%       Documentation in :meth:`+replab.Rep.kron`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Rep.lambda`
%
%    .. method:: leftConjugateUnitary
%
%       Documentation in :meth:`+replab.Rep.leftConjugateUnitary`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: matrixColAction
%
%       Documentation in :meth:`+replab.Rep.matrixColAction`
%
%    .. method:: matrixRowAction
%
%       Documentation in :meth:`+replab.Rep.matrixRowAction`
%
%    .. method:: overC
%
%       Documentation in :meth:`+replab.Rep.overC`
%
%    .. method:: overR
%
%       Documentation in :meth:`+replab.Rep.overR`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Rep.sample`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. method:: subRep
%
%       Documentation in :meth:`+replab.Rep.subRep`
%
%    .. method:: subRepUnitary
%
%       Documentation in :meth:`+replab.Rep.subRepUnitary`
%
%    .. method:: subRepUnitaryByIntegerBasis
%
%       Documentation in :meth:`+replab.Rep.subRepUnitaryByIntegerBasis`
%
%    .. method:: tensor
%
%       Documentation in :meth:`+replab.Rep.tensor`
%
%    .. method:: tensorPower
%
%       Documentation in :meth:`+replab.Rep.tensorPower`
%
%    .. method:: unitarize
%
%       Documentation in :meth:`+replab.Rep.unitarize`
%
%    .. method:: unitaryChangeOfBasis
%
%       Documentation in :meth:`+replab.Rep.unitaryChangeOfBasis`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        factors % row cell array of replab.Rep: Factor representations
    end
    
    methods
        
        function self = TensorRep(factors)
        % Constructs a tensor representation from a cell array of representations
        %
        % All the subrepresentations should be defined on the same group, and on the same field.
        %
        % Args:
        %   blocks (row cell array of replab.Rep): Factor representations
            assert(length(factors) >= 1);
            d = 1;
            for i = 1:length(factors)
                assert(isa(factors{i}, 'replab.Rep'));
                d = d * factors{i}.dimension;
            end
            self.dimension = d;
            factorsAreUnitary = cellfun(@(x) x.isUnitary, factors, 'uniform', 0);
            self.isUnitary = replab.trileanAnd(factorsAreUnitary{:});
            for i = 2:length(factors)
                assert(factors{1}.group == factors{i}.group);
                assert(isequal(factors{1}.field, factors{i}.field));
            end
            self.factors = factors;
            self.group = factors{1}.group;
            self.field = factors{1}.field;
        end
        
        function n = nFactors(self)
            n = length(self.factors);
        end
        
        function factor = factor(self, i)
            factor = self.factors{i};
        end
        
        % Str
        
        function names = hiddenFields(self)
            names = hiddenFields@replab.Rep(self);
            names{1, end+1} = 'factors';
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Rep(self);
            for i = 1:self.nFactors
                names{1, end+1} = sprintf('factor(%d)', i);
                values{1, end+1} = self.factor(i);
            end
        end
        
        % Rep
        
        function rho = image(self, g)
            rho = self.factors{1}.image(g);
            for i = 2:self.nFactors
                rho = kron(rho, self.factors{i}.image(g));
            end
        end
        
    end
end
