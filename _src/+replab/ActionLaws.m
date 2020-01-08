classdef ActionLaws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.ActionLaws.ActionLaws` -- 
%    - `~+replab.ActionLaws.G` -- `replab.Group`: Group acting
%    - `~+replab.ActionLaws.P` -- `replab.Domain`: Set acted upon
%    - `~+replab.ActionLaws.action` -- `replab.Action`: Action
%    - `~+replab.ActionLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.ActionLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.ActionLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.ActionLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.ActionLaws.disp` -- 
%    - `~+replab.ActionLaws.eq` -- Equality test
%    - `~+replab.ActionLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.ActionLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.ActionLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.ActionLaws.law_identity_leftAction_P` -- 
%    - `~+replab.ActionLaws.law_identity_rightAction_P` -- 
%    - `~+replab.ActionLaws.law_leftAction_compose_GGP` -- 
%    - `~+replab.ActionLaws.law_leftAction_rightAction_compatibility_GP` -- 
%    - `~+replab.ActionLaws.law_rightAction_compose_PGG` -- 
%    - `~+replab.ActionLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.ActionLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.ActionLaws.shortStr` -- Single line text description of the current object
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
        action % `replab.Action`: Action
        G % `replab.Group`: Group acting
        P % `replab.Domain`: Set acted upon
    end
    methods
        function self = ActionLaws(action)
            self.action = action;
            self.G = action.G;
            self.P = action.P;
        end
        function law_leftAction_compose_GGP(self, g, h, p)
            gh = self.G.compose(g, h);
            g_h_p = self.action.leftAction(g, self.action.leftAction(h, p));
            gh_p = self.action.leftAction(gh, p);
            self.P.assertEqv(g_h_p, gh_p);
        end
        function law_rightAction_compose_PGG(self, p, g, h)
            gh = self.G.compose(g, h);
            p_g_h = self.action.rightAction(self.action.rightAction(p, g), h);
            p_gh = self.action.rightAction(p, gh);
            self.P.assertEqv(p_g_h, p_gh);
        end
        function law_identity_leftAction_P(self, p)
            self.P.assertEqv(p, self.action.leftAction(self.G.identity, p));
        end
        function law_identity_rightAction_P(self, p)
            self.P.assertEqv(p, self.action.rightAction(p, self.G.identity));
        end
        function law_leftAction_rightAction_compatibility_GP(self, g, p)
            gInv = self.G.inverse(g);
            self.P.assertEqv(self.action.leftAction(g, p), self.action.rightAction(p, gInv));
        end
    end
end
