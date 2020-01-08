classdef SubRepNULaws < replab.RepLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.SubRepNULaws.C` -- commutant algebra
%    - `~+replab.SubRepNULaws.G` -- group of which rep is a representation
%    - `~+replab.SubRepNULaws.M` -- n x n matrices over R, or C
%    - `~+replab.SubRepNULaws.RepLaws` -- 
%    - `~+replab.SubRepNULaws.SubRepNULaws` -- 
%    - `~+replab.SubRepNULaws.U` -- Unitary/orthonormal matrices on R or C
%    - `~+replab.SubRepNULaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.SubRepNULaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.SubRepNULaws.assert` -- Assert function with a verbose error message
%    - `~+replab.SubRepNULaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.SubRepNULaws.disp` -- 
%    - `~+replab.SubRepNULaws.eq` -- Equality test
%    - `~+replab.SubRepNULaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.SubRepNULaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.SubRepNULaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.SubRepNULaws.law_basis_is_consistent` -- 
%    - `~+replab.SubRepNULaws.law_commutes_with_commutant_algebra_GC` -- 
%    - `~+replab.SubRepNULaws.law_projector` -- 
%    - `~+replab.SubRepNULaws.law_relation_with_parent_rep_G` -- 
%    - `~+replab.SubRepNULaws.laws_asGroupHomomorphism` -- 
%    - `~+replab.SubRepNULaws.longStr` -- Multi-line description of the current object
%    - `~+replab.SubRepNULaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.SubRepNULaws.rep` -- 
%    - `~+replab.SubRepNULaws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. attribute:: C
%
%       Documentation in :attr:`+replab.RepLaws.C`
%
%    .. attribute:: G
%
%       Documentation in :attr:`+replab.RepLaws.G`
%
%    .. attribute:: M
%
%       Documentation in :attr:`+replab.RepLaws.M`
%
%    .. method:: RepLaws
%
%       No documentation
%
%    .. attribute:: U
%
%       Documentation in :attr:`+replab.RepLaws.U`
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
%    .. method:: law_commutes_with_commutant_algebra_GC
%
%       No documentation
%
%    .. method:: laws_asGroupHomomorphism
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
%    .. attribute:: rep
%
%       No documentation
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    methods
        
        function self = SubRepNULaws(rep)
            self = self@replab.RepLaws(rep);
        end
        
        function law_basis_is_consistent(self)
            self.M.assertEqv(self.rep.F * self.rep.H, eye(self.rep.dimension));
        end
        
        function law_projector(self)
            proj = self.rep.projector;
            self.assert(~replab.isNonZeroMatrix(proj*proj - proj, replab.Parameters.doubleEigTol));
        end
        
        function law_relation_with_parent_rep_G(self, g)
            if ~isempty(self.rep.parent)
                parentRho = self.rep.parent.image(g);
                proj = self.rep.projector;
                rho = self.rep.image(g);
                self.assert(~replab.isNonZeroMatrix(proj*parentRho - parentRho*proj, replab.Parameters.doubleEigTol));
                self.M.assertEqv(self.rep.F*parentRho*self.rep.H, rho);
            end
        end
        
    end
    
end
