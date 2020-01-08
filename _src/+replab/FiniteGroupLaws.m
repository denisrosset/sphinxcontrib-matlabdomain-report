classdef FiniteGroupLaws < replab.GroupLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.FiniteGroupLaws.DomainLaws` -- 
%    - `~+replab.FiniteGroupLaws.FiniteGroupLaws` -- 
%    - `~+replab.FiniteGroupLaws.GroupLaws` -- 
%    - `~+replab.FiniteGroupLaws.I` -- index of generator
%    - `~+replab.FiniteGroupLaws.MonoidLaws` -- 
%    - `~+replab.FiniteGroupLaws.T` -- Domain under test
%    - `~+replab.FiniteGroupLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.FiniteGroupLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.FiniteGroupLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.FiniteGroupLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.FiniteGroupLaws.disp` -- 
%    - `~+replab.FiniteGroupLaws.eq` -- Equality test
%    - `~+replab.FiniteGroupLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.FiniteGroupLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.FiniteGroupLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.FiniteGroupLaws.law_associativity_TTT` -- Checks associativity of group binary operation
%    - `~+replab.FiniteGroupLaws.law_composeAll_TTT` -- 
%    - `~+replab.FiniteGroupLaws.law_composeN_integers_TN10` -- 
%    - `~+replab.FiniteGroupLaws.law_composeN_positive_TN10` -- 
%    - `~+replab.FiniteGroupLaws.law_composeN_zero_T` -- 
%    - `~+replab.FiniteGroupLaws.law_decomposition_size` -- 
%    - `~+replab.FiniteGroupLaws.law_eqv_T` -- 
%    - `~+replab.FiniteGroupLaws.law_generatorInverse_I` -- 
%    - `~+replab.FiniteGroupLaws.law_generators` -- 
%    - `~+replab.FiniteGroupLaws.law_identity` -- 
%    - `~+replab.FiniteGroupLaws.law_inverse_T` -- 
%    - `~+replab.FiniteGroupLaws.law_inverse_compatible_with_compose_TT` -- 
%    - `~+replab.FiniteGroupLaws.law_isTrivial` -- 
%    - `~+replab.FiniteGroupLaws.law_order` -- 
%    - `~+replab.FiniteGroupLaws.law_order_elements` -- 
%    - `~+replab.FiniteGroupLaws.laws_elements` -- 
%    - `~+replab.FiniteGroupLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.FiniteGroupLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.FiniteGroupLaws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: DomainLaws
%
%       No documentation
%
%    .. method:: GroupLaws
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
%    .. method:: law_eqv_T
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
        I; % index of generator
    end
    methods
        function self = FiniteGroupLaws(T)
            self@replab.GroupLaws(T);
            self.I = replab.domain.intAsDouble(1, T.nGenerators);
        end
    end
    methods
        function law_generatorInverse_I(self, i)
            t = self.T.inverse(self.T.generator(i));
            t1 = self.T.generatorInverse(i);
            self.T.assertEqv(t, t1);
        end
        function law_isTrivial(self)
            self.assert(self.T.isTrivial == (self.T.nGenerators == 0));
        end
        function law_order(self)
            self.assert(self.T.isTrivial == (self.T.order == 1));
        end
        function law_order_elements(self)
            self.assert(self.T.elements.size == self.T.order);
        end
        function law_generators(self)
            T = self.T;
            for i = 1:T.nGenerators
                g = T.generator(i);
                ginv = T.generatorInverse(i);
                T.assertEqv(T.identity, T.compose(g, ginv)); % generator consistent with its inverse
                self.assert(T.elements.find(g) > 0); % generator is part of elements
                self.assert(T.elements.find(ginv) > 0); % generator inverse is part of elements
            end
        end
        function elementsLaws = laws_elements(self)
            elementsLaws = replab.IndexedFamilyLaws(self.T.elements);
        end
        function law_decomposition_size(self)
            D = self.T.decomposition.T;
            o = vpi(1);
            for i = 1:length(D)
                o = o * length(D{i});
            end
            self.assert(o == self.T.order);
        end
    end
end
