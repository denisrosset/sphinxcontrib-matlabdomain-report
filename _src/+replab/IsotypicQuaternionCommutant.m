classdef IsotypicQuaternionCommutant < replab.IsotypicCommutant
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IsotypicQuaternionCommutant.Commutant` -- 
%    - `~+replab.IsotypicQuaternionCommutant.IsotypicCommutant` -- 
%    - `~+replab.IsotypicQuaternionCommutant.IsotypicQuaternionCommutant` -- 
%    - `~+replab.IsotypicQuaternionCommutant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IsotypicQuaternionCommutant.assertEqv` -- Compares two elements for equality
%    - `~+replab.IsotypicQuaternionCommutant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.IsotypicQuaternionCommutant.basisB` -- 
%    - `~+replab.IsotypicQuaternionCommutant.basisC` -- 
%    - `~+replab.IsotypicQuaternionCommutant.basisD` -- 
%    - `~+replab.IsotypicQuaternionCommutant.block` -- Returns the block of a matrix projected in the commutant algebra
%    - `~+replab.IsotypicQuaternionCommutant.blockFromParent` -- Changes the basis and projects a block on this isotypic component
%    - `~+replab.IsotypicQuaternionCommutant.disp` -- 
%    - `~+replab.IsotypicQuaternionCommutant.divisionAlgebraDimension` -- integer: Size of a block in the division algebra encoding
%    - `~+replab.IsotypicQuaternionCommutant.eq` -- Equality test
%    - `~+replab.IsotypicQuaternionCommutant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.IsotypicQuaternionCommutant.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.IsotypicQuaternionCommutant.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.IsotypicQuaternionCommutant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IsotypicQuaternionCommutant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IsotypicQuaternionCommutant.lambda` -- Constructs a domain from function handles
%    - `~+replab.IsotypicQuaternionCommutant.longStr` -- Multi-line description of the current object
%    - `~+replab.IsotypicQuaternionCommutant.n` -- integer: Commutant dimension
%    - `~+replab.IsotypicQuaternionCommutant.parent` -- replab.Domain: Domain of generic real/complex matrices
%    - `~+replab.IsotypicQuaternionCommutant.project` -- Projects any n x n matrix in the invariant subspace
%    - `~+replab.IsotypicQuaternionCommutant.projectAndReduce` -- Projects the given matrix in the commutant algebra and removes its inherent redundancy
%    - `~+replab.IsotypicQuaternionCommutant.projectAndReduceFromParent` -- Projects the given matrix given in the parent representation space and removes its redundancy
%    - `~+replab.IsotypicQuaternionCommutant.reducedBlockSize` -- Returns the size of a commutant algebra element block, without repetition
%    - `~+replab.IsotypicQuaternionCommutant.rep` -- replab.Rep: Representation that this algebra commutes with
%    - `~+replab.IsotypicQuaternionCommutant.sample` -- Samples a generic matrix from this commutant algebra
%    - `~+replab.IsotypicQuaternionCommutant.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: Commutant
%
%       No documentation
%
%    .. method:: IsotypicCommutant
%
%       No documentation
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
%    .. attribute:: divisionAlgebraDimension
%
%       Documentation in :attr:`+replab.IsotypicCommutant.divisionAlgebraDimension`
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
%
%    .. attribute:: field
%
%       Documentation in :attr:`+replab.Commutant.field`
%
%    .. attribute:: group
%
%       Documentation in :attr:`+replab.Commutant.group`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
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
%    .. attribute:: n
%
%       Documentation in :attr:`+replab.Commutant.n`
%
%    .. attribute:: parent
%
%       Documentation in :attr:`+replab.Commutant.parent`
%
%    .. method:: reducedBlockSize
%
%       Documentation in :meth:`+replab.IsotypicCommutant.reducedBlockSize`
%
%    .. attribute:: rep
%
%       Documentation in :attr:`+replab.Commutant.rep`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Commutant.sample`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    methods
        
        function self = IsotypicQuaternionCommutant(isotypic)
            self = self@replab.IsotypicCommutant(isotypic);
            self.divisionAlgebraDimension = 4;
        end

        function [A B C D] = block(self, X)
        % Returns the block of a matrix projected in the commutant algebra
        %
        % Args:
        %   X (double): Matrix to project on this commutant algebra
        %
        % Returns
        % -------
        %   A:
        %    double: The real part of the projected block
        %   B:
        %    double: The 'i' part of the projected block
        %   C:
        %    double: The 'j' part of the projected block
        %   D:
        %    double: The 'k' part of the projected block
            m = self.rep.multiplicity;
            id = self.rep.irrepDimension;
            A = zeros(m, m);
            B = zeros(m, m);
            C = zeros(m, m);
            D = zeros(m, m);
            for i = 1:4:id
                r1 = i:id:m*id;
                r2 = (i:id:m*id)+1;
                r3 = (i:id:m*id)+2;
                r4 = (i:id:m*id)+3;
                A = A + X(r1,r1) + X(r2,r2) + X(r3,r3) + X(r4,r4);
                B = B + X(r2,r1) - X(r1,r2) - X(r4,r3) + X(r3,r4);
                C = C + X(r3,r1) - X(r1,r3) - X(r2,r4) + X(r4,r2);
                D = D + X(r4,r1) - X(r3,r2) + X(r2,r3) - X(r1,r4);
            end
            A = A/id;
            B = B/id;
            C = C/id;
            D = D/id;
        end
        
        function [A B C D] = blockFromParent(self, X)
        % Changes the basis and projects a block on this isotypic component
        %
        % Args:
        %   X (double): Matrix to project on this commutant algebra in the basis of the original representation
        %
        % Returns
        % -------
        %   A:
        %    double: The real part of the projected block
        %   B:
        %    double: The 'i' part of the projected block
        %   C:
        %    double: The 'j' part of the projected block
        %   D:
        %    double: The 'k' part of the projected block
            m = self.rep.multiplicity;
            id = self.rep.irrepDimension;
            U = self.rep.U;
            A = zeros(m, m);
            B = zeros(m, m);
            C = zeros(m, m);
            D = zeros(m, m);
            % shape of things that commute with our representation quaternion encoding
            % [ a -b -c -d
            %   b  a  d -c
            %   c -d  a  b
            %   d  c -b  a]
            for i = 1:4:id
                U1 = U((i:id:m*id), :);
                U2 = U((i:id:m*id)+1, :);
                U3 = U((i:id:m*id)+2, :);
                U4 = U((i:id:m*id)+3, :);
                A = A + U1*X*U1' + U2*X*U2' + U3*X*U3' + U4*X*U4';
                B = B + U2*X*U1' - U1*X*U2' - U4*X*U3' + U3*X*U4';
                C = C + U3*X*U1' - U1*X*U3' - U2*X*U4' + U4*X*U2';
                D = D + U4*X*U1' - U3*X*U2' + U2*X*U3' - U1*X*U4';
            end
            A = A/id;
            B = B/id;
            C = C/id;
            D = D/id;
        end
        
        function X1 = projectAndReduceFromParent(self, X)
            [A B C D] = self.blockFromParent(X);
            X1 = kron(A, eye(2)) + kron(B, self.basisB) + kron(C, self.basisC) + kron(D, self.basisD);
        end

        function X1 = projectAndReduce(self, X)
            [A B C D] = self.block(X);
            X1 = kron(A, eye(2)) + kron(B, self.basisB) + kron(C, self.basisC) + kron(D, self.basisD);
        end
        
        function X1 = project(self, X)
            id = self.rep.irrepDimension;
            [A B C D] = self.block(X);
            basisA = eye(id);
            basisB = kron(eye(id/4), self.basisB);
            basisC = kron(eye(id/4), self.basisC);
            basisD = kron(eye(id/4), self.basisD);
            X1 = kron(A, basisA) + kron(B, basisB) + kron(C, basisC) + kron(D, basisD);
        end
        
    end

    methods (Static)
        
        function X = basisB
            X = [ 0 -1  0  0
                  1  0  0  0
                  0  0  0  1
                  0  0 -1  0];
        end
        
        function X = basisC
            X = [ 0  0 -1  0
                  0  0  0 -1
                  1  0  0  0
                  0  1  0  0];
        end
        
        function X = basisD
            X = [ 0  0  0 -1
                  0  0  1  0
                  0 -1  0  0
                  1  0  0  0];
        end
        
    end
    
end
