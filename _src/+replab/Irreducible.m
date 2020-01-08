classdef Irreducible < replab.SubRep
% Describes the irreducible decomposition of a representation
%
% For the background, see Section 2.6 of Jean-Pierre Serre, Linear representations of finite groups
%
% The irreducible decomposition of `parent` contains isotypic components in the cell vector `components`.
% Each isotypic component corresponds to a set of equivalent irreducible representations expressed in the same basis.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Irreducible.Irreducible` -- 
%    - `~+replab.Irreducible.SubRep` -- Constructs a subrepresentation of a parent representation
%    - `~+replab.Irreducible.U` -- double matrix, can be sparse: Unitary basis of dimension dChild x dParent
%    - `~+replab.Irreducible.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Irreducible.asConjugateRep` -- Returns the block-diagonal representation corresponding to the decomposition
%    - `~+replab.Irreducible.blkdiag` -- Direct sum of representations
%    - `~+replab.Irreducible.collapseParent` -- Collapses the subrepresentation of a subrepresentation
%    - `~+replab.Irreducible.commutant` -- Returns the commutant of this representation
%    - `~+replab.Irreducible.commutant_` -- 
%    - `~+replab.Irreducible.complexification` -- Returns the complexification of a real representation
%    - `~+replab.Irreducible.component` -- Returns a particular isotypic component in the decomposition
%    - `~+replab.Irreducible.components` -- row cell array of replab.Isotypic: Isotypic components
%    - `~+replab.Irreducible.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.Irreducible.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.Irreducible.decomposition_` -- 
%    - `~+replab.Irreducible.dimension` -- integer: Representation dimension
%    - `~+replab.Irreducible.directSum` -- Computes the direct sum of subrepresentations of the same parent representation
%    - `~+replab.Irreducible.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.Irreducible.disp` -- 
%    - `~+replab.Irreducible.dual` -- Returns the dual representation of this representation
%    - `~+replab.Irreducible.eq` -- Equality test
%    - `~+replab.Irreducible.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.Irreducible.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.Irreducible.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.Irreducible.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Irreducible.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Irreducible.image` -- Returns the image of a group element
%    - `~+replab.Irreducible.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.Irreducible.irrep` -- Returns a subrepresentation in the irreducible decomposition
%    - `~+replab.Irreducible.irrepInfo` -- replab.IrrepInfo or []: Irreducible status information
%    - `~+replab.Irreducible.isKnownCanonicalIrreducible` -- Returns whether this subrepresentation is known to be irreducible and in the canonical division algebra basis
%    - `~+replab.Irreducible.isKnownIrreducible` -- Returns whether this subrepresentation is known to be irreducible
%    - `~+replab.Irreducible.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.Irreducible.kron` -- Tensor product of representations
%    - `~+replab.Irreducible.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.Irreducible.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.Irreducible.longStr` -- Multi-line description of the current object
%    - `~+replab.Irreducible.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.Irreducible.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.Irreducible.nComponents` -- Returns the number of isotypic components in the decomposition
%    - `~+replab.Irreducible.niceBasis` -- replab.NiceBasis: Nice decomposition of the basis
%    - `~+replab.Irreducible.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.Irreducible.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.Irreducible.parent` -- replab.Rep: Parent representation
%    - `~+replab.Irreducible.projector` -- Returns the projector on this subrepresentation
%    - `~+replab.Irreducible.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.Irreducible.shortStr` -- Single line text description of the current object
%    - `~+replab.Irreducible.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.Irreducible.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.Irreducible.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.Irreducible.tensor` -- Computes the tensor product of representations
%    - `~+replab.Irreducible.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.Irreducible.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.Irreducible.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
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
        components % row cell array of replab.Isotypic: Isotypic components
    end
    
    methods

        function self = Irreducible(parent, components)
            assert(isequal(parent.isUnitary, true));
            for i = 1:length(components)
                c = components{i};
                assert(isa(c, 'replab.Isotypic'));
            end
            Us = cellfun(@(iso) iso.U, components, 'uniform', 0);
            U = vertcat(Us{:});
            nbs = cellfun(@(iso) iso.niceBasis, components, 'uniform', 0);
            niceBasis = replab.NiceBasis.vertcat(nbs);
            self = self@replab.SubRep(parent, U, niceBasis);
            self.components = components;
        end
        
        function r = asConjugateRep(self)
        % Returns the block-diagonal representation corresponding to the decomposition
        %
        % Up to the change of basis matrix `self.U`, it corresponds to the representation `parent`.
        % Indeed, we have ``self.asRep.image(g) = U * self.parent.image(g) * U'``.
        %
        % The returned representation is a conjugate of the parent representation, so it does
        % not look as clean as `self.asRep`. For efficiency and numerical stability, use `self.asRep`.
        %
        % Returns:
        %   replab.Rep: The block-diagonal representation as a left conjugate representation
            r = self.parent.leftConjugateUnitary(self.U);
        end

        function n = nComponents(self)
        % Returns the number of isotypic components in the decomposition
        %
        % Returns:
        %   integer: Number of isotypoic components
            n = length(self.components);
        end
        
        function c = component(self, i)
        % Returns a particular isotypic component in the decomposition
        %
        % Args:
        %   i (logical): Index of the isotypic component
        %
        % Returns:
        %   replab.Isotypic: The `i`-th isotypic component
            c = self.components{i};
        end
        
        function r = irrep(self, i, j)
        % Returns a subrepresentation in the irreducible decomposition
        %
        % Args:
        %   i (integer): Index of the isotypic component
        %   j (integer, optional): Index of the copy in the `i`-th isotypic component
        %                          Default value is `1`.
        %
        % Returns:
        %   replab.SubRep: An irreducible subrepresentation
            if nargin < 3
                j = 1;
            end
            r = self.component(i).irrep(j);
        end
        
        %% Str methods
        
        function names = hiddenFields(self)
            names = hiddenFields@replab.SubRep(self);
            names{1, end+1} = 'components';
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.SubRep(self);
            for i = 1:self.nComponents
                names{1, end+1} = sprintf('component(%d)', i);
                values{1, end+1} = self.component(i);
            end
        end
        
        %% Rep methods
        
        function rho = image(self, g)
            blocks = cellfun(@(iso) iso.image(g), self.components, 'uniform', 0);
            % Construct the blocks in the block diagonal image
            rho = blkdiag(blocks{:});
        end

        function c = commutant(self)
            if isempty(self.commutant_)
                self.commutant_ = replab.IrreducibleCommutant(self);
            end
            c = self.commutant_;
        end
        
    end

end
