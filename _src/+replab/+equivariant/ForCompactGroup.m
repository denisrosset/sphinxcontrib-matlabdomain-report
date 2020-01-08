classdef ForCompactGroup < replab.Equivariant
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+equivariant.ForCompactGroup.Equivariant` -- Constructor; use `replab.makeEquivariant(repR, repC)` in user code
%    - `~+replab.+equivariant.ForCompactGroup.ForCompactGroup` -- 
%    - `~+replab.+equivariant.ForCompactGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+equivariant.ForCompactGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+equivariant.ForCompactGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+equivariant.ForCompactGroup.disp` -- 
%    - `~+replab.+equivariant.ForCompactGroup.eq` -- Equality test
%    - `~+replab.+equivariant.ForCompactGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+equivariant.ForCompactGroup.field` -- {'R', 'C'}: field of the vector space real (R) or complex x(C)
%    - `~+replab.+equivariant.ForCompactGroup.group` -- replab.CompactGroup: group being represented
%    - `~+replab.+equivariant.ForCompactGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+equivariant.ForCompactGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+equivariant.ForCompactGroup.isEquivariant` -- Returns whether the matrix X represents an equivariant linear map
%    - `~+replab.+equivariant.ForCompactGroup.lambda` -- Constructs a domain from function handles
%    - `~+replab.+equivariant.ForCompactGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+equivariant.ForCompactGroup.nC` -- integer: column size
%    - `~+replab.+equivariant.ForCompactGroup.nR` -- integer: row size
%    - `~+replab.+equivariant.ForCompactGroup.parent` -- parent domain, real or complex matrices
%    - `~+replab.+equivariant.ForCompactGroup.project` -- Projects any nR x nC matrix in the equivariant subspace
%    - `~+replab.+equivariant.ForCompactGroup.repC` -- replab.Rep: representation of column space
%    - `~+replab.+equivariant.ForCompactGroup.repR` -- replab.Rep: representation of row space
%    - `~+replab.+equivariant.ForCompactGroup.sample` -- Samples an element from this domain
%    - `~+replab.+equivariant.ForCompactGroup.shortStr` -- Single line text description of the current object
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

        function self = ForCompactGroup(repR, repC)
            self = self@replab.Equivariant(repR, repC);
        end

        function X = project(self, X)
            nI = replab.Parameters.averagingIterations;
            nS = replab.Parameters.averagingSamples;
            for i = 1:nI
                g = self.group.sample;
                S = self.repR.matrixRowAction(g, self.repC.matrixColAction(g, X));
                for j = 2:nS
                    g = self.group.sample;
                    S = S + self.repR.matrixRowAction(g, self.repC.matrixColAction(g, X));
                end
                X = S/nS;
            end
        end

    end

end
