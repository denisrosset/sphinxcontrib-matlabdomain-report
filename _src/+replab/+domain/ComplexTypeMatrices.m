classdef ComplexTypeMatrices < replab.domain.VectorSpace
% Represents a vector space of real matrices that encode complex entries
%
% A complex number is written c = a + b * i, and can be represented
% by a matrix
%
% [ a -b
%   b  a]
%
% There is an alternative encoding obtained by changing the sign of `b`.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+domain.ComplexTypeMatrices.ComplexTypeMatrices` -- 
%    - `~+replab.+domain.ComplexTypeMatrices.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+domain.ComplexTypeMatrices.assertEqv` -- Compares two elements for equality
%    - `~+replab.+domain.ComplexTypeMatrices.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+domain.ComplexTypeMatrices.disp` -- 
%    - `~+replab.+domain.ComplexTypeMatrices.eq` -- Equality test
%    - `~+replab.+domain.ComplexTypeMatrices.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+domain.ComplexTypeMatrices.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.+domain.ComplexTypeMatrices.fromMatrix` -- Given a matrix encoding complex blocks, returns the complex elements
%    - `~+replab.+domain.ComplexTypeMatrices.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+domain.ComplexTypeMatrices.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+domain.ComplexTypeMatrices.lambda` -- Constructs a domain from function handles
%    - `~+replab.+domain.ComplexTypeMatrices.longStr` -- Multi-line description of the current object
%    - `~+replab.+domain.ComplexTypeMatrices.nC` -- integer: Column size, must be a multiple of 2
%    - `~+replab.+domain.ComplexTypeMatrices.nR` -- integer: Row size, must be a multiple of 2
%    - `~+replab.+domain.ComplexTypeMatrices.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.+domain.ComplexTypeMatrices.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.+domain.ComplexTypeMatrices.project` -- Projects a generic matrix
%    - `~+replab.+domain.ComplexTypeMatrices.sample` -- Samples an element from this domain
%    - `~+replab.+domain.ComplexTypeMatrices.shortStr` -- Single line text description of the current object
%    - `~+replab.+domain.ComplexTypeMatrices.toMatrix` -- Returns the complex type matrix encoding the given complex coefficients
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
        nR % integer: Row size, must be a multiple of 2
        nC % integer: Column size, must be a multiple of 2
    end
    
    methods
        
        function self = ComplexTypeMatrices(nR, nC)
            assert(mod(nR, 2) == 0);
            assert(mod(nC, 2) == 0);
            self.nR = nR;
            self.nC = nC;
            self.field = 'R';
        end
        
        %% Str methods
        
        function s = headerStr(self)
            s = sprintf('%d x %d real matrices encoding complex coefficient blocks', self.nR, self.nC);
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = ~replab.isNonZeroMatrix(X - Y, replab.Parameters.doubleEigTol);
        end
        
        function X = sample(self)
            A = randn(self.nR/2, self.nC/2);
            B = randn(self.nR/2, self.nC/2);
            X = replab.domain.ComplexTypeMatrices.toMatrix(A, B)
        end
        
    end
    
    methods (Static)
        
        function M = project(M)
        % Projects a generic matrix 
            [A B] = replab.domain.ComplexTypeMatrices.fromMatrix(M);
            M = replab.domain.ComplexTypeMatrices.toMatrix(A, B);
        end
        
        function [A B] = fromMatrix(M)
        % Given a matrix encoding complex blocks, returns the complex elements
        %
        % Args:
        %   M (double matrix): Matrix part of a `replab.domain.ComplexTypeMatrices` domain
        %
        % Returns
        % -------
        %   A: double matrix
        %     Real part
        %   B: double matrix
        %     Imaginary part
            nR = size(M, 1);
            nC = size(M, 2);
            assert(mod(nR, 2) == 0);
            assert(mod(nC, 2) == 0);
            A = (M(1:2:nR, 1:2:nC) + M(2:2:nR, 2:2:nC))/2;
            B = (M(2:2:nR, 1:2:nC) - M(1:2:nR, 2:2:nC))/2;
        end
        
        function M = toMatrix(A, B)
        % Returns the complex type matrix encoding the given complex coefficients
        %
        % The complex number is implicitly given as C = A + B i
        %
        % Args:
        %   A (double matrix): Real part
        %   B (double matrix): Imaginary part
        %
        % Returns:
        %   double matrix: The matrix encoding the complex coefficient blocks
            basisA = [ 1  0
                       0  1];
            basisB = [ 0 -1
                       1  0];
            if issparse(A) && issparse(B)
                basisA = sparse(basisA);
                basisB = sparse(basisB);
            end
            M = kron(A, basisA) + kron(B, basisB);
        end
        
    end
    
end
