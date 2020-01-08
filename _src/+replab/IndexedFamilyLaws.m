classdef IndexedFamilyLaws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IndexedFamilyLaws.B` -- 
%    - `~+replab.IndexedFamilyLaws.D` -- 
%    - `~+replab.IndexedFamilyLaws.E` -- 
%    - `~+replab.IndexedFamilyLaws.IndexedFamilyLaws` -- 
%    - `~+replab.IndexedFamilyLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.IndexedFamilyLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IndexedFamilyLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.IndexedFamilyLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.IndexedFamilyLaws.disp` -- 
%    - `~+replab.IndexedFamilyLaws.eq` -- Equality test
%    - `~+replab.IndexedFamilyLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.IndexedFamilyLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IndexedFamilyLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IndexedFamilyLaws.law_at_find_roundtrip_B` -- 
%    - `~+replab.IndexedFamilyLaws.law_at_find_roundtrip_double_D` -- 
%    - `~+replab.IndexedFamilyLaws.law_at_find_roundtrip_string_D` -- 
%    - `~+replab.IndexedFamilyLaws.law_sample_is_contained_N1` -- 
%    - `~+replab.IndexedFamilyLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.IndexedFamilyLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.IndexedFamilyLaws.shortStr` -- Single line text description of the current object
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
        E;
        B;
        D;
    end
    methods
        function self = IndexedFamilyLaws(E)
            self.E = E;
            self.B = replab.domain.vpi(1, E.size);
            if E.size > 2^53 - 1
                maxD = 2^53 - 1;
            else
                maxD = double(E.size);
            end
            self.D = replab.domain.intAsDouble(1, maxD);
        end
        function law_sample_is_contained_N1(self, dummy)
            e = self.E.sample;
            self.assert(~isempty(self.E.find(e)));
        end
        function law_at_find_roundtrip_B(self, ind)
            a = self.E.at(ind);
            ind1 = self.E.find(a);
            self.B.assertEqv(ind, ind1);
        end
        function law_at_find_roundtrip_double_D(self, ind)
            a = self.E.at(ind);
            ind1 = double(self.E.find(a));
            self.D.assertEqv(ind, ind1);
        end
        function law_at_find_roundtrip_string_D(self, ind)
            a = self.E.at(num2str(ind));
            ind1 = double(self.E.find(a));
            self.D.assertEqv(ind, ind1);
        end
    end
end
