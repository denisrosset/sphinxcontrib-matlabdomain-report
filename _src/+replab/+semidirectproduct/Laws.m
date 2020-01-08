classdef Laws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+semidirectproduct.Laws.G` -- replab.semidirectproduct.OfCompactGroups: Semidirect product group
%    - `~+replab.+semidirectproduct.Laws.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+semidirectproduct.Laws.Laws` -- 
%    - `~+replab.+semidirectproduct.Laws.M` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+semidirectproduct.Laws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.+semidirectproduct.Laws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+semidirectproduct.Laws.assert` -- Assert function with a verbose error message
%    - `~+replab.+semidirectproduct.Laws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.+semidirectproduct.Laws.disp` -- 
%    - `~+replab.+semidirectproduct.Laws.eq` -- Equality test
%    - `~+replab.+semidirectproduct.Laws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.+semidirectproduct.Laws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+semidirectproduct.Laws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+semidirectproduct.Laws.law_compose_elements_HM` -- 
%    - `~+replab.+semidirectproduct.Laws.law_compose_homomorphism_compatible_HM` -- 
%    - `~+replab.+semidirectproduct.Laws.laws_phi` -- 
%    - `~+replab.+semidirectproduct.Laws.longStr` -- Multi-line description of the current object
%    - `~+replab.+semidirectproduct.Laws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.+semidirectproduct.Laws.shortStr` -- Single line text description of the current object
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
        G % replab.semidirectproduct.OfCompactGroups: Semidirect product group
        H % replab.CompactGroup: Group acting
        M % replab.CompactGroup: Group acted upon
    end
    methods
        function self = Laws(G)
            assert(isa(G, 'replab.semidirect.OfCompactGroups'));
            self.G = G;
            self.H = G.H;
            self.M = G.N;
        end
    end
    methods
        function actionLaws = laws_phi(self)
            actionLaws = replab.ActionLaws(self.G.phi);
        end
        function law_compose_elements_HM(self, h, n)
            gh = {h self.M.identity};
            gn = {self.H.identity n};
            g1 = {h n};
            g2 = self.G.compose(gh, gn);
            self.G.assertEqv(g1, g2);
        end
        function law_compose_homomorphism_compatible_HM(self, h, n)
            gh = {h self.M.identity};
            gn = {self.H.identity n};
            % n1 = phi_h(n) = h n h^-1
            gconj = self.G.compose(gh, self.G.composeWithInverse(gn, gh));
            n1 = gconj{2};
            n2 = self.G.phi.leftAction(h, n);
            self.M.assertEqv(n1, n2);
        end
    end

end
