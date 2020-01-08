classdef Commutant < replab.Domain
% Describes the algebra of n x n matrices that commute with a group representation
%
% Let rep be a representation of a group G. This describes the set
% of matrices X such that rep.image(g) * X = X * rep.image(g)
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Commutant.Commutant` -- 
%    - `~+replab.Commutant.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Commutant.assertEqv` -- Compares two elements for equality
%    - `~+replab.Commutant.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.Commutant.disp` -- 
%    - `~+replab.Commutant.eq` -- Equality test
%    - `~+replab.Commutant.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.Commutant.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.Commutant.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.Commutant.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Commutant.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Commutant.lambda` -- Constructs a domain from function handles
%    - `~+replab.Commutant.longStr` -- Multi-line description of the current object
%    - `~+replab.Commutant.n` -- integer: Commutant dimension
%    - `~+replab.Commutant.parent` -- replab.Domain: Domain of generic real/complex matrices
%    - `~+replab.Commutant.project` -- Projects any n x n matrix in the invariant subspace
%    - `~+replab.Commutant.rep` -- replab.Rep: Representation that this algebra commutes with
%    - `~+replab.Commutant.sample` -- Samples a generic matrix from this commutant algebra
%    - `~+replab.Commutant.shortStr` -- Single line text description of the current object
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
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>


    properties (SetAccess = protected)
        parent % replab.Domain: Domain of generic real/complex matrices
        field  % {'R', 'C'}: Vector space defined on real (R) or complex (C) field
        n      % integer: Commutant dimension
        group  % replab.CompactGroup: Group being represented
        rep    % replab.Rep: Representation that this algebra commutes with
    end

    methods

        %% Own methods
        
        function self = Commutant(rep)
            self.rep = rep;
            self.n = rep.dimension;
            self.field = rep.field;
            self.group = rep.group;
            self.parent = replab.domain.Matrices(self.field, self.n, self.n);
        end
        
        function X = project(self, X)
        % Projects any n x n matrix in the invariant subspace
            error('Abstract');
        end

        %% Str methods
        
        function s = headerStr(self)
            s = sprintf('%d x %d %s commutant matrices', ...
                        self.n, self.n, ...
                        replab.str.field(self.field));
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = self.parent.eqv(X, Y);
        end
        
        function X = sample(self)
        % Samples a generic matrix from this commutant algebra
            X = self.project(self.parent.sample);
        end
        
    end
    
end
