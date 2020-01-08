classdef SelfAdjointMatrices < replab.domain.VectorSpace
% Describes the vector space of n x n symmetric/Hermitian matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+domain.SelfAdjointMatrices.SelfAdjointMatrices` -- 
%    - `~+replab.+domain.SelfAdjointMatrices.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+domain.SelfAdjointMatrices.assertEqv` -- Compares two elements for equality
%    - `~+replab.+domain.SelfAdjointMatrices.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+domain.SelfAdjointMatrices.disp` -- 
%    - `~+replab.+domain.SelfAdjointMatrices.eq` -- Equality test
%    - `~+replab.+domain.SelfAdjointMatrices.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+domain.SelfAdjointMatrices.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.+domain.SelfAdjointMatrices.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+domain.SelfAdjointMatrices.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+domain.SelfAdjointMatrices.lambda` -- Constructs a domain from function handles
%    - `~+replab.+domain.SelfAdjointMatrices.longStr` -- Multi-line description of the current object
%    - `~+replab.+domain.SelfAdjointMatrices.n` -- integer: Matrix size
%    - `~+replab.+domain.SelfAdjointMatrices.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.+domain.SelfAdjointMatrices.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.+domain.SelfAdjointMatrices.parent` -- 
%    - `~+replab.+domain.SelfAdjointMatrices.sample` -- Samples an element from this domain
%    - `~+replab.+domain.SelfAdjointMatrices.shortStr` -- Single line text description of the current object
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
%    .. attribute:: field
%
%       Documentation in :attr:`+replab.+domain.VectorSpace.field`
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
%    .. method:: overC
%
%       Documentation in :meth:`+replab.+domain.VectorSpace.overC`
%
%    .. method:: overR
%
%       Documentation in :meth:`+replab.+domain.VectorSpace.overR`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        n % integer: Matrix size
    end
    
    properties (Access = protected)
        parent;
    end
    
    methods
        
        %% Own methods
        
        function self = SelfAdjointMatrices(field, n)
            self.n = n;
            self.parent = replab.domain.Matrices(field, n, n);
        end

        %% Str methods
        
        function s = headerStr(self)
            if self.overR
                s = sprintf('%d x %d symmetric real matrices', self.n, self.n);
            elseif self.overC
                s = sprintf('%d x %d Hermitian complex matrices', self.n, self.n);
            end
        end
        
        % Domain
        
        function b = eqv(self, X, Y)
            b = self.parent.eqv(X, Y);
        end
        
        function X = sample(self)
            if self.overR
                % Generates a symmetric matrix with measure invariant under orthogonal transformations,
                % sampled from the Gaussian Orthogonal Ensemble, see
                % http://staff.math.su.se/shapiro/UIUC/random_matrices.pdf
                X = zeros(n, n);
                for r = 1:n
                    % diagonal elements are scaled up by sqrt(2)
                    X(r, r) = randn * sqrt(2);
                    % while other elements are standard normals
                    X(r, r+1:end) = randn(1, n-r);
                    X(r+1:end, r) = X(r, r+1:end);
                end
            elseif self.overC
                % Generates a Hermitian matrix with measure invariant under unitary transformations,
                % sampled from the Gaussian Unitary Ensemble, see
                % http://staff.math.su.se/shapiro/UIUC/random_matrices.pdf
                n = self.n;
                X = zeros(n, n);
                for r = 1:n
                    X(r, r) = randn;
                    X(r, r+1:end) = (randn(1, n-r) + randn(1, n-r)*1i)/sqrt(2);
                    X(r+1:end, r) = conj(X(r, r+1:end));
                end
            end
        end
        
    end

end
