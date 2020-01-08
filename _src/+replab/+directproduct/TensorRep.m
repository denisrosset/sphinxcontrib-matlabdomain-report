classdef TensorRep < replab.Rep
% Representation of a direct product using a tensor product of factor representations
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+directproduct.TensorRep.TensorRep` -- Constructs a representation of a direct product
%    - `~+replab.+directproduct.TensorRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+directproduct.TensorRep.blkdiag` -- Direct sum of representations
%    - `~+replab.+directproduct.TensorRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+directproduct.TensorRep.commutant_` -- 
%    - `~+replab.+directproduct.TensorRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+directproduct.TensorRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+directproduct.TensorRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+directproduct.TensorRep.decomposition_` -- 
%    - `~+replab.+directproduct.TensorRep.dimension` -- integer: Representation dimension
%    - `~+replab.+directproduct.TensorRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+directproduct.TensorRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+directproduct.TensorRep.disp` -- 
%    - `~+replab.+directproduct.TensorRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+directproduct.TensorRep.eq` -- Equality test
%    - `~+replab.+directproduct.TensorRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+directproduct.TensorRep.factorReps` -- row cell array of replab.Rep: Representations of factors
%    - `~+replab.+directproduct.TensorRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+directproduct.TensorRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+directproduct.TensorRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+directproduct.TensorRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+directproduct.TensorRep.image` -- Returns the image of a group element
%    - `~+replab.+directproduct.TensorRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+directproduct.TensorRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+directproduct.TensorRep.kron` -- Tensor product of representations
%    - `~+replab.+directproduct.TensorRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+directproduct.TensorRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+directproduct.TensorRep.longStr` -- Multi-line description of the current object
%    - `~+replab.+directproduct.TensorRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.+directproduct.TensorRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.+directproduct.TensorRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+directproduct.TensorRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+directproduct.TensorRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+directproduct.TensorRep.shortStr` -- Single line text description of the current object
%    - `~+replab.+directproduct.TensorRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+directproduct.TensorRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+directproduct.TensorRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+directproduct.TensorRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+directproduct.TensorRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+directproduct.TensorRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+directproduct.TensorRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
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
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
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

    
    properties (SetAccess = protected)
        factorReps % row cell array of replab.Rep: Representations of factors
    end
    
    methods
        
        function self = TensorRep(group, factorReps, varargin)
        % Constructs a representation of a direct product
        %
        % See `replab.directproduct.OfCompactGroups.tensorRep`
            
            assert(isa(group, 'replab.directproduct.OfCompactGroups'));
            n = group.nFactors;
            assert(n >= 1, 'Direct product cannot be empty');
            assert(length(factorReps) == n);
            self.field = factorReps{1}.field;
            self.factorReps = factorReps;
            d = 1;
            for i = 1:n
                assert(factorReps{i}.group == group.factor(i));
                assert(isequal(factorReps{i}.field, self.field));
                d = d * factorReps{i}.dimension;
            end
            self.dimension = d;
            factorRepsAreUnitary = cellfun(@(x) x.isUnitary, factorReps, 'uniform', 0);            
            self.isUnitary = replab.trileanAnd(factorRepsAreUnitary{:});
            self.group = group;
        end
        
        function rho = image(self, g)
            rho = self.factorReps{1}.image(g{1});
            for i = 2:self.group.nFactors
                rho = kron(rho, self.factorReps{i}.image(g{i}));
            end
        end
        
    end
    
end
