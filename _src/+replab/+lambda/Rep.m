classdef Rep < replab.Rep
% An implementation of a representation defined by image functions
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lambda.Rep.Rep` -- 
%    - `~+replab.+lambda.Rep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+lambda.Rep.blkdiag` -- Direct sum of representations
%    - `~+replab.+lambda.Rep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+lambda.Rep.commutant_` -- 
%    - `~+replab.+lambda.Rep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+lambda.Rep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+lambda.Rep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+lambda.Rep.decomposition_` -- 
%    - `~+replab.+lambda.Rep.dimension` -- integer: Representation dimension
%    - `~+replab.+lambda.Rep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+lambda.Rep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+lambda.Rep.disp` -- 
%    - `~+replab.+lambda.Rep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+lambda.Rep.eq` -- Equality test
%    - `~+replab.+lambda.Rep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+lambda.Rep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+lambda.Rep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+lambda.Rep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+lambda.Rep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+lambda.Rep.image` -- Returns the image of a group element
%    - `~+replab.+lambda.Rep.imageFun` -- function_handle: Image function
%    - `~+replab.+lambda.Rep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+lambda.Rep.inverseImageFun` -- function_handle: Inverse image function
%    - `~+replab.+lambda.Rep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+lambda.Rep.kron` -- Tensor product of representations
%    - `~+replab.+lambda.Rep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+lambda.Rep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+lambda.Rep.longStr` -- Multi-line description of the current object
%    - `~+replab.+lambda.Rep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.+lambda.Rep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.+lambda.Rep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+lambda.Rep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+lambda.Rep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+lambda.Rep.shortStr` -- Single line text description of the current object
%    - `~+replab.+lambda.Rep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+lambda.Rep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+lambda.Rep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+lambda.Rep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+lambda.Rep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+lambda.Rep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+lambda.Rep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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
        imageFun % function_handle: Image function
        inverseImageFun % function_handle: Inverse image function
    end
    
    methods
        
        function self = Rep(group, field, dimension, isUnitary, imageFun, inverseImageFun)
            assert(isa(group, 'replab.Group'));
            self.group = group;
            self.field = field;
            self.dimension = dimension;
            self.isUnitary = isUnitary;
            self.imageFun = imageFun;
            self.inverseImageFun = inverseImageFun;
        end

        function rho = image(self, g)
            f = self.imageFun;
            rho = f(g);
        end
        
        function rho = inverseImage(self, g)
            f = self.inverseImageFun;
            if isempty(f)
                gInv = self.group.inverse(g);
                rho = self.image(gInv);
            else
                rho = f(g);
            end
        end
       
    end
    
end
