classdef GroupLaws < replab.MonoidLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.GroupLaws.DomainLaws` -- 
%    - `~+replab.GroupLaws.GroupLaws` -- 
%    - `~+replab.GroupLaws.MonoidLaws` -- 
%    - `~+replab.GroupLaws.T` -- Domain under test
%    - `~+replab.GroupLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.GroupLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.GroupLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.GroupLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.GroupLaws.disp` -- 
%    - `~+replab.GroupLaws.eq` -- Equality test
%    - `~+replab.GroupLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.GroupLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.GroupLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.GroupLaws.law_associativity_TTT` -- Checks associativity of group binary operation
%    - `~+replab.GroupLaws.law_composeAll_TTT` -- 
%    - `~+replab.GroupLaws.law_composeN_integers_TN10` -- 
%    - `~+replab.GroupLaws.law_composeN_positive_TN10` -- 
%    - `~+replab.GroupLaws.law_composeN_zero_T` -- 
%    - `~+replab.GroupLaws.law_eqv_T` -- 
%    - `~+replab.GroupLaws.law_identity` -- 
%    - `~+replab.GroupLaws.law_inverse_T` -- 
%    - `~+replab.GroupLaws.law_inverse_compatible_with_compose_TT` -- 
%    - `~+replab.GroupLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.GroupLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.GroupLaws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: DomainLaws
%
%       No documentation
%
%    .. method:: MonoidLaws
%
%       No documentation
%
%    .. attribute:: T
%
%       Documentation in :attr:`+replab.DomainLaws.T`
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
%    .. method:: law_associativity_TTT
%
%       Documentation in :meth:`+replab.MonoidLaws.law_associativity_TTT`
%
%    .. method:: law_composeAll_TTT
%
%       No documentation
%
%    .. method:: law_composeN_positive_TN10
%
%       No documentation
%
%    .. method:: law_composeN_zero_T
%
%       No documentation
%
%    .. method:: law_eqv_T
%
%       No documentation
%
%    .. method:: law_identity
%
%       No documentation
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

    methods
        function self = GroupLaws(T)
            self@replab.MonoidLaws(T);
        end
        function law_composeN_integers_TN10(self, x, n)
            pow1 = self.T.composeN(x, n);
            pow2 = self.T.inverse(self.T.composeN(x, -n));
            self.T.assertEqv(pow1, pow2);
        end
        function law_inverse_T(self, x)
            xI = self.T.inverse(x);
            id1 = self.T.compose(x, xI);
            id2 = self.T.compose(xI, x);
            self.assert(self.T.isIdentity(id1));
            self.assert(self.T.isIdentity(id2));
        end
        function law_inverse_compatible_with_compose_TT(self, x, y)
            xy = self.T.compose(x, y);
            yIxI = self.T.compose(self.T.inverse(y), self.T.inverse(x));
            self.T.assertEqv(self.T.inverse(xy), yIxI);
        end
    end
end
