classdef RepLaws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.RepLaws.C` -- commutant algebra
%    - `~+replab.RepLaws.G` -- group of which rep is a representation
%    - `~+replab.RepLaws.M` -- n x n matrices over R, or C
%    - `~+replab.RepLaws.RepLaws` -- 
%    - `~+replab.RepLaws.U` -- Unitary/orthonormal matrices on R or C
%    - `~+replab.RepLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.RepLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.RepLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.RepLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.RepLaws.disp` -- 
%    - `~+replab.RepLaws.eq` -- Equality test
%    - `~+replab.RepLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.RepLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.RepLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.RepLaws.law_commutes_with_commutant_algebra_GC` -- 
%    - `~+replab.RepLaws.laws_asGroupHomomorphism` -- 
%    - `~+replab.RepLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.RepLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.RepLaws.rep` -- 
%    - `~+replab.RepLaws.shortStr` -- Single line text description of the current object
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

    properties
        rep;
        G; % group of which rep is a representation
        C; % commutant algebra
        U; % Unitary/orthonormal matrices on R or C
        M; % n x n matrices over R, or C
    end
    
    methods
        
        function self = RepLaws(rep)
            self.rep = rep;
            d = self.rep.dimension;
            self.G = rep.group;
            self.C = rep.commutant;
            self.M = replab.domain.Matrices(rep.field, d, d);
            if rep.isUnitary
                switch rep.field
                  case 'R'
                    self.U = replab.OrthogonalGroup(d);
                  case 'C'
                    self.U = replab.UnitaryGroup(d);
                end
            else
                self.U = replab.GeneralLinearGroup(rep.field, d);
            end
        end
        function morphismLaws = laws_asGroupHomomorphism(self)
            morphismLaws = replab.GroupMorphismLaws(@(g) self.rep.image(g), self.G, self.U);
        end
        function law_commutes_with_commutant_algebra_GC(self, g, c)
            rho = self.rep.image(g);
            self.M.assertEqv(rho*c, c*rho);
        end
    end
end
