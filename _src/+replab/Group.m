classdef Group < replab.Monoid
% Describes a group
%
% A group is a `.Monoid` where each element has an inverse.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Group.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Group.assertEqv` -- Compares two elements for equality
%    - `~+replab.Group.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.Group.compose` -- Composes two monoid/group elements
%    - `~+replab.Group.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.Group.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.Group.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.Group.disp` -- 
%    - `~+replab.Group.eq` -- Equality test
%    - `~+replab.Group.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.Group.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Group.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Group.identity` -- Monoid identity element
%    - `~+replab.Group.inverse` -- Computes the inverse of an element
%    - `~+replab.Group.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.Group.lambda` -- Constructs a monoid from function handles
%    - `~+replab.Group.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.Group.longStr` -- Multi-line description of the current object
%    - `~+replab.Group.sample` -- Samples an element from this domain
%    - `~+replab.Group.shortStr` -- Single line text description of the current object
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
%    .. method:: compose
%
%       Documentation in :meth:`+replab.Monoid.compose`
%
%    .. method:: composeAll
%
%       Documentation in :meth:`+replab.Monoid.composeAll`
%
%    .. method:: composeN
%
%       Documentation in :meth:`+replab.Monoid.composeN`
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
%    .. attribute:: identity
%
%       Documentation in :attr:`+replab.Monoid.identity`
%
%    .. method:: isIdentity
%
%       Documentation in :meth:`+replab.Monoid.isIdentity`
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


    methods % Abstract methods

        function xInv = inverse(self, x)
        % Computes the inverse of an element
        %
        % Given ``x``, returns ``xInv`` such that
        %
        % ``x xInv = identity``
        %
        % Args:
        %   x (element): Group element to compute the inverse of
        %
        % Returns:
        %   element: Inverse of ``x``
            error('Abstract');
        end

    end

    methods % Methods with default implementations

        function x = leftConjugate(self, by, on)
        % Returns the left conjugate of a group element
        %
        % Convenience method that can be overriden for speed optimizations
        %
        % Args:
        %   by (element): Element conjugating
        %   on (element): Element conjugated
        %
        % Returns:
        %   element: left conjugate, i.e. ``by * on * by^-1`` in multiplicative notation
            x = self.composeWithInverse(self.compose(by, on), by);
        end

        function z = composeWithInverse(self, x, y)
        % Returns the composition of an element with the inverse of another element
        %
        % Convenience method that can be overriden for speed optimizations
        %
        % Args:
        %   x (element): First element
        %   y (element): Second element
        %
        % Returns:
        %   element: the result of ``x * y^-1`` in multiplicative notation
            z = self.compose(x, self.inverse(y));
        end

    end

    methods (Static)

        function group = lambda(header, eqvFun, sampleFun, ...
                                composeFun, identity, inverseFun)
        % Constructs a group from function handles
        %
        % Args:
        %   header (char): Header display string
        %   eqvFun (function_handle): Handle implementing the parent `.Domain.eqv` method
        %   sampleFun (function_handle): Handle implementing the parent `.Domain.sample` method
        %   composeFun (function_handle): Handle implementing the parent `.Monoid.compose` method
        %   identity (element): Identity element of this monoid
        %   inverseFun (function_handle): Handle implementing the `inverse` method
        %
        % Returns:
        %   `+replab.Group`: The constructed group

            group = replab.lambda.Group(header, eqvFun, sampleFun, ...
                                        composeFun, identity, inverseFun);
        end

    end

end
