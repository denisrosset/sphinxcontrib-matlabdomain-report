classdef DomainLaws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.DomainLaws.DomainLaws` -- 
%    - `~+replab.DomainLaws.T` -- Domain under test
%    - `~+replab.DomainLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.DomainLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.DomainLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.DomainLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.DomainLaws.disp` -- 
%    - `~+replab.DomainLaws.eq` -- Equality test
%    - `~+replab.DomainLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.DomainLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.DomainLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.DomainLaws.law_eqv_T` -- 
%    - `~+replab.DomainLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.DomainLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.DomainLaws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: addTestCases
%
%       Documentation in :meth:`+replab.Laws.addTestCases`
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: assert
%
%       Documentation in :meth:`+replab.Laws.assert`
%
%    .. method:: check
%
%       Documentation in :meth:`+replab.Laws.check`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: getTestCases
%
%       Documentation in :meth:`+replab.Laws.getTestCases`
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
%    .. method:: nRuns
%
%       Documentation in :meth:`+replab.Laws.nRuns`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    properties (SetAccess = protected)
        T; % Domain under test
    end
    methods
        function self = DomainLaws(T)
            self.T = T;
        end
        function law_eqv_T(self, x)
            self.assert(self.T.eqv(x, x));
        end
    end
end
