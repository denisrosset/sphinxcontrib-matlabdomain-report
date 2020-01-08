classdef QuaternionTypeMatrices < replab.domain.VectorSpace
% Represents a vector space of real matrices that encode quaternion entries
%
% A quaternion is written q = a + b*i + c*j + d*k, with
%     i^2 = j^2 = k^2 = ijk = -1.
%
% Such a quaternion q can be encoded in a matrix algebra as such: 
%
% [a -b -c -d
%  b  a -d  c
%  c  d  a -b
%  d -c  b  a]
%
% There are 48 such encodings, see https://en.wikipedia.org/wiki/Quaternion#Matrix_representations
%
% We use the encoding in John Vince, Quaternions for Computer Graphics, Springer 2011, page 67
% also given in Maehara and Murota, doi:10.1007/s13160-010-0007-8
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+domain.QuaternionTypeMatrices.QuaternionTypeMatrices` -- 
%    - `~+replab.+domain.QuaternionTypeMatrices.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+domain.QuaternionTypeMatrices.assertEqv` -- Compares two elements for equality
%    - `~+replab.+domain.QuaternionTypeMatrices.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+domain.QuaternionTypeMatrices.disp` -- 
%    - `~+replab.+domain.QuaternionTypeMatrices.eq` -- Equality test
%    - `~+replab.+domain.QuaternionTypeMatrices.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+domain.QuaternionTypeMatrices.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.+domain.QuaternionTypeMatrices.fromMatrix` -- Given a matrix encoding quaternion coefficient blocks, returns the quaternion elements
%    - `~+replab.+domain.QuaternionTypeMatrices.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+domain.QuaternionTypeMatrices.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+domain.QuaternionTypeMatrices.lambda` -- Constructs a domain from function handles
%    - `~+replab.+domain.QuaternionTypeMatrices.longStr` -- Multi-line description of the current object
%    - `~+replab.+domain.QuaternionTypeMatrices.nC` -- integer: Column size, must be a multiple of 4
%    - `~+replab.+domain.QuaternionTypeMatrices.nR` -- integer: Row size, must be a multiple of 4
%    - `~+replab.+domain.QuaternionTypeMatrices.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.+domain.QuaternionTypeMatrices.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.+domain.QuaternionTypeMatrices.project` -- Projects a generic matrix
%    - `~+replab.+domain.QuaternionTypeMatrices.sample` -- Samples an element from this domain
%    - `~+replab.+domain.QuaternionTypeMatrices.shortStr` -- Single line text description of the current object
%    - `~+replab.+domain.QuaternionTypeMatrices.toMatrix` -- Returns the quaternion matrix encoding the given quaternion coefficients
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
        nR % integer: Row size, must be a multiple of 4
        nC % integer: Column size, must be a multiple of 4
    end

    methods

        function self = QuaternionTypeMatrices(nR, nC)
            assert(mod(nR, 4) == 0);
            assert(mod(nC, 4) == 0);
            self.nR = nR;
            self.nC = nC;
            self.field = 'R';
        end

        %% Str methods

        function s = headerStr(self)
            s = sprintf('%d x %d real matrices encoding quaternion coefficient blocks', self.nR, self.nC);
        end

        %% Domain methods

        function b = eqv(self, X, Y)
            b = ~replab.isNonZeroMatrix(X - Y, replab.Parameters.doubleEigTol);
        end

        function X = sample(self)
            A = randn(self.nR/4, self.nC/4);
            B = randn(self.nR/4, self.nC/4);
            C = randn(self.nR/4, self.nC/4);
            D = randn(self.nR/4, self.nC/4);
            X = replab.domain.QuaternionTypeMatrices.toMatrix(A, B, C, D)
        end

    end

    methods (Static)

        function M = project(M)
        % Projects a generic matrix
            [A B C D] = replab.domain.QuaternionTypeMatrices.fromMatrix(M);
            M = replab.domain.QuaternionTypeMatrices.toMatrix(A, B, C, D);
        end

        function [A B C D] = fromMatrix(M)
        % Given a matrix encoding quaternion coefficient blocks, returns the quaternion elements
        %
        % Args:
        %   M (double matrix): Matrix part of a `replab.domain.QuaternionTypeMatrices` domain
        %
        % Returns
        % -------
        %   A: double matrix
        %     Real part
        %   B: double matrix
        %     Pure quaternion part 'i'
        %   C: double matrix
        %     Pure quaternion part 'j'
        %   D: double matrix
        %     Pure quaternion part 'k'
            nR = size(M, 1);
            nC = size(M, 2);
            assert(mod(nR, 4) == 0);
            assert(mod(nC, 4) == 0);
            A = (M(1:4:nR, 1:4:nC) + M(2:4:nR, 2:4:nC) + M(3:4:nR, 3:4:nC) + M(4:4:nR, 4:4:nC))/4;
            B = (M(2:4:nR, 1:4:nC) - M(1:4:nR, 2:4:nC) + M(4:4:nR, 3:4:nC) - M(3:4:nR, 4:4:nC))/4;
            C = (M(3:4:nR, 1:4:nC) - M(1:4:nR, 3:4:nC) + M(2:4:nR, 4:4:nC) - M(4:4:nR, 2:4:nC))/4;
            D = (M(4:4:nR, 1:4:nC) + M(3:4:nR, 2:4:nC) - M(2:4:nR, 3:4:nC) - M(1:4:nR, 4:4:nC))/4;
        end

        function M = toMatrix(A, B, C, D)
        % Returns the quaternion matrix encoding the given quaternion coefficients
        %
        % The quaternion is implicitly given as Q = A + B i + C j + D k
        %
        % Args:
        %   A (double matrix): Real part
        %   B (double matrix): Pure quaternion 'i' part
        %   C (double matrix): Pure quaternion 'j' part
        %   D (double matrix): Pure quaternion 'k' part
        %
        % Returns:
        %   double matrix: The matrix encoding the quaternion coefficient blocks
            basisA = [ 1  0  0  0
                       0  1  0  0
                       0  0  1  0
                       0  0  0  1];
            basisB = [ 0 -1  0  0
                       1  0  0  0
                       0  0  0 -1
                       0  0  1  0];
            basisC = [ 0  0 -1  0
                       0  0  0  1
                       1  0  0  0
                       0 -1  0  0];
            basisD = [ 0  0  0 -1
                       0  0 -1  0
                       0  1  0  0
                       1  0  0  0];
            if issparse(A) && issparse(B) && issparse(C) && issparse(D)
                basisA = sparse(basisA);
                basisB = sparse(basisB);
                basisC = sparse(basisC);
                basisD = sparse(basisD);
            end
            M = kron(A, basisA) + kron(B, basisB) + kron(C, basisC) + kron(D, basisD);
        end

    end

end
