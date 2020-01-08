classdef MonoidLaws < replab.DomainLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.MonoidLaws.DomainLaws` -- 
%    - `~+replab.MonoidLaws.MonoidLaws` -- 
%    - `~+replab.MonoidLaws.T` -- Domain under test
%    - `~+replab.MonoidLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.MonoidLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.MonoidLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.MonoidLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.MonoidLaws.disp` -- 
%    - `~+replab.MonoidLaws.eq` -- Equality test
%    - `~+replab.MonoidLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.MonoidLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.MonoidLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.MonoidLaws.law_associativity_TTT` -- Checks associativity of group binary operation
%    - `~+replab.MonoidLaws.law_composeAll_TTT` -- 
%    - `~+replab.MonoidLaws.law_composeN_positive_TN10` -- 
%    - `~+replab.MonoidLaws.law_composeN_zero_T` -- 
%    - `~+replab.MonoidLaws.law_eqv_T` -- 
%    - `~+replab.MonoidLaws.law_identity` -- 
%    - `~+replab.MonoidLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.MonoidLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.MonoidLaws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: DomainLaws
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
%    .. method:: law_eqv_T
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
        function self = MonoidLaws(T)
            self@replab.DomainLaws(T);
        end
        function law_associativity_TTT(self, x, y, z)
        % Checks associativity of group binary operation
            xy = self.T.compose(x, y);
            yz = self.T.compose(y, z);
            self.T.assertEqv(self.T.compose(xy, z), self.T.compose(x, yz));
        end
        function law_composeN_positive_TN10(self, x, n)
            xn1 = x;
            for i = 2:n
                xn1 = self.T.compose(xn1, x);
            end
            if n > 1
                xn2 = self.T.compose(self.T.composeN(x, n - 1), x);
                self.T.assertEqv(xn1, xn2);
            end
            xn3 = self.T.composeN(x, n);
            self.T.assertEqv(xn1, xn3);
        end
        function law_composeAll_TTT(self, x, y, z)
            xyz1 = self.T.compose(self.T.compose(x, y), z);
            xyz2 = self.T.composeAll({x y z});
            self.T.assertEqv(xyz1, xyz2);
        end
        function law_composeN_zero_T(self, x)
            id1 = self.T.composeN(x, 0);
            id2 = self.T.identity;
            self.T.assertEqv(id1, id2);
        end
        function law_identity(self)
            id = self.T.identity;
            self.assert(self.T.isIdentity(id));
        end
    end
end
