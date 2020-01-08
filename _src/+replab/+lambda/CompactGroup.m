classdef CompactGroup < replab.Group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lambda.CompactGroup.Group` -- 
%    - `~+replab.+lambda.CompactGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+lambda.CompactGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+lambda.CompactGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+lambda.CompactGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.+lambda.CompactGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+lambda.CompactGroup.composeFun` -- 
%    - `~+replab.+lambda.CompactGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+lambda.CompactGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+lambda.CompactGroup.disp` -- 
%    - `~+replab.+lambda.CompactGroup.eq` -- Equality test
%    - `~+replab.+lambda.CompactGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+lambda.CompactGroup.eqvFun` -- 
%    - `~+replab.+lambda.CompactGroup.header` -- 
%    - `~+replab.+lambda.CompactGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+lambda.CompactGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+lambda.CompactGroup.identity` -- Monoid identity element
%    - `~+replab.+lambda.CompactGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.+lambda.CompactGroup.inverseFun` -- 
%    - `~+replab.+lambda.CompactGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+lambda.CompactGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+lambda.CompactGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+lambda.CompactGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+lambda.CompactGroup.sample` -- Samples an element from this domain
%    - `~+replab.+lambda.CompactGroup.sampleFun` -- 
%    - `~+replab.+lambda.CompactGroup.sampleUniformly` -- 
%    - `~+replab.+lambda.CompactGroup.sampleUniformlyFun` -- 
%    - `~+replab.+lambda.CompactGroup.shortStr` -- Single line text description of the current object
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
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
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
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        header
        eqvFun
        sampleFun
        composeFun
        inverseFun
        sampleUniformlyFun
    end
    
    methods
        
        function self = Group(header, eqvFun, sampleFun, ... % Domain
                              composeFun, identity, ... % Monoid
                              inverseFun, ... % Group
                              sampleUniformlyFun) % CompactGroup
            self.header = header;
            self.eqvFun = eqvFun;
            self.sampleFun
            self.composeFun = composeFun;
            self.identity = identity;
            self.inverseFun = inverseFun;
            self.sampleUniformlyFun = sampleUniformlyFun;
        end
        
        function str = headerStr(self)
            str = self.header;
        end

        function names = hiddenFields(self)
            names = replab.str.uniqueNames( ...
                hiddenFields@replab.Group(self), ...
                {'header'} ...
                );
        end
        
        % Domain methods
        
        function b = eqv(self, t, u)
            f = self.eqvFun;
            b = f(t, u);
        end

        function t = sample(self)
            f = self.sampleFun;
            t = f();
        end

        % Monoid methods
        
        function z = compose(self, x, y)
            error('Not implemented');
            f = self.composeFun;
            z = f(x, y);
        end
        
        % Group methods
        
        function xInv = inverse(self, x)
            f = self.inverseFun;
            xInv = f(x);
        end
        
        % CompactGroup methods
        
        function g = sampleUniformly(self)
            f = self.sampleUniformlyFun;
            g = f();
        end
    
    end
    
end
