classdef PermutationsLaws < replab.PermutationGroupLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.PermutationsLaws.DomainLaws` -- 
%    - `~+replab.PermutationsLaws.FiniteGroupLaws` -- 
%    - `~+replab.PermutationsLaws.GroupLaws` -- 
%    - `~+replab.PermutationsLaws.I` -- index of generator
%    - `~+replab.PermutationsLaws.MonoidLaws` -- 
%    - `~+replab.PermutationsLaws.NiceFiniteGroupLaws` -- 
%    - `~+replab.PermutationsLaws.P` -- 
%    - `~+replab.PermutationsLaws.PermutationGroupLaws` -- 
%    - `~+replab.PermutationsLaws.PermutationsLaws` -- 
%    - `~+replab.PermutationsLaws.T` -- Domain under test
%    - `~+replab.PermutationsLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.PermutationsLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.PermutationsLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.PermutationsLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.PermutationsLaws.disp` -- 
%    - `~+replab.PermutationsLaws.eq` -- Equality test
%    - `~+replab.PermutationsLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.PermutationsLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.PermutationsLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.PermutationsLaws.law_associativity_TTT` -- Checks associativity of group binary operation
%    - `~+replab.PermutationsLaws.law_composeAll_TTT` -- 
%    - `~+replab.PermutationsLaws.law_composeN_integers_TN10` -- 
%    - `~+replab.PermutationsLaws.law_composeN_positive_TN10` -- 
%    - `~+replab.PermutationsLaws.law_composeN_zero_T` -- 
%    - `~+replab.PermutationsLaws.law_contains_T` -- 
%    - `~+replab.PermutationsLaws.law_decomposition_size` -- 
%    - `~+replab.PermutationsLaws.law_eqv_T` -- 
%    - `~+replab.PermutationsLaws.law_generatorInverse_I` -- 
%    - `~+replab.PermutationsLaws.law_generators` -- 
%    - `~+replab.PermutationsLaws.law_identity` -- 
%    - `~+replab.PermutationsLaws.law_inverse_T` -- 
%    - `~+replab.PermutationsLaws.law_inverse_compatible_with_compose_TT` -- 
%    - `~+replab.PermutationsLaws.law_isTrivial` -- 
%    - `~+replab.PermutationsLaws.law_orbits_TP` -- 
%    - `~+replab.PermutationsLaws.law_order` -- 
%    - `~+replab.PermutationsLaws.law_order_elements` -- 
%    - `~+replab.PermutationsLaws.law_toMatrix_fromMatrix_T` -- 
%    - `~+replab.PermutationsLaws.laws_elements` -- 
%    - `~+replab.PermutationsLaws.laws_matrixAction` -- 
%    - `~+replab.PermutationsLaws.laws_naturalAction` -- 
%    - `~+replab.PermutationsLaws.laws_vectorAction` -- 
%    - `~+replab.PermutationsLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.PermutationsLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.PermutationsLaws.shortStr` -- Single line text description of the current object
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
%    .. attribute:: P
%
%       No documentation
%
%    .. method:: PermutationGroupLaws
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
%    .. method:: law_orbits_TP
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
%    .. method:: laws_matrixAction
%
%       No documentation
%
%    .. method:: laws_naturalAction
%
%       No documentation
%
%    .. method:: laws_vectorAction
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
        function self = PermutationsLaws(T)
            self@replab.PermutationGroupLaws(T);
        end
        function law_toMatrix_fromMatrix_T(self, t)
            M = self.T.toMatrix(t);
            t1 = self.T.fromMatrix(M);
            self.T.assertEqv(t, t1);
        end
    end
end
