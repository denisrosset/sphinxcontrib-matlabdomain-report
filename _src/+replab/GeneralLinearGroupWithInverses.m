classdef GeneralLinearGroupWithInverses < replab.Group & replab.domain.VectorSpace
% Describes the group of n x n invertible real or complex matrices, elements store inverses
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.GeneralLinearGroupWithInverses.GeneralLinearGroupWithInverses` -- 
%    - `~+replab.GeneralLinearGroupWithInverses.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.GeneralLinearGroupWithInverses.assertEqv` -- Compares two elements for equality
%    - `~+replab.GeneralLinearGroupWithInverses.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.GeneralLinearGroupWithInverses.compose` -- Composes two monoid/group elements
%    - `~+replab.GeneralLinearGroupWithInverses.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.GeneralLinearGroupWithInverses.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.GeneralLinearGroupWithInverses.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.GeneralLinearGroupWithInverses.disp` -- 
%    - `~+replab.GeneralLinearGroupWithInverses.eq` -- Equality test
%    - `~+replab.GeneralLinearGroupWithInverses.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.GeneralLinearGroupWithInverses.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.GeneralLinearGroupWithInverses.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.GeneralLinearGroupWithInverses.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.GeneralLinearGroupWithInverses.identity` -- Monoid identity element
%    - `~+replab.GeneralLinearGroupWithInverses.inverse` -- Computes the inverse of an element
%    - `~+replab.GeneralLinearGroupWithInverses.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.GeneralLinearGroupWithInverses.lambda` -- Constructs a monoid from function handles
%    - `~+replab.GeneralLinearGroupWithInverses.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.GeneralLinearGroupWithInverses.longStr` -- Multi-line description of the current object
%    - `~+replab.GeneralLinearGroupWithInverses.n` -- integer: size of the matrices
%    - `~+replab.GeneralLinearGroupWithInverses.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.GeneralLinearGroupWithInverses.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.GeneralLinearGroupWithInverses.parent` -- replab.domain.Matrices: General, not necessarily invertible matrices
%    - `~+replab.GeneralLinearGroupWithInverses.sample` -- Samples an element from this domain
%    - `~+replab.GeneralLinearGroupWithInverses.shortStr` -- Single line text description of the current object
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
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. attribute:: field
%
%       Documentation in :attr:`+replab.+domain.VectorSpace.field`
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
%    .. method:: overC
%
%       Documentation in :meth:`+replab.+domain.VectorSpace.overC`
%
%    .. method:: overR
%
%       Documentation in :meth:`+replab.+domain.VectorSpace.overR`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        n % integer: size of the matrices
    end
    
    properties (Access = protected)
        parent % replab.domain.Matrices: General, not necessarily invertible matrices
    end
    
    methods
        
        function self = GeneralLinearGroupWithInverses(field, n)
            self.field = field;
            self.n = n;
            self.parent = replab.domain.Matrices(field, n, n);
            self.identity = [eye(n) eye(n)];
        end
        
        % Str
        
        function s = headerStr(self)
            s = sprintf('%d x %d invertible matrices in %s', self.n, self.n, self.field);
        end
        
        % Domain
        
        function b = eqv(self, X, Y)
            b = self.parent.eqv(X(:,1:self.n), Y(:,1:self.n));
        end
        
        function X = sample(self)
            X = self.parent.sample;
            X = [X inv(X)];
            % a generic gaussian matrix is almost always invertible
        end
        
        % Semigroup/monoid/group
        
        function Z = compose(self, X, Y)
            n = self.n;
            Xinv = X(:,n+1:2*n);
            X = X(:,1:n);
            Yinv = Y(:,n+1:2*n);
            Y = Y(:,1:n);
            Z = [X*Y Yinv*Xinv];
        end
        
        function Xinv = inverse(self, X)
            n = self.n;
            Xinv = X(:,n+1:2*n);
            X = X(:,1:n);
            Xinv = [Xinv X];
        end
        
    end

end
