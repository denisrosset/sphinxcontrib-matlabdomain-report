classdef GeneralLinearGroup < replab.Group & replab.domain.VectorSpace
% Describes the group of square invertible real or complex matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.GeneralLinearGroup.GeneralLinearGroup` -- 
%    - `~+replab.GeneralLinearGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.GeneralLinearGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.GeneralLinearGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.GeneralLinearGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.GeneralLinearGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.GeneralLinearGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.GeneralLinearGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.GeneralLinearGroup.disp` -- 
%    - `~+replab.GeneralLinearGroup.eq` -- Equality test
%    - `~+replab.GeneralLinearGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.GeneralLinearGroup.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.GeneralLinearGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.GeneralLinearGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.GeneralLinearGroup.identity` -- Monoid identity element
%    - `~+replab.GeneralLinearGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.GeneralLinearGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.GeneralLinearGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.GeneralLinearGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.GeneralLinearGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.GeneralLinearGroup.n` -- integer: size
%    - `~+replab.GeneralLinearGroup.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.GeneralLinearGroup.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.GeneralLinearGroup.parent` -- replab.domain.Matrices: General, not necessarily invertible matrices
%    - `~+replab.GeneralLinearGroup.sample` -- Samples an element from this domain
%    - `~+replab.GeneralLinearGroup.shortStr` -- Single line text description of the current object
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
        n % integer: size
    end
    
    properties (Access = protected)
        parent % replab.domain.Matrices: General, not necessarily invertible matrices
    end
    
    methods
        
        function self = GeneralLinearGroup(field, n)
            self.field = field;
            self.n = n;
            self.parent = replab.domain.Matrices(field, n, n);
            self.identity = eye(n);
        end
        
        % Str
        
        function s = headerStr(self)
            s = sprintf('%d x %d invertible matrices in %s', self.n, self.n, self.field);
        end
        
        % Domain
        
        function b = eqv(self, X, Y)
            b = self.parent.eqv(X, Y);
        end
        
        function X = sample(self)
            X = self.parent.sample;
            % a generic gaussian matrix is almost always invertible
        end
        
        % Semigroup/monoid/group
        
        function Z = compose(self, X, Y)
            Z = X * Y;
        end
        
        function XInv = inverse(self, X)
            XInv = inv(X);
        end
        
    end

end
