classdef Domain < replab.Str
% Describes a set of elements with a common structure
%
% Those elements can be compared (`.eqv`), and random elements can be produced (`.sample`).
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Domain.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Domain.assertEqv` -- Compares two elements for equality
%    - `~+replab.Domain.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.Domain.disp` -- 
%    - `~+replab.Domain.eq` -- Equality test
%    - `~+replab.Domain.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.Domain.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Domain.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Domain.lambda` -- Constructs a domain from function handles
%    - `~+replab.Domain.longStr` -- Multi-line description of the current object
%    - `~+replab.Domain.sample` -- Samples an element from this domain
%    - `~+replab.Domain.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
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
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>


    methods % ABSTRACT

        function b = eqv(self, t, u)
        % Tests domain elements for equality/equivalence
        %
        % Args:
        %   t (domain element): First element to test
        %   u (domain element): Second element to test
        %
        % Returns:
        %   logical: True when ``t`` and ``u`` are equivalent, and false otherwise
            error('Abstract');
        end

        function t = sample(self)
        % Samples an element from this domain
        %
        % This method does not make any guarantees about genericity, and is primarily used for law checks.
        %
        % Returns:
        %   domain element: Random domain element
            error('Abstract');
        end

    end

    methods (Static)

        function domain = lambda(header, eqvFun, sampleFun)
        % Constructs a domain from function handles
        %
        % Args:
        %   header (char): Header display string
        %   eqvFun (function_handle): Handle implementing the `eqv` method
        %   sampleFun (function_handle): Handle implementing the `sample` method
        %
        % Returns:
        %   `+replab.Domain`: The constructed domain
            domain = replab.lambda.Domain(header, eqvFun, sampleFun);
        end

    end

    methods % Test helpers

        function assertNotEqv(self, x, y, context)
        % Compares two elements for inequality
        %
        % Asserts that ``x`` and ``y`` are equivalent
        %
        % Args:
        %   x (domain element): first element
        %   y (domain element): second element to compare
        %   context (charstring): context
            if self.eqv(x, y)
                errorDesc = 'The values %s and %s are equivalent, but they should not be';
                errorId = 'assertNotEqual:equal';
            else
                return
            end

            if nargin < 4
                context = '';
            end

            names = evalin('caller', 'who');
            nV = length(names);
            values = cell(1, nV);
            for i = 1:nV
                values{i} = evalin('caller', names{i});
            end

            message = replab.laws.message(errorDesc, context, {x y}, names, values);
            if moxunit_util_platform_is_octave()
                error(errorId, '%s', message);
            else
                throwAsCaller(MException(errorId, '%s', message));
            end

        end

        function assertEqv(self, x, y, context)
        % Compares two elements for equality
        %
        % Asserts that ``x`` and ``y`` are not equivalent
        %
        % Args:
        %   x (domain element): first element
        %   y (domain element): second element to compare
        %   context (charstring): context
            if ~self.eqv(x, y)
                errorDesc = 'The values %s and %s are not equivalent';
                errorId = 'assertEqual:nonEqual';
            else
                return
            end

            if nargin < 4
                context = '';
            end

            names = evalin('caller', 'who');
            nV = length(names);
            values = cell(1, nV);
            for i = 1:nV
                values{i} = evalin('caller', names{i});
            end

            message = replab.laws.message(errorDesc, context, {x y}, names, values);
            if moxunit_util_platform_is_octave()
                error(errorId, '%s', message);
            else
                throwAsCaller(MException(errorId, '%s', message));
            end

        end

    end

end
