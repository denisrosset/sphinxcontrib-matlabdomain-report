classdef OnDemandSamples < replab.Str
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+irreducible.OnDemandSamples.OnDemandSamples` -- 
%    - `~+replab.+irreducible.OnDemandSamples.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+irreducible.OnDemandSamples.commutantSample` -- 
%    - `~+replab.+irreducible.OnDemandSamples.commutantSamples` -- row cell array of double matrix: Samples from the commutant
%    - `~+replab.+irreducible.OnDemandSamples.disp` -- 
%    - `~+replab.+irreducible.OnDemandSamples.eq` -- Equality test
%    - `~+replab.+irreducible.OnDemandSamples.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+irreducible.OnDemandSamples.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+irreducible.OnDemandSamples.longStr` -- Multi-line description of the current object
%    - `~+replab.+irreducible.OnDemandSamples.rep` -- replab.Rep: Representation to compute things from
%    - `~+replab.+irreducible.OnDemandSamples.shortStr` -- Single line text description of the current object
%    - `~+replab.+irreducible.OnDemandSamples.trivial` -- 
%    - `~+replab.+irreducible.OnDemandSamples.trivialSample` -- 
%    - `~+replab.+irreducible.OnDemandSamples.trivialSamples` -- row cell array of double matrix: Self adjoint samples (TODO ?) from the trivial space
%    - `~+replab.+irreducible.OnDemandSamples.trivial_` -- replab.Equivariant: Equivariant space from rep to the trivial representation of size rep.dimension
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
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
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>


    properties (SetAccess = protected)
        rep % replab.Rep: Representation to compute things from
        commutantSamples % row cell array of double matrix: Samples from the commutant
        trivialSamples % row cell array of double matrix: Self adjoint samples (TODO ?) from the trivial space
    end

    properties (Access = protected)
        trivial_ % replab.Equivariant: Equivariant space from rep to the trivial representation of size rep.dimension
    end
    
    methods

        function self = OnDemandSamples(rep)
            self.rep = rep;
            self.commutantSamples = {};
            self.trivialSamples = {};
        end

        function T = trivial(self)
            if isempty(self.trivial_)
                trivialRep = self.rep.group.trivialRep(self.rep.field, self.rep.dimension);
                self.trivial_ = trivialRep.equivariant(self.rep);
            end
            T = self.trivial_;
        end
        
        function X = commutantSample(self, i)
            while length(self.commutantSamples) < i
                self.commutantSamples{1, end+1} = self.rep.commutant.sample;
            end
            X = self.commutantSamples{i};
        end

        function X = trivialSample(self, i)
            while length(self.trivialSamples) < i
                self.trivialSamples{1, end+1} = self.trivial.sample;
            end
            X = self.trivialSamples{i};
        end

    end

end
