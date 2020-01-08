classdef Monoid < replab.Domain
% Describes a monoid
%
% See `https://en.wikipedia.org/wiki/Monoid`_
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Monoid.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Monoid.assertEqv` -- Compares two elements for equality
%    - `~+replab.Monoid.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.Monoid.compose` -- Composes two monoid/group elements
%    - `~+replab.Monoid.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.Monoid.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.Monoid.disp` -- 
%    - `~+replab.Monoid.eq` -- Equality test
%    - `~+replab.Monoid.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.Monoid.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Monoid.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Monoid.identity` -- Monoid identity element
%    - `~+replab.Monoid.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.Monoid.lambda` -- Constructs a monoid from function handles
%    - `~+replab.Monoid.longStr` -- Multi-line description of the current object
%    - `~+replab.Monoid.sample` -- Samples an element from this domain
%    - `~+replab.Monoid.shortStr` -- Single line text description of the current object
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
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
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


    properties (SetAccess = protected)
        identity % Monoid identity element
    end

    methods % Abstract methods

        function z = compose(self, x, y)
        % Composes two monoid/group elements
        %
        % Args:
        %   x (element): Left hand side of the binary operation
        %   y (element): Right hand side of the binary operation
        %
        % Returns:
        %   element: Result of the binary operation ``x op y``
            error('Abstract');
        end

    end

    methods % Default implementations

        function z = composeAll(self, elements)
        % Composes a sequence of monoid elements
        %
        % For ``self.composeAll({x1 x2 ... xn})``, returns
        % ``x1*x2*...*xn`` (shown here in multiplaticative notation)
            if length(elements) == 0
                assert(isa(self, 'replab.Monoid'));
                z = self.identity;
            else
                z = elements{1};
                for i = 2:length(elements)
                    z = self.compose(z, elements{i});
                end
            end
        end

        function y = composeN(self, x, n)
        % Computes ``y = x^n`` by repeated squaring
        %
        % When "self" is a
        % - `.Semigroup`, we need n > 0
        % - `.Monoid`, we need n >= 0
        % - `.Group`, ``n`` is an arbitrary integer
            if n < 0
                assert(isa(self, 'replab.Group'));
                y = self.composeN(self.inverse(x), -n);
            elseif n == 0
                assert(isa(self, 'replab.Monoid'));
                y = self.identity;
            elseif n == 1
                y = x;
            elseif n == 2
                y = self.compose(x, x);
            else
                y = self.identity;
                while n > 1
                    if mod(n, 2) == 0 % n even
                        n = n / 2;
                    else % n odd
                        y = self.compose(x, y);
                        n = (n - 1)/2;
                    end
                    x = self.compose(x, x);
                end
                y = self.compose(x, y);
            end
        end

        function b = isIdentity(self, x)
        % Returns true if x is the identity, false otherwise
            b = self.eqv(x, self.identity);
        end

    end

    methods (Static)

        function monoid = lambda(header, eqvFun, sampleFun, composeFun, identity)
        % Constructs a monoid from function handles
        %
        % Args:
        %   header (char): Header display string
        %   eqvFun (function_handle): Handle implementing the `eqv` method
        %   sampleFun (function_handle): Handle implementing the `sample` method
        %   composeFun (function_handle): Handle implementing the `compose` method
        %   identity (element): Identity element of this monoid
        %
        % Returns:
        %   replab.Monoid: The constructed monoid
            monoid = replab.lambda.Monoid(header, eqvFun, sampleFun, composeFun, identity);
        end

    end

end
