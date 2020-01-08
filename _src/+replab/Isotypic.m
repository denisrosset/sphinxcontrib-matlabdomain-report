classdef Isotypic < replab.SubRep
% Describes an isotypic component in the decomposition of a representation
%
% It is expressed as a subrepresentation of the representation being decomposed, however
% key methods are implemented more efficiently as more structure is available. In particular
% the computation of images is done in a way that minimizes numerical error and returns
% true block diagonal matrices.
%
% An isotypic component regroups equivalent irreducible representations, expressed in the same basis.
% Note that if the multiplicity is not one, there is a degeneracy in the basis of the copies, and
% the particular basis choosen is not deterministic.
%
% However the subspace spanned by an isotypic component as a whole is unique.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Isotypic.Isotypic` -- 
%    - `~+replab.Isotypic.SubRep` -- Constructs a subrepresentation of a parent representation
%    - `~+replab.Isotypic.U` -- double matrix, can be sparse: Unitary basis of dimension dChild x dParent
%    - `~+replab.Isotypic.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Isotypic.blkdiag` -- Direct sum of representations
%    - `~+replab.Isotypic.collapseParent` -- Collapses the subrepresentation of a subrepresentation
%    - `~+replab.Isotypic.commutant` -- Returns the commutant of this representation
%    - `~+replab.Isotypic.commutant_` -- 
%    - `~+replab.Isotypic.complexification` -- Returns the complexification of a real representation
%    - `~+replab.Isotypic.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.Isotypic.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.Isotypic.decomposition_` -- 
%    - `~+replab.Isotypic.dimension` -- integer: Representation dimension
%    - `~+replab.Isotypic.directSum` -- Computes the direct sum of subrepresentations of the same parent representation
%    - `~+replab.Isotypic.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.Isotypic.disp` -- 
%    - `~+replab.Isotypic.dual` -- Returns the dual representation of this representation
%    - `~+replab.Isotypic.eq` -- Equality test
%    - `~+replab.Isotypic.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.Isotypic.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.Isotypic.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.Isotypic.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Isotypic.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Isotypic.image` -- Returns the image of a group element
%    - `~+replab.Isotypic.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.Isotypic.irrep` -- Returns the i-th copy of the irreducible representation
%    - `~+replab.Isotypic.irrepDimension` -- integer: Dimension of each irreducible representation in this component
%    - `~+replab.Isotypic.irrepInfo` -- replab.IrrepInfo or []: Irreducible status information
%    - `~+replab.Isotypic.irreps` -- row cell array of `.SubRep`: Equivalent irreducible subrepresentations in this isotypic component
%    - `~+replab.Isotypic.isKnownCanonicalIrreducible` -- Returns whether this subrepresentation is known to be irreducible and in the canonical division algebra basis
%    - `~+replab.Isotypic.isKnownIrreducible` -- Returns whether this subrepresentation is known to be irreducible
%    - `~+replab.Isotypic.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.Isotypic.kron` -- Tensor product of representations
%    - `~+replab.Isotypic.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.Isotypic.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.Isotypic.longStr` -- Multi-line description of the current object
%    - `~+replab.Isotypic.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.Isotypic.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.Isotypic.multiplicity` -- integer: Number of equivalent irreducible representations in this isotypic component
%    - `~+replab.Isotypic.nIrreps` -- Returns the number of irreps = the multiplicity
%    - `~+replab.Isotypic.niceBasis` -- replab.NiceBasis: Nice decomposition of the basis
%    - `~+replab.Isotypic.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.Isotypic.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.Isotypic.parent` -- replab.Rep: Parent representation
%    - `~+replab.Isotypic.projector` -- Returns the projector on this subrepresentation
%    - `~+replab.Isotypic.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.Isotypic.shortStr` -- Single line text description of the current object
%    - `~+replab.Isotypic.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.Isotypic.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.Isotypic.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.Isotypic.tensor` -- Computes the tensor product of representations
%    - `~+replab.Isotypic.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.Isotypic.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.Isotypic.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: SubRep
%
%       Documentation in :meth:`+replab.SubRep.SubRep`
%
%    .. attribute:: U
%
%       Documentation in :attr:`+replab.SubRep.U`
%
%    .. method:: blkdiag
%
%       Documentation in :meth:`+replab.Rep.blkdiag`
%
%    .. method:: collapseParent
%
%       Documentation in :meth:`+replab.SubRep.collapseParent`
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
%       Documentation in :meth:`+replab.SubRep.directSum`
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
%    .. method:: inverseImage
%
%       Documentation in :meth:`+replab.Rep.inverseImage`
%
%    .. attribute:: irrepInfo
%
%       Documentation in :attr:`+replab.SubRep.irrepInfo`
%
%    .. method:: isKnownCanonicalIrreducible
%
%       Documentation in :meth:`+replab.SubRep.isKnownCanonicalIrreducible`
%
%    .. method:: isKnownIrreducible
%
%       Documentation in :meth:`+replab.SubRep.isKnownIrreducible`
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
%    .. attribute:: niceBasis
%
%       Documentation in :attr:`+replab.SubRep.niceBasis`
%
%    .. method:: overC
%
%       Documentation in :meth:`+replab.Rep.overC`
%
%    .. method:: overR
%
%       Documentation in :meth:`+replab.Rep.overR`
%
%    .. attribute:: parent
%
%       Documentation in :attr:`+replab.SubRep.parent`
%
%    .. method:: projector
%
%       Documentation in :meth:`+replab.SubRep.projector`
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
        irreps % row cell array of `.SubRep`: Equivalent irreducible subrepresentations in this isotypic component
        multiplicity % integer: Number of equivalent irreducible representations in this isotypic component
        irrepDimension % integer: Dimension of each irreducible representation in this component
    end
    
    methods
        
        function self = Isotypic(parent, irreps)
            assert(length(irreps) >= 1, 'Isotypic component cannot be empty');
            assert(isa(parent, 'replab.Rep'));
            for i = 1:length(irreps)
                ci = irreps{i};
                assert(isa(ci, 'replab.SubRep'));
                assert(ci.isKnownCanonicalIrreducible);
            end
            Us = cellfun(@(sr) sr.U, irreps, 'uniform', 0);
            U = vertcat(Us{:});
            nbs = cellfun(@(sr) sr.niceBasis, irreps, 'uniform', 0);
            niceBasis = replab.NiceBasis.vertcat(nbs);
            self = self@replab.SubRep(parent, U, niceBasis);
            self.irreps = irreps;
            self.multiplicity = length(irreps);
            self.irrepDimension = irreps{1}.dimension;
        end
        
        function n = nIrreps(self)
        % Returns the number of irreps = the multiplicity
            n = self.multiplicity;
        end
        
        function c = irrep(self, i)
        % Returns the i-th copy of the irreducible representation
            c = self.irreps{i};
        end
        
        %% Str methods
        
        function names = hiddenFields(self)
            names = hiddenFields@replab.SubRep(self);
            names{1, end+1} = 'irreps';
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.SubRep(self);
            for i = 1:self.nIrreps
                names{1, end+1} = sprintf('irrep(%d)', i);
                values{1, end+1} = self.irrep(i);
            end
        end
        
        function s = headerStr(self)
            if isequal(self.irrep(1).field, 'C')
                rt = 'C';
            else
                rt = self.irrep(1).irrepInfo.divisionAlgebra;
                assert(~isempty(rt));
            end
            if self.multiplicity > 1
                s = sprintf('Isotypic component I(%d)x%s(%d)', self.multiplicity, rt, self.irrepDimension);
            else
                s = sprintf('Isotypic component %s(%d)', rt, self.irrepDimension);
            end
        end
        
        %% Rep methods
        
        function rho = image(self, g)
            p = self.parent.image(g);
            U = self.irrep(1).U;
            rho = U*p*U';
            for i = 2:self.nIrreps
                U = self.irrep(i).U;
                rho = rho + U*p*U';
            end
            rho = rho / self.nIrreps;
            rho = kron(eye(self.nIrreps), rho);
        end
        
        function c = commutant(self)
            if isempty(self.commutant_)
                if self.overC
                    self.commutant_ = replab.IsotypicSimpleCommutant(self);
                else
                    switch self.irrep(1).irrepInfo.divisionAlgebra
                      case 'R'
                        self.commutant_ = replab.IsotypicSimpleCommutant(self);
                      case 'C'
                        self.commutant_ = replab.IsotypicComplexCommutant(self);
                      case 'H'
                        self.commutant_ = replab.IsotypicQuaternionCommutant(self);
                    end
                end
            end
            c = self.commutant_;
        end
        
    end
    
end
