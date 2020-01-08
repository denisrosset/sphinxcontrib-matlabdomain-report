classdef IndexRelabelingRep < replab.Rep
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+rep.IndexRelabelingRep.IndexRelabelingRep` -- 
%    - `~+replab.+rep.IndexRelabelingRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+rep.IndexRelabelingRep.blkdiag` -- Direct sum of representations
%    - `~+replab.+rep.IndexRelabelingRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+rep.IndexRelabelingRep.commutant_` -- 
%    - `~+replab.+rep.IndexRelabelingRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+rep.IndexRelabelingRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+rep.IndexRelabelingRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+rep.IndexRelabelingRep.decomposition_` -- 
%    - `~+replab.+rep.IndexRelabelingRep.dimension` -- integer: Representation dimension
%    - `~+replab.+rep.IndexRelabelingRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+rep.IndexRelabelingRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+rep.IndexRelabelingRep.disp` -- 
%    - `~+replab.+rep.IndexRelabelingRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+rep.IndexRelabelingRep.eq` -- Equality test
%    - `~+replab.+rep.IndexRelabelingRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+rep.IndexRelabelingRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+rep.IndexRelabelingRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+rep.IndexRelabelingRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+rep.IndexRelabelingRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+rep.IndexRelabelingRep.image` -- Returns the image of a group element
%    - `~+replab.+rep.IndexRelabelingRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+rep.IndexRelabelingRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+rep.IndexRelabelingRep.kron` -- Tensor product of representations
%    - `~+replab.+rep.IndexRelabelingRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+rep.IndexRelabelingRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+rep.IndexRelabelingRep.localDimension` -- dimension of each subsystem in the tensor space
%    - `~+replab.+rep.IndexRelabelingRep.longStr` -- Multi-line description of the current object
%    - `~+replab.+rep.IndexRelabelingRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.+rep.IndexRelabelingRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.+rep.IndexRelabelingRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+rep.IndexRelabelingRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+rep.IndexRelabelingRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+rep.IndexRelabelingRep.shortStr` -- Single line text description of the current object
%    - `~+replab.+rep.IndexRelabelingRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+rep.IndexRelabelingRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.IndexRelabelingRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.IndexRelabelingRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+rep.IndexRelabelingRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+rep.IndexRelabelingRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+rep.IndexRelabelingRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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

    
    properties
        localDimension; % dimension of each subsystem in the tensor space
    end
    
    methods
        
        function self = IndexRelabelingRep(group, localDimension)
            assert(isa(group, 'replab.PermutationGroup'));
            n = group.domainSize;
            self.group = group;
            self.dimension = localDimension^n;
            self.isUnitary = true;
            self.localDimension = localDimension;
            self.field = 'R';
        end
        
        function rho = image(self, g)
            n = self.group.domainSize;
            d = self.dimension;
            dims = self.localDimension*ones(1, n);
            I = permute(reshape(1:d, dims), g);
            I = I(:)';
            rho = full(sparse(I, 1:d, ones(1, d), d, d));
        end
        
    end

end
