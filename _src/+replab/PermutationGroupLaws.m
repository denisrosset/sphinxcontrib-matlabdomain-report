classdef PermutationGroupLaws < replab.NiceFiniteGroupLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.PermutationGroupLaws.DomainLaws` -- 
%    - `~+replab.PermutationGroupLaws.FiniteGroupLaws` -- 
%    - `~+replab.PermutationGroupLaws.GroupLaws` -- 
%    - `~+replab.PermutationGroupLaws.I` -- index of generator
%    - `~+replab.PermutationGroupLaws.MonoidLaws` -- 
%    - `~+replab.PermutationGroupLaws.NiceFiniteGroupLaws` -- 
%    - `~+replab.PermutationGroupLaws.P` -- 
%    - `~+replab.PermutationGroupLaws.PermutationGroupLaws` -- 
%    - `~+replab.PermutationGroupLaws.T` -- Domain under test
%    - `~+replab.PermutationGroupLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.PermutationGroupLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.PermutationGroupLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.PermutationGroupLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.PermutationGroupLaws.disp` -- 
%    - `~+replab.PermutationGroupLaws.eq` -- Equality test
%    - `~+replab.PermutationGroupLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.PermutationGroupLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.PermutationGroupLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.PermutationGroupLaws.law_associativity_TTT` -- Checks associativity of group binary operation
%    - `~+replab.PermutationGroupLaws.law_composeAll_TTT` -- 
%    - `~+replab.PermutationGroupLaws.law_composeN_integers_TN10` -- 
%    - `~+replab.PermutationGroupLaws.law_composeN_positive_TN10` -- 
%    - `~+replab.PermutationGroupLaws.law_composeN_zero_T` -- 
%    - `~+replab.PermutationGroupLaws.law_contains_T` -- 
%    - `~+replab.PermutationGroupLaws.law_decomposition_size` -- 
%    - `~+replab.PermutationGroupLaws.law_eqv_T` -- 
%    - `~+replab.PermutationGroupLaws.law_generatorInverse_I` -- 
%    - `~+replab.PermutationGroupLaws.law_generators` -- 
%    - `~+replab.PermutationGroupLaws.law_identity` -- 
%    - `~+replab.PermutationGroupLaws.law_inverse_T` -- 
%    - `~+replab.PermutationGroupLaws.law_inverse_compatible_with_compose_TT` -- 
%    - `~+replab.PermutationGroupLaws.law_isTrivial` -- 
%    - `~+replab.PermutationGroupLaws.law_orbits_TP` -- 
%    - `~+replab.PermutationGroupLaws.law_order` -- 
%    - `~+replab.PermutationGroupLaws.law_order_elements` -- 
%    - `~+replab.PermutationGroupLaws.laws_elements` -- 
%    - `~+replab.PermutationGroupLaws.laws_matrixAction` -- 
%    - `~+replab.PermutationGroupLaws.laws_naturalAction` -- 
%    - `~+replab.PermutationGroupLaws.laws_vectorAction` -- 
%    - `~+replab.PermutationGroupLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.PermutationGroupLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.PermutationGroupLaws.shortStr` -- Single line text description of the current object
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
%    .. method:: NiceFiniteGroupLaws
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
%    .. method:: law_contains_T
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

    properties (SetAccess = protected)
        P
    end
    methods
        function self = PermutationGroupLaws(T)
            self@replab.NiceFiniteGroupLaws(T);
            self.P = replab.domain.intAsDouble(1, T.domainSize);
        end
    end
    methods
        function actionLaws = laws_naturalAction(self)
            actionLaws = replab.ActionLaws(self.T.naturalAction);
        end
        function actionLaws = laws_vectorAction(self)
            actionLaws = replab.ActionLaws(self.T.vectorAction);
        end
        function actionLaws = laws_matrixAction(self)
            actionLaws = replab.ActionLaws(self.T.matrixAction);
        end
        function law_orbits_TP(self, t, p)
            p1 = t(p);
            orbits = self.T.orbits;
            self.assert(self.T.orbits.blockIndex(p) == self.T.orbits.blockIndex(p1));
        end
    end
end
