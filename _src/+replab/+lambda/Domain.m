classdef Domain < replab.Domain
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lambda.Domain.Domain` -- 
%    - `~+replab.+lambda.Domain.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+lambda.Domain.assertEqv` -- Compares two elements for equality
%    - `~+replab.+lambda.Domain.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+lambda.Domain.disp` -- 
%    - `~+replab.+lambda.Domain.eq` -- Equality test
%    - `~+replab.+lambda.Domain.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+lambda.Domain.eqvFun` -- 
%    - `~+replab.+lambda.Domain.header` -- 
%    - `~+replab.+lambda.Domain.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+lambda.Domain.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+lambda.Domain.lambda` -- Constructs a domain from function handles
%    - `~+replab.+lambda.Domain.longStr` -- Multi-line description of the current object
%    - `~+replab.+lambda.Domain.sample` -- Samples an element from this domain
%    - `~+replab.+lambda.Domain.sampleFun` -- 
%    - `~+replab.+lambda.Domain.shortStr` -- Single line text description of the current object
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
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Domain.lambda`
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
    end
    
    methods
        
        function self = Domain(header, eqvFun, sampleFun)
            self.header = header;
            self.eqvFun = eqvFun;
            self.sampleFun = sampleFun;
        end
        
        function str = headerStr(self)
            str = self.header;
        end
        
        function names = hiddenFields(self)
            names = replab.str.uniqueNames( ...
                hiddenFields@replab.Domain(self), ...
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

    end
    
end
