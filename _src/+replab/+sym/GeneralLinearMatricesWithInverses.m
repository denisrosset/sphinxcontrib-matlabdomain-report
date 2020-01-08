classdef GeneralLinearMatricesWithInverses < replab.Group
% Describes the group of n x n invertible real or complex matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.GeneralLinearMatricesWithInverses` -- 
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.assertEqv` -- Compares two elements for equality
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.compose` -- Composes two monoid/group elements
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.disp` -- 
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.eq` -- Equality test
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.field` -- {'R', 'C'} real or complex matrices
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.identity` -- Monoid identity element
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.inverse` -- Computes the inverse of an element
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.longStr` -- Multi-line description of the current object
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.n` -- size
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.parent_` -- complex matrices
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.sample` -- Samples an element from this domain
%    - `~+replab.+sym.GeneralLinearMatricesWithInverses.shortStr` -- Single line text description of the current object
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
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        field % {'R', 'C'} real or complex matrices
        n % size
    end
    
    properties (Access = protected)
        parent_; % complex matrices
    end
    
    methods
        
        function self = GeneralLinearMatricesWithInverses(field, n)
            self.field = field;
            self.n = n;
            switch field
              case 'R'
                self.parent_ = replab.domain.RealMatrices(n, n);
              case 'C'
                self.parent_ = replab.domain.ComplexMatrices(n, n);
              otherwise
                error('Unknown field');
            end
            self.identity = [eye(n) eye(n)];
        end
        
        % Str
        
        function s = headerStr(self)
            s = sprintf('%d x %d invertible matrices in %s', self.n, self.n, self.field);
        end
        
        % Domain
        
        function b = eqv(self, X, Y)
            b = self.parent_.eqv(X(:,1:self.n), Y(:,1:self.n));
        end
        
        function X = sample(self)
            X = self.parent_.sample;
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
