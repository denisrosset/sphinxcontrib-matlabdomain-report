classdef IsotypicComplexCommutant < replab.IsotypicCommutant
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IsotypicComplexCommutant.Commutant` -- 
%    - `~+replab.IsotypicComplexCommutant.IsotypicCommutant` -- 
%    - `~+replab.IsotypicComplexCommutant.IsotypicComplexCommutant` -- 
%    - `~+replab.IsotypicComplexCommutant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IsotypicComplexCommutant.assertEqv` -- Compares two elements for equality
%    - `~+replab.IsotypicComplexCommutant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.IsotypicComplexCommutant.block` -- Returns the block of a matrix projected in the commutant algebra
%    - `~+replab.IsotypicComplexCommutant.blockFromParent` -- Changes the basis and projects a block on this isotypic component
%    - `~+replab.IsotypicComplexCommutant.disp` -- 
%    - `~+replab.IsotypicComplexCommutant.divisionAlgebraDimension` -- integer: Size of a block in the division algebra encoding
%    - `~+replab.IsotypicComplexCommutant.eq` -- Equality test
%    - `~+replab.IsotypicComplexCommutant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.IsotypicComplexCommutant.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.IsotypicComplexCommutant.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.IsotypicComplexCommutant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IsotypicComplexCommutant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IsotypicComplexCommutant.lambda` -- Constructs a domain from function handles
%    - `~+replab.IsotypicComplexCommutant.longStr` -- Multi-line description of the current object
%    - `~+replab.IsotypicComplexCommutant.n` -- integer: Commutant dimension
%    - `~+replab.IsotypicComplexCommutant.parent` -- replab.Domain: Domain of generic real/complex matrices
%    - `~+replab.IsotypicComplexCommutant.project` -- Projects any n x n matrix in the invariant subspace
%    - `~+replab.IsotypicComplexCommutant.projectAndReduce` -- Projects the given matrix in the commutant algebra and removes its inherent redundancy
%    - `~+replab.IsotypicComplexCommutant.projectAndReduceFromParent` -- Projects the given matrix given in the parent representation space and removes its redundancy
%    - `~+replab.IsotypicComplexCommutant.reducedBlockSize` -- Returns the size of a commutant algebra element block, without repetition
%    - `~+replab.IsotypicComplexCommutant.rep` -- replab.Rep: Representation that this algebra commutes with
%    - `~+replab.IsotypicComplexCommutant.sample` -- Samples a generic matrix from this commutant algebra
%    - `~+replab.IsotypicComplexCommutant.shortStr` -- Single line text description of the current object
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
        
        function self = IsotypicComplexCommutant(isotypic)
            self = self@replab.IsotypicCommutant(isotypic);
            self.divisionAlgebraDimension = 2;
        end
        
        function [A B] = block(self, X)
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
        %    double: The imaginary part of the projected block
            m = self.rep.multiplicity;
            id = self.rep.irrepDimension;
            A = zeros(m, m);
            B = zeros(m, m);
            for i = 1:2:id
                r = i:id:m*id;
                A = A + X(r, r) + X(r+1, r+1);
                B = B + X(r+1, r) - X(r, r+1);
            end
            A = A/id;
            B = B/id;
        end
        
        function [A B] = blockFromParent(self, X)
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
        %    double: The imaginary part of the projected block
            m = self.rep.multiplicity;
            id = self.rep.irrepDimension;
            U = self.rep.U;
            A = zeros(m, m);
            B = zeros(m, m);
            for i = 1:2:id
                U1 = U(shift+(i:id:m*id), :);
                U2 = U(shift+(i:id:m*id)+1, :);
                A = A + U1*X*U1' + U2*X*U2';
                B = B + U2*X*U1' - U1*X*U2';
            end
            A = A/id;
            B = B/id;
        end
        
        function X1 = projectAndReduceFromParent(self, X)
            [A B] = self.blockFromParent(X);
            X1 = kron(A, eye(2)) + kron(B, [0 -1; 1 0]);
        end
        
        function X1 = projectAndReduce(self, X)
            [A B] = self.block(X);
            X1 = kron(A, eye(2)) + kron(B, [0 -1; 1 0]);
        end
        
        function X1 = project(self, X)
            id = self.rep.irrepDimension;
            [A B] = self.block(X);
            X1 = kron(A, eye(id)) + kron(B, kron(eye(id/2), [0 -1; 1 0]));
        end
        
    end
    
end
