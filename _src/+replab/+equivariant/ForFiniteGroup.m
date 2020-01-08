classdef ForFiniteGroup < replab.Equivariant
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+equivariant.ForFiniteGroup.Equivariant` -- Constructor; use `replab.makeEquivariant(repR, repC)` in user code
%    - `~+replab.+equivariant.ForFiniteGroup.ForFiniteGroup` -- 
%    - `~+replab.+equivariant.ForFiniteGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+equivariant.ForFiniteGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+equivariant.ForFiniteGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+equivariant.ForFiniteGroup.disp` -- 
%    - `~+replab.+equivariant.ForFiniteGroup.eq` -- Equality test
%    - `~+replab.+equivariant.ForFiniteGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+equivariant.ForFiniteGroup.field` -- {'R', 'C'}: field of the vector space real (R) or complex x(C)
%    - `~+replab.+equivariant.ForFiniteGroup.group` -- replab.CompactGroup: group being represented
%    - `~+replab.+equivariant.ForFiniteGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+equivariant.ForFiniteGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+equivariant.ForFiniteGroup.isEquivariant` -- Returns whether the matrix X represents an equivariant linear map
%    - `~+replab.+equivariant.ForFiniteGroup.lambda` -- Constructs a domain from function handles
%    - `~+replab.+equivariant.ForFiniteGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+equivariant.ForFiniteGroup.nC` -- integer: column size
%    - `~+replab.+equivariant.ForFiniteGroup.nR` -- integer: row size
%    - `~+replab.+equivariant.ForFiniteGroup.parent` -- parent domain, real or complex matrices
%    - `~+replab.+equivariant.ForFiniteGroup.project` -- Projects any nR x nC matrix in the equivariant subspace
%    - `~+replab.+equivariant.ForFiniteGroup.repC` -- replab.Rep: representation of column space
%    - `~+replab.+equivariant.ForFiniteGroup.repR` -- replab.Rep: representation of row space
%    - `~+replab.+equivariant.ForFiniteGroup.sample` -- Samples an element from this domain
%    - `~+replab.+equivariant.ForFiniteGroup.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: Equivariant
%
%       Documentation in :meth:`+replab.Equivariant.Equivariant`
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
%       Documentation in :attr:`+replab.Equivariant.field`
%
%    .. attribute:: group
%
%       Documentation in :attr:`+replab.Equivariant.group`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: isEquivariant
%
%       Documentation in :meth:`+replab.Equivariant.isEquivariant`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Domain.lambda`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. attribute:: nC
%
%       Documentation in :attr:`+replab.Equivariant.nC`
%
%    .. attribute:: nR
%
%       Documentation in :attr:`+replab.Equivariant.nR`
%
%    .. attribute:: parent
%
%       Documentation in :attr:`+replab.Equivariant.parent`
%
%    .. attribute:: repC
%
%       Documentation in :attr:`+replab.Equivariant.repC`
%
%    .. attribute:: repR
%
%       Documentation in :attr:`+replab.Equivariant.repR`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Domain.sample`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

        
    methods

        function self = ForFiniteGroup(repR, repC)
            if ~isa(repR.group, 'replab.FiniteGroup')
                error('replab:dispatch:tryNext', 'try next');
            end
            self = self@replab.Equivariant(repR, repC);
        end
        
        function X = project(self, X)
            T = self.group.decomposition.T;
            for i = length(T):-1:1
                S = X;
                els = T{i};
                nEls = length(els);
                for j = 2:nEls
                    g = els{j};
                    gX = self.repR.matrixRowAction(g, self.repC.matrixColAction(g, X));
                    S = S + gX;
                end
                X = S/nEls;
            end
        end
        
    end
    
end
