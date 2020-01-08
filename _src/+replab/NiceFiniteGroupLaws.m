classdef NiceFiniteGroupLaws < replab.FiniteGroupLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.NiceFiniteGroupLaws.DomainLaws` -- 
%    - `~+replab.NiceFiniteGroupLaws.FiniteGroupLaws` -- 
%    - `~+replab.NiceFiniteGroupLaws.GroupLaws` -- 
%    - `~+replab.NiceFiniteGroupLaws.I` -- index of generator
%    - `~+replab.NiceFiniteGroupLaws.MonoidLaws` -- 
%    - `~+replab.NiceFiniteGroupLaws.NiceFiniteGroupLaws` -- 
%    - `~+replab.NiceFiniteGroupLaws.T` -- Domain under test
%    - `~+replab.NiceFiniteGroupLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.NiceFiniteGroupLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.NiceFiniteGroupLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.NiceFiniteGroupLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.NiceFiniteGroupLaws.disp` -- 
%    - `~+replab.NiceFiniteGroupLaws.eq` -- Equality test
%    - `~+replab.NiceFiniteGroupLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.NiceFiniteGroupLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.NiceFiniteGroupLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.NiceFiniteGroupLaws.law_associativity_TTT` -- Checks associativity of group binary operation
%    - `~+replab.NiceFiniteGroupLaws.law_composeAll_TTT` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_composeN_integers_TN10` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_composeN_positive_TN10` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_composeN_zero_T` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_contains_T` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_decomposition_size` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_eqv_T` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_generatorInverse_I` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_generators` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_identity` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_inverse_T` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_inverse_compatible_with_compose_TT` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_isTrivial` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_order` -- 
%    - `~+replab.NiceFiniteGroupLaws.law_order_elements` -- 
%    - `~+replab.NiceFiniteGroupLaws.laws_elements` -- 
%    - `~+replab.NiceFiniteGroupLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.NiceFiniteGroupLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.NiceFiniteGroupLaws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: DomainLaws
%
%       No documentation
%
%    .. method:: FiniteGroupLaws
%
%       No documentation
%
%    .. method:: GroupLaws
%
%       No documentation
%
%    .. attribute:: I
%
%       Documentation in :attr:`+replab.FiniteGroupLaws.I`
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
%    .. method:: law_composeN_integers_TN10
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
%    .. method:: law_decomposition_size
%
%       No documentation
%
%    .. method:: law_eqv_T
%
%       No documentation
%
%    .. method:: law_generatorInverse_I
%
%       No documentation
%
%    .. method:: law_generators
%
%       No documentation
%
%    .. method:: law_identity
%
%       No documentation
%
%    .. method:: law_inverse_T
%
%       No documentation
%
%    .. method:: law_inverse_compatible_with_compose_TT
%
%       No documentation
%
%    .. method:: law_isTrivial
%
%       No documentation
%
%    .. method:: law_order
%
%       No documentation
%
%    .. method:: law_order_elements
%
%       No documentation
%
%    .. method:: laws_elements
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
        function self = NiceFiniteGroupLaws(T)
            self@replab.FiniteGroupLaws(T);
        end
    end
    methods
        function law_contains_T(self, t)
            self.assert(self.T.contains(t));
        end
% $$$         function law_cyclic_subgroup_order_T(self, t)
% $$$             if self.T.isIdentity(t)
% $$$                 sub = self.T.subgroup({});
% $$$             else
% $$$                 sub = self.T.subgroup({t});
% $$$             end
% $$$             self.assert(sub.order == self.T.elementOrder(t));
% $$$         end
    end
end
