classdef UnitaryGroup < replab.CompactGroup
% Describes the group of n x n unitary (complex) matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.UnitaryGroup.UnitaryGroup` -- 
%    - `~+replab.UnitaryGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.UnitaryGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.UnitaryGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.UnitaryGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.UnitaryGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.UnitaryGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.UnitaryGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.UnitaryGroup.definingRep` -- Returns the natural representation of this unitary group
%    - `~+replab.UnitaryGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.UnitaryGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.UnitaryGroup.disp` -- 
%    - `~+replab.UnitaryGroup.eq` -- Equality test
%    - `~+replab.UnitaryGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.UnitaryGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.UnitaryGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.UnitaryGroup.identity` -- Monoid identity element
%    - `~+replab.UnitaryGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.UnitaryGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.UnitaryGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.UnitaryGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.UnitaryGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.UnitaryGroup.n` -- integer: Dimension of the unitary group
%    - `~+replab.UnitaryGroup.parent` -- replab.domain.Matrices: Domain of square complex matrices
%    - `~+replab.UnitaryGroup.sample` -- Samples an element from this domain
%    - `~+replab.UnitaryGroup.sampleUniformly` -- see http://home.lu.lv/~sd20008/papers/essays/Random%20unitary%20[paper].pdf
%    - `~+replab.UnitaryGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.UnitaryGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.UnitaryGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
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
%    .. method:: composeAll
%
%       Documentation in :meth:`+replab.Monoid.composeAll`
%
%    .. method:: composeN
%
%       Documentation in :meth:`+replab.Monoid.composeN`
%
%    .. method:: composeWithInverse
%
%       Documentation in :meth:`+replab.Group.composeWithInverse`
%
%    .. method:: directPower
%
%       Documentation in :meth:`+replab.CompactGroup.directPower`
%
%    .. method:: directProduct
%
%       Documentation in :meth:`+replab.CompactGroup.directProduct`
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
%    .. attribute:: identity
%
%       Documentation in :attr:`+replab.Monoid.identity`
%
%    .. method:: isIdentity
%
%       Documentation in :meth:`+replab.Monoid.isIdentity`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Monoid.lambda`
%
%    .. method:: leftConjugate
%
%       Documentation in :meth:`+replab.Group.leftConjugate`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: semidirectProduct
%
%       Documentation in :meth:`+replab.CompactGroup.semidirectProduct`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. method:: trivialRep
%
%       Documentation in :meth:`+replab.CompactGroup.trivialRep`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        n % integer: Dimension of the unitary group
    end
    
    properties (Access = protected)
        parent % replab.domain.Matrices: Domain of square complex matrices
    end
    
    methods
        
        function self = UnitaryGroup(n)
            self.n = n;
            self.parent = replab.domain.Matrices('C', n, n);
            self.identity = eye(n);
        end
        
        %% Str methods
        
        function s = headerStr(self)
            s = sprintf('%d x %d unitary matrices', self.n, self.n);
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = self.parent.eqv(X, Y);
        end
        
        function X = sample(self)
            X = self.sampleUniformly;
        end
        
        %% Monoid methods
        
        function Z = compose(self, X, Y)
            Z = X * Y;
        end
        
        %% Group methods
        
        function XInv = inverse(self, X)
            XInv = X';
        end
        
        %% CompactGroup methods
        
        function X = sampleUniformly(self)
        % see http://home.lu.lv/~sd20008/papers/essays/Random%20unitary%20[paper].pdf
            X = self.parent.sample;
            [Q, R] = qr(X);
            R = diag(diag(R)./abs(diag(R)));
            X = Q*R;
        end

        %% Representation methods
        
        function rep = definingRep(self)
        % Returns the natural representation of this unitary group
            rep = replab.Rep.lambda(self, 'C', self.n, true, @(u) u, @(u) u');
        end

    end

end
