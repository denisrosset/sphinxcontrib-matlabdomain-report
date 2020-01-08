classdef GroupMorphismLaws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.GroupMorphismLaws.GroupMorphismLaws` -- 
%    - `~+replab.GroupMorphismLaws.S` -- source group
%    - `~+replab.GroupMorphismLaws.T` -- target group
%    - `~+replab.GroupMorphismLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.GroupMorphismLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.GroupMorphismLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.GroupMorphismLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.GroupMorphismLaws.disp` -- 
%    - `~+replab.GroupMorphismLaws.eq` -- Equality test
%    - `~+replab.GroupMorphismLaws.fun` -- morphism function handle
%    - `~+replab.GroupMorphismLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.GroupMorphismLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.GroupMorphismLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.GroupMorphismLaws.law_composition_SS` -- 
%    - `~+replab.GroupMorphismLaws.law_identity` -- 
%    - `~+replab.GroupMorphismLaws.law_inverse_S` -- 
%    - `~+replab.GroupMorphismLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.GroupMorphismLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.GroupMorphismLaws.shortStr` -- Single line text description of the current object
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
        fun; % morphism function handle
        S; % source group
        T; % target group
    end
    
    methods
        
        function self = GroupMorphismLaws(fun, S, T)
            self.fun = fun;
            self.S = S;
            self.T = T;
        end
        
    end
    
    methods % LAWS
        
        function law_inverse_S(self, s)
            t = self.fun(s);
            sI = self.S.inverse(s);
            tI1 = self.T.inverse(t);
            tI2 = self.fun(sI);
            self.T.assertEqv(tI1, tI2);
        end
        
        function law_composition_SS(self, s1, s2)
            s12 = self.S.compose(s1, s2);
            t1 = self.fun(s1);
            t2 = self.fun(s2);
            t12_1 = self.fun(s12);
            t12_2 = self.T.compose(t1, t2);
            self.T.assertEqv(t12_1, t12_2);
        end
        
        function law_identity(self)
            self.T.assertEqv(self.T.identity, self.fun(self.S.identity));
        end
        
    end
    
end
