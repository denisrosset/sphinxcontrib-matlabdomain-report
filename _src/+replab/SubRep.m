classdef SubRep < replab.Rep
% Describes a subrepresentation of a unitary finite representation
%
% The subrepresentation is given by the row vectors of the unitary matrix `U`, such that
% ``self.image(g) = U * parent.image(g) * U'``.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.SubRep.SubRep` -- Constructs a subrepresentation of a parent representation
%    - `~+replab.SubRep.U` -- double matrix, can be sparse: Unitary basis of dimension dChild x dParent
%    - `~+replab.SubRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.SubRep.blkdiag` -- Direct sum of representations
%    - `~+replab.SubRep.collapseParent` -- Collapses the subrepresentation of a subrepresentation
%    - `~+replab.SubRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.SubRep.commutant_` -- 
%    - `~+replab.SubRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.SubRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.SubRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.SubRep.decomposition_` -- 
%    - `~+replab.SubRep.dimension` -- integer: Representation dimension
%    - `~+replab.SubRep.directSum` -- Computes the direct sum of subrepresentations of the same parent representation
%    - `~+replab.SubRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.SubRep.disp` -- 
%    - `~+replab.SubRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.SubRep.eq` -- Equality test
%    - `~+replab.SubRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.SubRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.SubRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.SubRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.SubRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.SubRep.image` -- Returns the image of a group element
%    - `~+replab.SubRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.SubRep.irrepInfo` -- replab.IrrepInfo or []: Irreducible status information
%    - `~+replab.SubRep.isKnownCanonicalIrreducible` -- Returns whether this subrepresentation is known to be irreducible and in the canonical division algebra basis
%    - `~+replab.SubRep.isKnownIrreducible` -- Returns whether this subrepresentation is known to be irreducible
%    - `~+replab.SubRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.SubRep.kron` -- Tensor product of representations
%    - `~+replab.SubRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.SubRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.SubRep.longStr` -- Multi-line description of the current object
%    - `~+replab.SubRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.SubRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.SubRep.niceBasis` -- replab.NiceBasis: Nice decomposition of the basis
%    - `~+replab.SubRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.SubRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.SubRep.parent` -- replab.Rep: Parent representation
%    - `~+replab.SubRep.projector` -- Returns the projector on this subrepresentation
%    - `~+replab.SubRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.SubRep.shortStr` -- Single line text description of the current object
%    - `~+replab.SubRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.SubRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.SubRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.SubRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.SubRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.SubRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.SubRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
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
        parent % replab.Rep: Parent representation
        U % double matrix, can be sparse: Unitary basis of dimension dChild x dParent
        niceBasis % replab.NiceBasis: Nice decomposition of the basis
        irrepInfo % replab.IrrepInfo or []: Irreducible status information
                  %
                  %                         This representation is known to be
                  %                         irreducible when this field is non empty
    end
    
    methods
        
        function self = SubRep(parent, U, niceBasis, irrepInfo)
        % Constructs a subrepresentation of a parent representation
        %
        % Args:
        %   parent (replab.Rep): Parent representation of which we construct a subrepresentation
        %   U (double matrix, can be sparse): Basis matrix of dimension dThisChild x dParent
        %   niceBasis (replab.NiceBasis or [], optional): Nice decomposition of the basis `U`
        %   irrepInfo (rpelab.IrrepInfo or [], optional): Irreducible status information
            if nargin < 4
                irrepInfo = [];
            end
            if nargin < 3
                niceBasis = [];
            end
            d = size(U, 1);
            dParent = size(U, 2);
            assert(parent.dimension == dParent, 'Incorrect basis dimension');
            assert(isequal(parent.isUnitary, true), 'We support only unitary representations');
            self.group = parent.group;
            self.field = parent.field;
            self.dimension = d;
            self.parent = parent;
            self.isUnitary = true;
            self.U = U;
            self.niceBasis = niceBasis;
            self.irrepInfo = irrepInfo;
        end
        
        function b = isKnownIrreducible(self)
        % Returns whether this subrepresentation is known to be irreducible
        %
        % Returns:
        %   logical: True if this subrepresentation is known to be irreducible, 
        %            false if it is reducible or status is unknown
            b = ~isempty(self.irrepInfo);
        end
        
        function b = isKnownCanonicalIrreducible(self)
        % Returns whether this subrepresentation is known to be irreducible and in the canonical division algebra basis
        %
        % Returns:
        %   logical: True if this subrepresentation is known to be irreducible and canonical, 
        %            false if it is reducible/not in the canonical basis, or status is unknown
            if isempty(self.irrepInfo)
                b = false;
                return
            end
            if self.overR
                if isempty(self.irrepInfo.divisionAlgebra)
                    b = false;
                    return
                end
                if isequal(self.irrepInfo.divisionAlgebra, 'R')
                    b = true;
                else
                    b = isequal(self.irrepInfo.isDivisionAlgebraCanonical, true);
                end
            else
                b = true;
                return
            end
        end
        
        function P = projector(self)
        % Returns the projector on this subrepresentation
        %
        % Returns:
        %   dense double matrix: The projector on this invariant subspace,
        %                        expressed in the parent representation
            P = full(self.U'*self.U);
        end
        
        function newSub = collapseParent(self)
        % Collapses the subrepresentation of a subrepresentation
        %
        % Note that only one level of subrepresentation is removed, as the action is not
        % performed recursively.
        %
        % Returns:
        %   replab.SubRep: A subrepresentation with parent equal to `self.parent.parent`, which
        %                  has in fine the same basis as `self`
            assert(isa(self.parent, 'replab.SubRep'));
            newU = self.U * self.parent.U;
            if ~isempty(self.niceBasis) && ~isempty(self.parent.niceBasis)
                newNiceBasis = self.niceBasis * self.parent.niceBasis;
            else
                newNiceBasis = [];
            end
            newSub = replab.SubRep(self.parent.parent, newU, newNiceBasis, self.irrepInfo);
        end
        
        %% Str methods
        
        function s = headerStr(self)
            if self.isKnownIrreducible
                if self.overR
                    s = 'Real irreducible subrepresentation';
                    if ~isempty(self.irrepInfo.divisionAlgebra)
                        switch self.irrepInfo.divisionAlgebra
                          case 'R'
                            s = [s ' of real type'];
                          case 'C'
                            s = [s ' of complex type'];
                          case 'H'
                            s = [s ' of quaternionic type'];
                        end
                        if self.irrepInfo.isDivisionAlgebraCanonical
                            s = [s ' in the canonical basis'];
                        end
                    end
                else
                    s = 'Complex irreducible subrepresentation';
                end
            else
                s = 'Subrepresentation';
            end
        end

        function names = hiddenFields(self)
            names = replab.str.uniqueNames( ...
                hiddenFields@replab.Rep(self), ...
                {'U'} ...
                );
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Rep(self);
            if ~isempty(self.niceBasis) && self.niceBasis.isCorrectionDiagonal
                factors = self.niceBasis.normalizationFactors;
                for i = 1:self.dimension
                    v = replab.str.Normalized(self.niceBasis.V(i, :), factors{i});
                    names{1, end+1} = sprintf('U(%d,:)', i);
                    values{1, end+1} = v;
                end
            else
                names{1, end+1} = 'U';
                values{1, end+1} = self.U;
            end
        end
        
        %% Rep methods
        
        function rho = image(self, g)
            rho = full(self.U*self.parent.image(g)*self.U');
        end
        
        function rho = inverseImage(self, g)
            rho = full(self.U*self.parent.inverseImage(g)*self.U');
        end
        
    end

    methods (Static)
        
        function subRep = directSum(subReps)
        % Computes the direct sum of subrepresentations of the same parent representation
        %
        % The subrepresentations must not overlap.
        %
        % Args:
        %   subReps (cell(replab.SubRep)): A row cell array of subrepresentations of the same representation
        %
        % Returns:
        %   replab.SubRep: A block-diagonal subrepresentation composed of the given subrepresentations
            n = length(subReps);
            for i = 2:n
                assert(subReps{i}.parent == subReps{1}.parent, 'Subrepresentations should have the same parent.');
            end
            Us = cellfun(@(sr) sr.U, subReps, 'uniform', 0);
            newU = vertcat(Us{:});
            nbs = cellfun(@(sr) sr.niceBasis, subReps, 'uniform', 0);
            newNiceBasis = replab.NiceBasis.vertcat(nbs);
            subRep = replab.SubRep(subReps{1}.parent, newU, newNiceBasis);
        end
        
    end
    
end
