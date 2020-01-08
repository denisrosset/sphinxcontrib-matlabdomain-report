classdef PrimitiveRep < replab.Rep
% Primitive representation of a wreath product group
%
% See `replab.wreathproduct.Common.primitiveRep`
%
% See `replab.wreathproduct.ImprimitiveRep`
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+wreathproduct.PrimitiveRep.Arep` -- replab.Rep: Representation of the group whose copies are acted upon
%    - `~+replab.+wreathproduct.PrimitiveRep.PrimitiveRep` -- Constructs a primitive representation of a wreath product group
%    - `~+replab.+wreathproduct.PrimitiveRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+wreathproduct.PrimitiveRep.blkdiag` -- Direct sum of representations
%    - `~+replab.+wreathproduct.PrimitiveRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.commutant_` -- 
%    - `~+replab.+wreathproduct.PrimitiveRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+wreathproduct.PrimitiveRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.decomposition_` -- 
%    - `~+replab.+wreathproduct.PrimitiveRep.dimension` -- integer: Representation dimension
%    - `~+replab.+wreathproduct.PrimitiveRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+wreathproduct.PrimitiveRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.disp` -- 
%    - `~+replab.+wreathproduct.PrimitiveRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.eq` -- Equality test
%    - `~+replab.+wreathproduct.PrimitiveRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+wreathproduct.PrimitiveRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+wreathproduct.PrimitiveRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+wreathproduct.PrimitiveRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+wreathproduct.PrimitiveRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+wreathproduct.PrimitiveRep.image` -- Returns the image of a group element
%    - `~+replab.+wreathproduct.PrimitiveRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+wreathproduct.PrimitiveRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+wreathproduct.PrimitiveRep.kron` -- Tensor product of representations
%    - `~+replab.+wreathproduct.PrimitiveRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+wreathproduct.PrimitiveRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.longStr` -- Multi-line description of the current object
%    - `~+replab.+wreathproduct.PrimitiveRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.+wreathproduct.PrimitiveRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.+wreathproduct.PrimitiveRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+wreathproduct.PrimitiveRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+wreathproduct.PrimitiveRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+wreathproduct.PrimitiveRep.shortStr` -- Single line text description of the current object
%    - `~+replab.+wreathproduct.PrimitiveRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+wreathproduct.PrimitiveRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+wreathproduct.PrimitiveRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+wreathproduct.PrimitiveRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+wreathproduct.PrimitiveRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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
        Arep % replab.Rep: Representation of the group whose copies are acted upon
    end
    
    methods
        
        function self = PrimitiveRep(group, Arep)
        % Constructs a primitive representation of a wreath product group
        %
        % Args:
        %   group (replab.wreathproduct.Common): Wreath product group
        %   Arep (replab.Rep): Representation of the wreath product base factor
        %
        % Returns:
        %   replab.Rep: A wreath product group representation
            assert(isa(group, 'replab.wreathproduct.Common'));
            assert(group.A == Arep.group);
            dA = Arep.dimension;
            n = group.H.domainSize;
            self.Arep = Arep;
            self.dimension = dA^n;
            self.isUnitary = Arep.isUnitary;
            self.field = Arep.field;
            self.group = group;
        end
        
        function rho = image(self, g)
            h = g{1};
            base = g{2};
            rho = self.Arep.image(base{1});
            n = self.group.H.domainSize;
            dA = self.Arep.dimension;
            for i = 2:n
                rho = kron(rho, self.Arep.image(base{i}));
            end
            dims = dA * ones(1, n);
            d = self.dimension;
            I = permute(reshape(1:d, dims), fliplr(n + 1 - h));
            I = I(:)';
            rho = sparse(I, 1:d, ones(1, d), d, d) * rho;
            rho = full(rho);
        end
        
    end
    
end
