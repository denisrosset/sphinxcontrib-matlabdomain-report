classdef Equivariant < replab.Domain
% Describes a vector space of group-equivariant matrices
%
% Let repR and repC be two representations of the same group G.
%
% This describes the set of matrices X such that repR.image(g) * X = X * repC.image(g)
%
% See Proposition 4 of 
% J.-P. Serre, Linear Representations of Finite Groups (Springer, 1977).
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Equivariant.Equivariant` -- Constructor; use `replab.makeEquivariant(repR, repC)` in user code
%    - `~+replab.Equivariant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Equivariant.assertEqv` -- Compares two elements for equality
%    - `~+replab.Equivariant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.Equivariant.disp` -- 
%    - `~+replab.Equivariant.eq` -- Equality test
%    - `~+replab.Equivariant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.Equivariant.field` -- {'R', 'C'}: field of the vector space real (R) or complex x(C)
%    - `~+replab.Equivariant.group` -- replab.CompactGroup: group being represented
%    - `~+replab.Equivariant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Equivariant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Equivariant.isEquivariant` -- Returns whether the matrix X represents an equivariant linear map
%    - `~+replab.Equivariant.lambda` -- Constructs a domain from function handles
%    - `~+replab.Equivariant.longStr` -- Multi-line description of the current object
%    - `~+replab.Equivariant.nC` -- integer: column size
%    - `~+replab.Equivariant.nR` -- integer: row size
%    - `~+replab.Equivariant.parent` -- parent domain, real or complex matrices
%    - `~+replab.Equivariant.project` -- Projects any nR x nC matrix in the equivariant subspace
%    - `~+replab.Equivariant.repC` -- replab.Rep: representation of column space
%    - `~+replab.Equivariant.repR` -- replab.Rep: representation of row space
%    - `~+replab.Equivariant.sample` -- Samples an element from this domain
%    - `~+replab.Equivariant.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: assertEqv
%
%       Documentation in :meth:`+replab.Domain.assertEqv`
%
%    .. method:: assertNotEqv
%
%       Documentation in :meth:`+replab.Domain.assertNotEqv`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Domain.lambda`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        field % {'R', 'C'}: field of the vector space real (R) or complex x(C)
        nR % integer: row size
        nC % integer: column size
        group % replab.CompactGroup: group being represented
        repR % replab.Rep: representation of row space
        repC % replab.Rep: representation of column space
    end
    
    properties (Access = protected)
        parent % parent domain, real or complex matrices
    end
    
    methods

        
        %% Abstract
        
        function b = isEquivariant(self, X)
        % Returns whether the matrix X represents an equivariant linear map
        %
        % Args:
        %   X: Candidate equivariant linear map
        %
        % Returns:
        %   logical: Whether the given linear map is equivariant
            b = self.parent.eqv(X, self.project(X));
        end
        
        function X1 = project(self, X)
        % Projects any nR x nC matrix in the equivariant subspace
        %
        % Performs the integration
        %
        % `` X1 = int{g in G} dg rhoR.image(g) * X * rhoC.inverseImage(g) ``
            error('Abstract');
        end

        function self = Equivariant(repR, repC)
        % Constructor; use `replab.makeEquivariant(repR, repC)` in user code
        %
        % It can eventually select an optimized implementation depending on the use case.
            self.repR = repR;
            self.nR = repR.dimension;
            self.repC = repC;
            self.nC = repC.dimension;
            assert(isequal(repR.field, repC.field), ...
                   'Both representations must have be defined on the same field');
            self.field = repR.field;
            assert(repR.group == repC.group, ...
                   'Both representations must be defined on the same group');
            self.group = repR.group;
            self.parent = replab.domain.Matrices(self.field, self.nR, self.nC);
        end

        %% Str methods
        
        function s = headerStr(self)
            s = sprintf('%d x %d %s equivariant matrices', ...
                        self.nR, self.nC, ...
                        replab.str.field(self.field));
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = self.parent.eqv(X, Y);
        end
        
        function X = sample(self)
            X = self.project(self.parent.sample);
        end
        
    end
    
end
