classdef SubRepNU < replab.Rep
% Describes a subrepresentation of a unitary finite representation
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.SubRepNU.F` -- Map from the parent to this representation
%    - `~+replab.SubRepNU.H` -- Map from this representation to the parent representation
%    - `~+replab.SubRepNU.SubRepNU` -- 
%    - `~+replab.SubRepNU.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.SubRepNU.blkdiag` -- Direct sum of representations
%    - `~+replab.SubRepNU.collapseParent` -- Returns this subrepresentation as expressed in self.parent.parent
%    - `~+replab.SubRepNU.commutant` -- Returns the commutant of this representation
%    - `~+replab.SubRepNU.commutant_` -- 
%    - `~+replab.SubRepNU.complexification` -- Returns the complexification of a real representation
%    - `~+replab.SubRepNU.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.SubRepNU.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.SubRepNU.decomposition_` -- 
%    - `~+replab.SubRepNU.dimension` -- integer: Representation dimension
%    - `~+replab.SubRepNU.directSum` -- Computes the direct sum of representations
%    - `~+replab.SubRepNU.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.SubRepNU.disp` -- 
%    - `~+replab.SubRepNU.dual` -- Returns the dual representation of this representation
%    - `~+replab.SubRepNU.eq` -- Equality test
%    - `~+replab.SubRepNU.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.SubRepNU.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.SubRepNU.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.SubRepNU.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.SubRepNU.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.SubRepNU.image` -- Returns F rho(g) H
%    - `~+replab.SubRepNU.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.SubRepNU.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.SubRepNU.kron` -- Tensor product of representations
%    - `~+replab.SubRepNU.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.SubRepNU.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.SubRepNU.longStr` -- Multi-line description of the current object
%    - `~+replab.SubRepNU.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.SubRepNU.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.SubRepNU.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.SubRepNU.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.SubRepNU.parent` -- Parent representation
%    - `~+replab.SubRepNU.projector` -- Returns the projector on this subrepresentation
%    - `~+replab.SubRepNU.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.SubRepNU.shortStr` -- Single line text description of the current object
%    - `~+replab.SubRepNU.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.SubRepNU.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.SubRepNU.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.SubRepNU.tensor` -- Computes the tensor product of representations
%    - `~+replab.SubRepNU.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.SubRepNU.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.SubRepNU.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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
%    .. method:: unitaryChangeOfBasis
%
%       Documentation in :meth:`+replab.Rep.unitaryChangeOfBasis`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        parent % Parent representation
        F      % Map from the parent to this representation
        H      % Map from this representation to the parent representation
    end
    
    methods
        
        function self = SubRepNU(parent, F, H)
            d = size(F, 1);
            dParent = size(F, 2);
            assert(size(H, 1) == dParent);
            assert(size(H, 2) == d);
            assert(parent.dimension == dParent);
            self.group = parent.group;
            self.field = parent.field;
            self.dimension = d;
            self.parent = parent;
            self.F = F;
            self.H = H;
        end

        function s = headerStr(self)
            s = 'Subrepresentation';
        end
        
        function P = projector(self)
        % Returns the projector on this subrepresentation
        %
        % The projector is expressed in the parent representation
            P = self.H*self.F;
        end
        
        function newSub = collapseParent(self)
        % Returns this subrepresentation as expressed in self.parent.parent
            assert(isa(self.parent, 'replab.NUSubRep'));
            % self W, parent V, parent.parent U
            % self.F: V -> W
            % self.H: W -> V
            % self.parent.F: U -> V
            % self.parent.H: V -> U
            % newF: U -> W
            % newH: W -> U
            newF = self.F * self.parent.F;
            newH = self.parent.H * self.H;
            newSub = self.parent.parent.subRep(newF, newH);
        end
        
        function rho = image(self, g)
        % Returns F rho(g) H
            rho = self.F * self.parent.image(g) * self.H;
        end
        
        function [newRep A Ainv] = unitarize(self)
            if isequal(self.parent.isUnitary, true)
                X = self.F * self.F';
                A = chol(X, 'lower');
                U = inv(A) * self.F;
                newRep = self.parent.subRepUnitary(U);
            else
                [newRep A Ainv] = unitarize@replab.Rep(self);
            end
        end
        
    end

end
