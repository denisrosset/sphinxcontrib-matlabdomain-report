classdef ImprimitiveRep < replab.Rep
% Imprimitive representation of a wreath product group
%
% See `replab.wreathproduct.Common.imprimitiveRep`
%
% See `replab.wreathproduct.PrimitiveRep`
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+wreathproduct.ImprimitiveRep.Arep` -- replab.Rep: Representation of the group whose copies are acted upon
%    - `~+replab.+wreathproduct.ImprimitiveRep.ImprimitiveRep` -- Constructs an imprimitive representation of a wreath product group
%    - `~+replab.+wreathproduct.ImprimitiveRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+wreathproduct.ImprimitiveRep.blkdiag` -- Direct sum of representations
%    - `~+replab.+wreathproduct.ImprimitiveRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.commutant_` -- 
%    - `~+replab.+wreathproduct.ImprimitiveRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.decomposition_` -- 
%    - `~+replab.+wreathproduct.ImprimitiveRep.dimension` -- integer: Representation dimension
%    - `~+replab.+wreathproduct.ImprimitiveRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+wreathproduct.ImprimitiveRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.disp` -- 
%    - `~+replab.+wreathproduct.ImprimitiveRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.eq` -- Equality test
%    - `~+replab.+wreathproduct.ImprimitiveRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+wreathproduct.ImprimitiveRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+wreathproduct.ImprimitiveRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+wreathproduct.ImprimitiveRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+wreathproduct.ImprimitiveRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+wreathproduct.ImprimitiveRep.image` -- Returns the image of a group element
%    - `~+replab.+wreathproduct.ImprimitiveRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+wreathproduct.ImprimitiveRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+wreathproduct.ImprimitiveRep.kron` -- Tensor product of representations
%    - `~+replab.+wreathproduct.ImprimitiveRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+wreathproduct.ImprimitiveRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.longStr` -- Multi-line description of the current object
%    - `~+replab.+wreathproduct.ImprimitiveRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.+wreathproduct.ImprimitiveRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.+wreathproduct.ImprimitiveRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+wreathproduct.ImprimitiveRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+wreathproduct.ImprimitiveRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.shortStr` -- Single line text description of the current object
%    - `~+replab.+wreathproduct.ImprimitiveRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+wreathproduct.ImprimitiveRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+wreathproduct.ImprimitiveRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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
        
        function self = ImprimitiveRep(group, Arep)
        % Constructs an imprimitive representation of a wreath product group
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
            self.dimension = n*dA;
            self.isUnitary = Arep.isUnitary;
            self.field = Arep.field;
            self.group = group;
        end
        
        function rho = image(self, g)
            h = g{1};
            base = g{2};
            n = length(h);
            rhos = arrayfun(@(i) self.Arep.image(base{i}), 1:n, 'uniform', 0);
            rho = blkdiag(rhos{:});
            dA = self.Arep.dimension;
            rho = kron(sparse(h, 1:n, ones(1,n), n, n), speye(dA)) * rho;
            rho = full(rho);
        end
        
    end
    
end
