classdef SubRepLaws < replab.RepLaws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.SubRepLaws.C` -- commutant algebra
%    - `~+replab.SubRepLaws.G` -- group of which rep is a representation
%    - `~+replab.SubRepLaws.M` -- n x n matrices over R, or C
%    - `~+replab.SubRepLaws.RepLaws` -- 
%    - `~+replab.SubRepLaws.SubRepLaws` -- 
%    - `~+replab.SubRepLaws.U` -- Unitary/orthonormal matrices on R or C
%    - `~+replab.SubRepLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.SubRepLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.SubRepLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.SubRepLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.SubRepLaws.disp` -- 
%    - `~+replab.SubRepLaws.eq` -- Equality test
%    - `~+replab.SubRepLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.SubRepLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.SubRepLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.SubRepLaws.law_basis_is_unitary` -- 
%    - `~+replab.SubRepLaws.law_commutes_with_commutant_algebra_GC` -- 
%    - `~+replab.SubRepLaws.law_nice_basis_reproduces_basis` -- 
%    - `~+replab.SubRepLaws.law_relation_with_parent_rep_G` -- 
%    - `~+replab.SubRepLaws.law_respects_division_algebra_G` -- 
%    - `~+replab.SubRepLaws.laws_asGroupHomomorphism` -- 
%    - `~+replab.SubRepLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.SubRepLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.SubRepLaws.rep` -- 
%    - `~+replab.SubRepLaws.shortStr` -- Single line text description of the current object
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
        
        function self = SubRepLaws(rep)
            self = self@replab.RepLaws(rep);
        end
        
        function law_basis_is_unitary(self)
            self.M.assertEqv(self.rep.U * self.rep.U', eye(self.rep.dimension));
        end
        
        function law_relation_with_parent_rep_G(self, g)
            if ~isempty(self.rep.parent)
                parentRho = self.rep.parent.image(g);
                proj = self.rep.projector;
                rho = self.rep.image(g);
                self.assert(~replab.isNonZeroMatrix(proj*parentRho - parentRho*proj, replab.Parameters.doubleEigTol));
                self.M.assertEqv(self.rep.U*parentRho*self.rep.U', rho);
            end
        end
        
        function law_nice_basis_reproduces_basis(self)
            if ~isempty(self.rep.niceBasis)
                self.assert(~replab.isNonZeroMatrix(self.rep.niceBasis.U - self.rep.U, replab.Parameters.doubleEigTol));
            end
        end

        function law_respects_division_algebra_G(self, g)
            if isequal(self.rep.field, 'R') && self.rep.isKnownCanonicalIrreducible
                rho = self.rep.image(g);
                if isequal(self.rep.irrepInfo.divisionAlgebra, 'C')
                    rho1 = replab.domain.ComplexTypeMatrices.project(rho);
                    self.M.assertEqv(rho, rho1);
                elseif isequal(self.rep.irrepInfo.divisionAlgebra, 'H')
                    rho1 = replab.domain.QuaternionTypeMatrices.project(rho);
                    self.M.assertEqv(rho, rho1);
                end
            end
        end
        
    end
    
end
