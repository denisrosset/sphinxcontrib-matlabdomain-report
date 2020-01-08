classdef IrreducibleCommutant < replab.Commutant
% Algebra of matrices that commute with an irreducible decomposition
%
% Note that the `self.rep` property must be of type `replab.Irreducible`.
% TODO: should we repeat a property block with the new documentation for `self.rep`?
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IrreducibleCommutant.Commutant` -- 
%    - `~+replab.IrreducibleCommutant.IrreducibleCommutant` -- 
%    - `~+replab.IrreducibleCommutant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IrreducibleCommutant.assertEqv` -- Compares two elements for equality
%    - `~+replab.IrreducibleCommutant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.IrreducibleCommutant.disp` -- 
%    - `~+replab.IrreducibleCommutant.eq` -- Equality test
%    - `~+replab.IrreducibleCommutant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.IrreducibleCommutant.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.IrreducibleCommutant.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.IrreducibleCommutant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IrreducibleCommutant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IrreducibleCommutant.lambda` -- Constructs a domain from function handles
%    - `~+replab.IrreducibleCommutant.longStr` -- Multi-line description of the current object
%    - `~+replab.IrreducibleCommutant.n` -- integer: Commutant dimension
%    - `~+replab.IrreducibleCommutant.parent` -- replab.Domain: Domain of generic real/complex matrices
%    - `~+replab.IrreducibleCommutant.project` -- Projects any n x n matrix in the invariant subspace
%    - `~+replab.IrreducibleCommutant.projectAndReduce` -- 
%    - `~+replab.IrreducibleCommutant.projectAndReduceFromParent` -- 
%    - `~+replab.IrreducibleCommutant.rep` -- replab.Rep: Representation that this algebra commutes with
%    - `~+replab.IrreducibleCommutant.sample` -- Samples a generic matrix from this commutant algebra
%    - `~+replab.IrreducibleCommutant.shortStr` -- Single line text description of the current object
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
        
        function self = IrreducibleCommutant(irreducible)
            self = self@replab.Commutant(irreducible);
        end
       
        function X = projectAndReduceFromParent(self, X)
            n = self.rep.nComponents;
            blocks = cell(1, n);
            for i = 1:n
                iso = self.rep.component(i);
                blocks{i} = iso.commutant.projectAndReduceFromParent(X);
            end
            X = blkdiag(blocks{:});
        end
        
        function X = projectAndReduce(self, X)
            n = self.rep.nComponents;
            blocks = cell(1, n);
            shift = 0;
            for i = 1:n
                iso = self.rep.component(i);
                r = shift + (1:iso.dimension);
                blocks{i} = iso.commutant.projectAndReduce(X(r, r));
                shift = shift + iso.dimension;
            end
            X = blkdiag(blocks{:});
        end
        
        function X = project(self, X)
            n = self.rep.nComponents;
            blocks = cell(1, n);
            shift = 0;
            for i = 1:n
                iso = self.rep.component(i);
                d = iso.dimension;
                r = shift + (1:d);
                blocks{i} = iso.commutant.project(X(r, r)); 
                shift = shift + iso.dimension;
           end
            X = blkdiag(blocks{:});
        end
        
    end
    
end
