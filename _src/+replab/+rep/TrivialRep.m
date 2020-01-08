classdef TrivialRep < replab.Rep
% Describes d copies of the real or complex trivial representation of a group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+rep.TrivialRep.TrivialRep` -- 
%    - `~+replab.+rep.TrivialRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+rep.TrivialRep.blkdiag` -- Direct sum of representations
%    - `~+replab.+rep.TrivialRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+rep.TrivialRep.commutant_` -- 
%    - `~+replab.+rep.TrivialRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+rep.TrivialRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+rep.TrivialRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+rep.TrivialRep.decomposition_` -- 
%    - `~+replab.+rep.TrivialRep.dimension` -- integer: Representation dimension
%    - `~+replab.+rep.TrivialRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+rep.TrivialRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+rep.TrivialRep.disp` -- 
%    - `~+replab.+rep.TrivialRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+rep.TrivialRep.eq` -- Equality test
%    - `~+replab.+rep.TrivialRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+rep.TrivialRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+rep.TrivialRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+rep.TrivialRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+rep.TrivialRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+rep.TrivialRep.identity` -- Stored copy of the identity matrix
%    - `~+replab.+rep.TrivialRep.image` -- Returns the image of a group element
%    - `~+replab.+rep.TrivialRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+rep.TrivialRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+rep.TrivialRep.kron` -- Tensor product of representations
%    - `~+replab.+rep.TrivialRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+rep.TrivialRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+rep.TrivialRep.longStr` -- Multi-line description of the current object
%    - `~+replab.+rep.TrivialRep.matrixColAction` -- do nothing to M
%    - `~+replab.+rep.TrivialRep.matrixRowAction` -- do nothing to M
%    - `~+replab.+rep.TrivialRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+rep.TrivialRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+rep.TrivialRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+rep.TrivialRep.shortStr` -- Single line text description of the current object
%    - `~+replab.+rep.TrivialRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+rep.TrivialRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.TrivialRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.TrivialRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+rep.TrivialRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+rep.TrivialRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+rep.TrivialRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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
%    .. method:: overC
%
%       Documentation in :meth:`+replab.Rep.overC`
%
%    .. method:: overR
%
%       Documentation in :meth:`+replab.Rep.overR`
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
        identity % Stored copy of the identity matrix
    end
    
    methods
        
        function self = TrivialRep(group, field, dimension)
            assert(isa(group, 'replab.CompactGroup'));
            self.group = group;
            self.field = field;
            self.dimension = dimension;
            self.isUnitary = true;
            self.identity = eye(self.dimension);
        end
        
        %% Rep methods
       
        function rho = image(self, g)
            rho = self.identity;
        end
        
        function rho = inverseImage(self, g)
            rho = self.identity;
        end

        function rho = sample(self)
            rho = self.identity;
        end            
        
        function M = matrixRowAction(self, g, M)
        % do nothing to M
        end
        
        function M = matrixColAction(self, g, M)
        % do nothing to M
        end
        
        function complexRep = complexification(self)
            assert(self.overR, 'Representation should be real to start with');
            complexRep = replab.rep.TrivialRep(self.group, 'C', self.dimension);
        end
        
        function rep = conj(self)
            rep = self;
        end
        
        function rep = dual(self)
            rep = self;
        end
        
    end
            
end
