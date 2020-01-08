classdef CommutantFromEquivariant < replab.Commutant
% Derives the commutant from the equivariant space
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.CommutantFromEquivariant.Commutant` -- 
%    - `~+replab.CommutantFromEquivariant.CommutantFromEquivariant` -- 
%    - `~+replab.CommutantFromEquivariant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.CommutantFromEquivariant.assertEqv` -- Compares two elements for equality
%    - `~+replab.CommutantFromEquivariant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.CommutantFromEquivariant.disp` -- 
%    - `~+replab.CommutantFromEquivariant.eq` -- Equality test
%    - `~+replab.CommutantFromEquivariant.equivariant` -- Equivariant space isomorphic to the commutant algebra as a vector space
%    - `~+replab.CommutantFromEquivariant.equivariant_` -- replab.Equivariant: Underlying equivariant space
%    - `~+replab.CommutantFromEquivariant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.CommutantFromEquivariant.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.CommutantFromEquivariant.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.CommutantFromEquivariant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.CommutantFromEquivariant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.CommutantFromEquivariant.lambda` -- Constructs a domain from function handles
%    - `~+replab.CommutantFromEquivariant.longStr` -- Multi-line description of the current object
%    - `~+replab.CommutantFromEquivariant.n` -- integer: Commutant dimension
%    - `~+replab.CommutantFromEquivariant.parent` -- replab.Domain: Domain of generic real/complex matrices
%    - `~+replab.CommutantFromEquivariant.project` -- Projects any n x n matrix in the invariant subspace
%    - `~+replab.CommutantFromEquivariant.rep` -- replab.Rep: Representation that this algebra commutes with
%    - `~+replab.CommutantFromEquivariant.sample` -- Samples a generic matrix from this commutant algebra
%    - `~+replab.CommutantFromEquivariant.shortStr` -- Single line text description of the current object
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

    
    properties (Access = protected)
        equivariant_ % replab.Equivariant: Underlying equivariant space
    end
    
    methods (Access = protected)
        
        function e = equivariant(self)            
        % Equivariant space isomorphic to the commutant algebra as a vector space
        %
        % To avoid code duplication, we delegate computations involving the commutant to
        % the equivariant space of a representation to itself.
            if isempty(self.equivariant_)
                self.equivariant_ = replab.makeEquivariant(self.rep, self.rep);
            end
            e = self.equivariant_;
        end
        
    end

    methods
        
        function self = CommutantFromEquivariant(rep)
            self = self@replab.Commutant(rep);
        end
        
        function X = project(self, X)
        % Projects any n x n matrix in the invariant subspace
            X = self.equivariant.project(X);
        end

    end
    
end
