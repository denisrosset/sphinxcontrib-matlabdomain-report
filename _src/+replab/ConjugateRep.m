classdef ConjugateRep < replab.Rep
% Conjugated representation U * rep * U'
%
% We use left action convention, which means that
% image(g) = U * parent.image(g) * U'
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.ConjugateRep.ConjugateRep` -- 
%    - `~+replab.ConjugateRep.U` -- unitary conjugation matrix
%    - `~+replab.ConjugateRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.ConjugateRep.blkdiag` -- Direct sum of representations
%    - `~+replab.ConjugateRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.ConjugateRep.commutant_` -- 
%    - `~+replab.ConjugateRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.ConjugateRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.ConjugateRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.ConjugateRep.decomposition_` -- 
%    - `~+replab.ConjugateRep.dimension` -- integer: Representation dimension
%    - `~+replab.ConjugateRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.ConjugateRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.ConjugateRep.disp` -- 
%    - `~+replab.ConjugateRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.ConjugateRep.eq` -- Equality test
%    - `~+replab.ConjugateRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.ConjugateRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.ConjugateRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.ConjugateRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.ConjugateRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.ConjugateRep.image` -- Returns the image of a group element
%    - `~+replab.ConjugateRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.ConjugateRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.ConjugateRep.kron` -- Tensor product of representations
%    - `~+replab.ConjugateRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.ConjugateRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.ConjugateRep.longStr` -- Multi-line description of the current object
%    - `~+replab.ConjugateRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.ConjugateRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.ConjugateRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.ConjugateRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.ConjugateRep.parent` -- representation being conjugated
%    - `~+replab.ConjugateRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.ConjugateRep.shortStr` -- Single line text description of the current object
%    - `~+replab.ConjugateRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.ConjugateRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.ConjugateRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.ConjugateRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.ConjugateRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.ConjugateRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.ConjugateRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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
        U % unitary conjugation matrix
        parent % representation being conjugated
    end
    
    methods
                
        function self = ConjugateRep(U, parent)
            switch parent.field
              case 'R'
                assert(isreal(U), 'A real Rep can only be conjugated by a real orthonormal matrix');
              case 'C'
                assert(isa(U, 'double'), 'A complex Rep can only be conjugated by a complex/real unitary matrix');
              otherwise
            end
            assert(size(U, 1) == parent.dimension);
            assert(size(U, 2) == parent.dimension);
            self.group = parent.group;
            self.field = parent.field;
            self.dimension = parent.dimension;
            self.U = U;
            self.parent = parent;
        end

        function s = headerStr(self)
            s = 'Conjugated representation';
        end

        function rho = image(self, g)
            rho = self.U * self.parent.image(g) * self.U';
        end

    end
    
end
