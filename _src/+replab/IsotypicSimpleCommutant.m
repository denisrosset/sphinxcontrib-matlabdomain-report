classdef IsotypicSimpleCommutant < replab.IsotypicCommutant
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IsotypicSimpleCommutant.Commutant` -- 
%    - `~+replab.IsotypicSimpleCommutant.IsotypicCommutant` -- 
%    - `~+replab.IsotypicSimpleCommutant.IsotypicSimpleCommutant` -- 
%    - `~+replab.IsotypicSimpleCommutant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IsotypicSimpleCommutant.assertEqv` -- Compares two elements for equality
%    - `~+replab.IsotypicSimpleCommutant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.IsotypicSimpleCommutant.block` -- Returns the block of a matrix projected in the commutant algebra
%    - `~+replab.IsotypicSimpleCommutant.blockFromParent` -- Changes the basis and projects a block on this isotypic component
%    - `~+replab.IsotypicSimpleCommutant.disp` -- 
%    - `~+replab.IsotypicSimpleCommutant.divisionAlgebraDimension` -- integer: Size of a block in the division algebra encoding
%    - `~+replab.IsotypicSimpleCommutant.eq` -- Equality test
%    - `~+replab.IsotypicSimpleCommutant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.IsotypicSimpleCommutant.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.IsotypicSimpleCommutant.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.IsotypicSimpleCommutant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IsotypicSimpleCommutant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IsotypicSimpleCommutant.lambda` -- Constructs a domain from function handles
%    - `~+replab.IsotypicSimpleCommutant.longStr` -- Multi-line description of the current object
%    - `~+replab.IsotypicSimpleCommutant.n` -- integer: Commutant dimension
%    - `~+replab.IsotypicSimpleCommutant.parent` -- replab.Domain: Domain of generic real/complex matrices
%    - `~+replab.IsotypicSimpleCommutant.project` -- Projects any n x n matrix in the invariant subspace
%    - `~+replab.IsotypicSimpleCommutant.projectAndReduce` -- Projects the given matrix in the commutant algebra and removes its inherent redundancy
%    - `~+replab.IsotypicSimpleCommutant.projectAndReduceFromParent` -- Projects the given matrix given in the parent representation space and removes its redundancy
%    - `~+replab.IsotypicSimpleCommutant.reducedBlockSize` -- Returns the size of a commutant algebra element block, without repetition
%    - `~+replab.IsotypicSimpleCommutant.rep` -- replab.Rep: Representation that this algebra commutes with
%    - `~+replab.IsotypicSimpleCommutant.sample` -- Samples a generic matrix from this commutant algebra
%    - `~+replab.IsotypicSimpleCommutant.shortStr` -- Single line text description of the current object
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
        
        function self = IsotypicSimpleCommutant(isotypic)
            self = self@replab.IsotypicCommutant(isotypic);
            self.divisionAlgebraDimension = 1;
        end
        
        function X1 = block(self, X)
        % Returns the block of a matrix projected in the commutant algebra
        %
        % Args:
        %   X (double): Matrix to project on this commutant algebra
        %
        % Returns:
        %   double: The projected block
            m = self.rep.multiplicity;
            id = self.rep.irrepDimension;
            X1 = zeros(m, m);
            for i = 1:id
                X1 = X1 + X(i:id:m*id, i:id:m*id);
            end
            X1 = X1/id;
        end
        
        function X1 = blockFromParent(self, X) 
        % Changes the basis and projects a block on this isotypic component
        %
        % Args:
        %   X (double): Matrix to project on this commutant algebra in the basis of the original representation
        %
        % Returns:
        %   double: Block corresponding to the isotypic component
            m = self.rep.multiplicity;
            id = self.rep.irrepDimension;
            U = self.rep.U;
            X1 = zeros(m, m);
            for i = 1:id
                U1 = U(i:id:m*id, :);
                X1 = X1 + U1*X*U1';
            end
            X1 = X1/id;
        end
        
        function X1 = projectAndReduce(self, X)
            X1 = self.block(X);
        end
        
        function X1 = projectAndReduceFromParent(self, X)
            X1 = self.blockFromParent(X);
        end
        
        function X1 = project(self, X)
            X1 = kron(self.block(X), eye(self.rep.irrepDimension));
        end
        
    end
    
end
