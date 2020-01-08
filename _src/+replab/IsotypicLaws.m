classdef IsotypicLaws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IsotypicLaws.C` -- replab.Commutant: Commutant algebra
%    - `~+replab.IsotypicLaws.G` -- replab.CompactGroup: group of which iso is a representation decomposition
%    - `~+replab.IsotypicLaws.IsotypicLaws` -- 
%    - `~+replab.IsotypicLaws.M1` -- replab.domain.Matrices: n x n matrices over R or C
%    - `~+replab.IsotypicLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.IsotypicLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IsotypicLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.IsotypicLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.IsotypicLaws.disp` -- 
%    - `~+replab.IsotypicLaws.eq` -- Equality test
%    - `~+replab.IsotypicLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.IsotypicLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IsotypicLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IsotypicLaws.iso` -- replab.Isotypic: Isotypic component
%    - `~+replab.IsotypicLaws.law_all_irreps_equivalent_C` -- 
%    - `~+replab.IsotypicLaws.law_all_irreps_same_basis_G` -- 
%    - `~+replab.IsotypicLaws.laws_subReps` -- 
%    - `~+replab.IsotypicLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.IsotypicLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.IsotypicLaws.shortStr` -- Single line text description of the current object
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
        iso % replab.Isotypic: Isotypic component
        C % replab.Commutant: Commutant algebra
        G % replab.CompactGroup: group of which iso is a representation decomposition
        M1  % replab.domain.Matrices: n x n matrices over R or C
    end
    
    methods
        
        function self = IsotypicLaws(iso)
            assert(isa(iso, 'replab.Isotypic'));
            self.iso = iso;
            self.C = iso.commutant;
            self.G = iso.group;
            d1 = iso.irrepDimension;
            self.M1 = replab.domain.Matrices(iso.field, d1, d1);
        end
        
        function irrepLaws = laws_subReps(self)
            children = cellfun(@(x) replab.SubRepLaws(x), self.iso.irreps, 'uniform', 0);
            irrepLaws = replab.LawsCollection(children);
        end
        
        function law_all_irreps_equivalent_C(self, c)
            m = self.iso.multiplicity;
            d1 = self.iso.irrepDimension;
            for i = 1:m
                for j = i:m
                    rows = (i-1)*d1+(1:d1);
                    cols = (j-1)*d1+(1:d1);
                    self.M1.assertNotEqv(c(rows, cols), zeros(d1, d1));
                end
            end
        end
        
        function law_all_irreps_same_basis_G(self, g)
            image1 = self.iso.irrep(1).image(g);
            for i = 2:self.iso.nIrreps
                imagei = self.iso.irrep(i).image(g);
                self.M1.assertEqv(image1, imagei);
            end
        end
        
    end
    
end
