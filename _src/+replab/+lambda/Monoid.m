classdef Monoid < replab.Monoid
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lambda.Monoid.Monoid` -- 
%    - `~+replab.+lambda.Monoid.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+lambda.Monoid.assertEqv` -- Compares two elements for equality
%    - `~+replab.+lambda.Monoid.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+lambda.Monoid.compose` -- Composes two monoid/group elements
%    - `~+replab.+lambda.Monoid.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+lambda.Monoid.composeFun` -- 
%    - `~+replab.+lambda.Monoid.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+lambda.Monoid.disp` -- 
%    - `~+replab.+lambda.Monoid.eq` -- Equality test
%    - `~+replab.+lambda.Monoid.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+lambda.Monoid.eqvFun` -- 
%    - `~+replab.+lambda.Monoid.header` -- 
%    - `~+replab.+lambda.Monoid.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+lambda.Monoid.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+lambda.Monoid.identity` -- Monoid identity element
%    - `~+replab.+lambda.Monoid.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+lambda.Monoid.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+lambda.Monoid.longStr` -- Multi-line description of the current object
%    - `~+replab.+lambda.Monoid.sample` -- Samples an element from this domain
%    - `~+replab.+lambda.Monoid.sampleFun` -- 
%    - `~+replab.+lambda.Monoid.shortStr` -- Single line text description of the current object
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
    end

    methods
        
        function self = Monoid(header, eqvFun, sampleFun, composeFun, identity)
            self.header = header;
            self.eqvFun = eqvFun;
            self.sampleFun = sampleFun;
            self.composeFun = composeFun;
            self.identity = identity;
        end
        
        function str = headerStr(self)
            str = self.header;
        end
        
        function names = hiddenFields(self)
            names = replab.str.uniqueNames( ...
                hiddenFields@replab.Monoid(self), ...
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
            f = self.composeFun;
            z = f(x, y);
        end
        
    end
    
end
