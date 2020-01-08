classdef PermutationsLaws < replab.FiniteGroupLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+signed.PermutationsLaws.DomainLaws` -- 
%    - `~+replab.+signed.PermutationsLaws.FiniteGroupLaws` -- 
%    - `~+replab.+signed.PermutationsLaws.GroupLaws` -- 
%    - `~+replab.+signed.PermutationsLaws.I` -- index of generator
%    - `~+replab.+signed.PermutationsLaws.MonoidLaws` -- 
%    - `~+replab.+signed.PermutationsLaws.P` -- 
%    - `~+replab.+signed.PermutationsLaws.PermutationsLaws` -- 
%    - `~+replab.+signed.PermutationsLaws.T` -- Domain under test
%    - `~+replab.+signed.PermutationsLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.+signed.PermutationsLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+signed.PermutationsLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.+signed.PermutationsLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.+signed.PermutationsLaws.disp` -- 
%    - `~+replab.+signed.PermutationsLaws.eq` -- Equality test
%    - `~+replab.+signed.PermutationsLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.+signed.PermutationsLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+signed.PermutationsLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+signed.PermutationsLaws.law_associativity_TTT` -- Checks associativity of group binary operation
%    - `~+replab.+signed.PermutationsLaws.law_composeAll_TTT` -- 
%    - `~+replab.+signed.PermutationsLaws.law_composeN_integers_TN10` -- 
%    - `~+replab.+signed.PermutationsLaws.law_composeN_positive_TN10` -- 
%    - `~+replab.+signed.PermutationsLaws.law_composeN_zero_T` -- 
%    - `~+replab.+signed.PermutationsLaws.law_decomposition_size` -- 
%    - `~+replab.+signed.PermutationsLaws.law_eqv_T` -- 
%    - `~+replab.+signed.PermutationsLaws.law_generatorInverse_I` -- 
%    - `~+replab.+signed.PermutationsLaws.law_generators` -- 
%    - `~+replab.+signed.PermutationsLaws.law_identity` -- 
%    - `~+replab.+signed.PermutationsLaws.law_inverse_T` -- 
%    - `~+replab.+signed.PermutationsLaws.law_inverse_compatible_with_compose_TT` -- 
%    - `~+replab.+signed.PermutationsLaws.law_isTrivial` -- 
%    - `~+replab.+signed.PermutationsLaws.law_order` -- 
%    - `~+replab.+signed.PermutationsLaws.law_order_elements` -- 
%    - `~+replab.+signed.PermutationsLaws.law_toMatrix_fromMatrix_T` -- 
%    - `~+replab.+signed.PermutationsLaws.law_toPermutation_fromPermutation_T` -- 
%    - `~+replab.+signed.PermutationsLaws.laws_elements` -- 
%    - `~+replab.+signed.PermutationsLaws.laws_matrixAction` -- 
%    - `~+replab.+signed.PermutationsLaws.laws_naturalAction` -- 
%    - `~+replab.+signed.PermutationsLaws.laws_toPermutation` -- 
%    - `~+replab.+signed.PermutationsLaws.laws_vectorAction` -- 
%    - `~+replab.+signed.PermutationsLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.+signed.PermutationsLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.+signed.PermutationsLaws.shortStr` -- Single line text description of the current object
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

    properties
        P;
    end
    methods
        function self = PermutationsLaws(T)
            self@replab.FiniteGroupLaws(T);
            self.P = replab.domain.signedIntAsDouble(1, T.domainSize);
        end
        function law_toPermutation_fromPermutation_T(self, t)
            p = self.T.toPermutation(t);
            t1 = self.T.fromPermutation(p);
            self.T.assertEqv(t, t1);
        end
        function morphismLaws = laws_toPermutation(self)
            d = self.T.domainSize;
            SymGrp = replab.Permutations(2*d);
            morphismLaws = replab.GroupMorphismLaws(@(s) self.T.toPermutation(s), self.T, SymGrp);
        end
        function actionLaws = laws_naturalAction(self)
            actionLaws = replab.ActionLaws(self.T.naturalAction);
        end
        function actionLaws = laws_vectorAction(self)
            actionLaws = replab.ActionLaws(self.T.vectorAction);
        end
        function actionLaws = laws_matrixAction(self)
            actionLaws = replab.ActionLaws(self.T.matrixAction);
        end
        function law_toMatrix_fromMatrix_T(self, t)
            M = self.T.toMatrix(t);
            t1 = self.T.fromMatrix(M);
            self.T.assertEqv(t, t1);
        end
    end
end
