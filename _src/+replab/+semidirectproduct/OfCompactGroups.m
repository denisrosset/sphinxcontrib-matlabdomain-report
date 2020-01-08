classdef OfCompactGroups < replab.CompactGroup
% Describes an external semidirect product of compact groups
%
% See `replab.CompactGroup.semidirectProduct`
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+semidirectproduct.OfCompactGroups.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+semidirectproduct.OfCompactGroups.N` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+semidirectproduct.OfCompactGroups.OfCompactGroups` -- 
%    - `~+replab.+semidirectproduct.OfCompactGroups.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+semidirectproduct.OfCompactGroups.assertEqv` -- Compares two elements for equality
%    - `~+replab.+semidirectproduct.OfCompactGroups.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+semidirectproduct.OfCompactGroups.compose` -- Composition
%    - `~+replab.+semidirectproduct.OfCompactGroups.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+semidirectproduct.OfCompactGroups.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+semidirectproduct.OfCompactGroups.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+semidirectproduct.OfCompactGroups.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+semidirectproduct.OfCompactGroups.directProduct` -- Returns the direct product of groups
%    - `~+replab.+semidirectproduct.OfCompactGroups.disp` -- 
%    - `~+replab.+semidirectproduct.OfCompactGroups.eq` -- Equality test
%    - `~+replab.+semidirectproduct.OfCompactGroups.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+semidirectproduct.OfCompactGroups.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+semidirectproduct.OfCompactGroups.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+semidirectproduct.OfCompactGroups.identity` -- Monoid identity element
%    - `~+replab.+semidirectproduct.OfCompactGroups.inverse` -- Computes the inverse of an element
%    - `~+replab.+semidirectproduct.OfCompactGroups.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+semidirectproduct.OfCompactGroups.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+semidirectproduct.OfCompactGroups.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+semidirectproduct.OfCompactGroups.longStr` -- Multi-line description of the current object
%    - `~+replab.+semidirectproduct.OfCompactGroups.phi` -- replab.Action: Action of H on N
%    - `~+replab.+semidirectproduct.OfCompactGroups.requiredType` -- 
%    - `~+replab.+semidirectproduct.OfCompactGroups.sample` -- Samples an element from this domain
%    - `~+replab.+semidirectproduct.OfCompactGroups.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+semidirectproduct.OfCompactGroups.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+semidirectproduct.OfCompactGroups.shortStr` -- Single line text description of the current object
%    - `~+replab.+semidirectproduct.OfCompactGroups.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: assertEqv
%
%       Documentation in :meth:`+replab.Domain.assertEqv`
%
%    .. method:: assertNotEqv
%
%       Documentation in :meth:`+replab.Domain.assertNotEqv`
%
%    .. method:: composeAll
%
%       Documentation in :meth:`+replab.Monoid.composeAll`
%
%    .. method:: composeN
%
%       Documentation in :meth:`+replab.Monoid.composeN`
%
%    .. method:: composeWithInverse
%
%       Documentation in :meth:`+replab.Group.composeWithInverse`
%
%    .. method:: directPower
%
%       Documentation in :meth:`+replab.CompactGroup.directPower`
%
%    .. method:: directProduct
%
%       Documentation in :meth:`+replab.CompactGroup.directProduct`
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
%    .. attribute:: identity
%
%       Documentation in :attr:`+replab.Monoid.identity`
%
%    .. method:: isIdentity
%
%       Documentation in :meth:`+replab.Monoid.isIdentity`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Monoid.lambda`
%
%    .. method:: leftConjugate
%
%       Documentation in :meth:`+replab.Group.leftConjugate`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: semidirectProduct
%
%       Documentation in :meth:`+replab.CompactGroup.semidirectProduct`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. method:: trivialRep
%
%       Documentation in :meth:`+replab.CompactGroup.trivialRep`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        H % replab.CompactGroup: Group acting
        N % replab.CompactGroup: Group acted upon
        phi % replab.Action: Action of H on N
    end

    methods
        
        function self = OfCompactGroups(phi)
            assert(isa(phi, 'replab.Action'));
            H = phi.G;
            N = phi.P;
            self.phi = phi;
            assert(isa(H, self.requiredType));
            assert(isa(N, self.requiredType));
            self.H = H;
            self.N = N;
            self.identity = {H.identity N.identity};
        end
        
        function t = requiredType(self)
            t = 'replab.CompactGroup';
        end
        
        %% Domain methods
        
        function b = eqv(self, x, y)
            b = self.H.eqv(x{1}, y{1}) && self.N.eqv(x{2}, y{2});
        end
        
        function g = sample(self)
            g = {self.H.sample self.N.sample};
        end
        
        %% Monoid methods

        function z = compose(self, x, y)
        % Composition
        %
        % Relation to phi is the conjugation
        % phi_h(n) = h n h^-1
        % we have z = xh xn yh yn = xh yh yh^-1 xn yh yn =
        % = xh yh phi_(yh^-1)(xn) yn
        % and thus
        % zh = xh yh
        % zn = phi_(yh^-1)(xn) yn
            xh = x{1};
            xn = x{2};
            yh = y{1};
            yn = y{2};
            yhinv = self.H.inverse(yh);
            zh = self.H.compose(xh, yh);
            zn = self.N.compose(self.phi.leftAction(yhinv, xn), yn);
            z = {zh zn};
        end
        
        %% Group methods
        
        function z = inverse(self, x)
            xh = x{1};
            xn = x{2};
            zh = self.H.inverse(xh);
            zn = self.N.inverse(self.phi.leftAction(xh, xn));
            z = {zh zn};
        end
        
        %% CompactGroup methods
        
        function g = sampleUniformly(self)
            g = {self.H.sampleUniformly self.N.sampleUniformly};
        end
        
    end

end
