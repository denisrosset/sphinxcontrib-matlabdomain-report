classdef OrthogonalGroup < replab.CompactGroup
% Describes the group of n x n orthonormal (real) matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.OrthogonalGroup.OrthogonalGroup` -- 
%    - `~+replab.OrthogonalGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.OrthogonalGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.OrthogonalGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.OrthogonalGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.OrthogonalGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.OrthogonalGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.OrthogonalGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.OrthogonalGroup.definingRep` -- Returns the natural representation of this orthonormal group
%    - `~+replab.OrthogonalGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.OrthogonalGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.OrthogonalGroup.disp` -- 
%    - `~+replab.OrthogonalGroup.eq` -- Equality test
%    - `~+replab.OrthogonalGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.OrthogonalGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.OrthogonalGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.OrthogonalGroup.identity` -- Monoid identity element
%    - `~+replab.OrthogonalGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.OrthogonalGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.OrthogonalGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.OrthogonalGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.OrthogonalGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.OrthogonalGroup.n` -- integer: Dimension of the orthogonal group
%    - `~+replab.OrthogonalGroup.parent` -- replab.domain.Matrices: Domain of square real matrices
%    - `~+replab.OrthogonalGroup.sample` -- Samples an element from this domain
%    - `~+replab.OrthogonalGroup.sampleUniformly` -- see http://home.lu.lv/~sd20008/papers/essays/Random%20unitary%20[paper].pdf
%    - `~+replab.OrthogonalGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.OrthogonalGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.OrthogonalGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
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
        n % integer: Dimension of the orthogonal group
    end
    
    properties (Access = protected)
        parent % replab.domain.Matrices: Domain of square real matrices
    end
    
    methods
        
        function self = OrthogonalGroup(n)
            self.n = n;
            self.parent = replab.domain.Matrices('R', n, n);
            self.identity = eye(n);
        end
        
        %% Str methods
        
        function s = headerStr(self)
            s = sprintf('%d x %d orthonormal matrices', self.n, self.n);
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

        %% Representations
        
        function rep = definingRep(self)
        % Returns the natural representation of this orthonormal group
            rep = replab.Rep.lambda(self, 'R', self.n, true, @(o) o, @(o) o');
        end
        
    end

end
