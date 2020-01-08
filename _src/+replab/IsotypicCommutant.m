classdef IsotypicCommutant < replab.Commutant
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IsotypicCommutant.Commutant` -- 
%    - `~+replab.IsotypicCommutant.IsotypicCommutant` -- 
%    - `~+replab.IsotypicCommutant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IsotypicCommutant.assertEqv` -- Compares two elements for equality
%    - `~+replab.IsotypicCommutant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.IsotypicCommutant.disp` -- 
%    - `~+replab.IsotypicCommutant.divisionAlgebraDimension` -- integer: Size of a block in the division algebra encoding
%    - `~+replab.IsotypicCommutant.eq` -- Equality test
%    - `~+replab.IsotypicCommutant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.IsotypicCommutant.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.IsotypicCommutant.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.IsotypicCommutant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IsotypicCommutant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IsotypicCommutant.lambda` -- Constructs a domain from function handles
%    - `~+replab.IsotypicCommutant.longStr` -- Multi-line description of the current object
%    - `~+replab.IsotypicCommutant.n` -- integer: Commutant dimension
%    - `~+replab.IsotypicCommutant.parent` -- replab.Domain: Domain of generic real/complex matrices
%    - `~+replab.IsotypicCommutant.project` -- Projects any n x n matrix in the invariant subspace
%    - `~+replab.IsotypicCommutant.projectAndReduce` -- Projects the given matrix in the commutant algebra and removes its inherent redundancy
%    - `~+replab.IsotypicCommutant.projectAndReduceFromParent` -- Projects the given matrix given in the parent representation space and removes its redundancy
%    - `~+replab.IsotypicCommutant.reducedBlockSize` -- Returns the size of a commutant algebra element block, without repetition
%    - `~+replab.IsotypicCommutant.rep` -- replab.Rep: Representation that this algebra commutes with
%    - `~+replab.IsotypicCommutant.sample` -- Samples a generic matrix from this commutant algebra
%    - `~+replab.IsotypicCommutant.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: Commutant
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
%    .. method:: project
%
%       Documentation in :meth:`+replab.Commutant.project`
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


    properties
        divisionAlgebraDimension % integer: Size of a block in the division algebra encoding
    end
    
    methods
        
        function self = IsotypicCommutant(isotypic)
            self = self@replab.Commutant(isotypic);
        end
        
        function s = reducedBlockSize(self)
        % Returns the size of a commutant algebra element block, without repetition
            s = self.rep.multiplicity * self.divisionAlgebraDimension;
        end
        
        function block = projectAndReduce(self, X)
        % Projects the given matrix in the commutant algebra and removes its inherent redundancy
        %
        % Args:
        %   X (double): Matrix in the isotypic component space
        %
        % Returns:
        %   double: The corresponding block of size `self.reducedBlockSize`, 
        %           removing the redundancy due to the irrep dimension
            error('Abstract');
        end
        
        function block = projectAndReduceFromParent(self, X)
        % Projects the given matrix given in the parent representation space and removes its redundancy
        %
        % Args:
        %   X (double): Matrix in the parent representation space
        %
        % Returns:
        %   double: The projected block of size `self.reducedBlockSize` corresponding
        %           to this isotypic component, having removed the redundancy due to the irrep dimension
            U = self.rep.U;
            block = self.projectAndReduce(U*X*U');
        end

    end
    
end
