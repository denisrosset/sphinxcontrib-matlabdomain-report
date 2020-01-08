classdef TrivialGroup < replab.FiniteGroup
% The trivial group containing the single element `[]`
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+bsgs.TrivialGroup.TrivialGroup` -- 
%    - `~+replab.+bsgs.TrivialGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+bsgs.TrivialGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+bsgs.TrivialGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+bsgs.TrivialGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.+bsgs.TrivialGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+bsgs.TrivialGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+bsgs.TrivialGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+bsgs.TrivialGroup.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+bsgs.TrivialGroup.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+bsgs.TrivialGroup.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+bsgs.TrivialGroup.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+bsgs.TrivialGroup.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+bsgs.TrivialGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+bsgs.TrivialGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.+bsgs.TrivialGroup.disp` -- 
%    - `~+replab.+bsgs.TrivialGroup.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+bsgs.TrivialGroup.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+bsgs.TrivialGroup.eq` -- Equality test
%    - `~+replab.+bsgs.TrivialGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+bsgs.TrivialGroup.generator` -- Returns the i-th group generator
%    - `~+replab.+bsgs.TrivialGroup.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+bsgs.TrivialGroup.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+bsgs.TrivialGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+bsgs.TrivialGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+bsgs.TrivialGroup.identity` -- Monoid identity element
%    - `~+replab.+bsgs.TrivialGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.+bsgs.TrivialGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+bsgs.TrivialGroup.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+bsgs.TrivialGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+bsgs.TrivialGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+bsgs.TrivialGroup.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+bsgs.TrivialGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+bsgs.TrivialGroup.nGenerators` -- Returns the number of group generators
%    - `~+replab.+bsgs.TrivialGroup.order` -- Returns the group order
%    - `~+replab.+bsgs.TrivialGroup.order_` -- vpi: Cached group order
%    - `~+replab.+bsgs.TrivialGroup.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+bsgs.TrivialGroup.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+bsgs.TrivialGroup.sample` -- Samples an element from this domain
%    - `~+replab.+bsgs.TrivialGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+bsgs.TrivialGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+bsgs.TrivialGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.+bsgs.TrivialGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
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
%    .. method:: decomposition
%
%       Documentation in :meth:`+replab.FiniteGroup.decomposition`
%
%    .. attribute:: decomposition_
%
%       Documentation in :attr:`+replab.FiniteGroup.decomposition_`
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
%    .. method:: elements
%
%       Documentation in :meth:`+replab.FiniteGroup.elements`
%
%    .. attribute:: elements_
%
%       Documentation in :attr:`+replab.FiniteGroup.elements_`
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: generator
%
%       Documentation in :meth:`+replab.FiniteGroup.generator`
%
%    .. method:: generatorInverse
%
%       Documentation in :meth:`+replab.FiniteGroup.generatorInverse`
%
%    .. attribute:: generators
%
%       Documentation in :attr:`+replab.FiniteGroup.generators`
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
%    .. method:: isTrivial
%
%       Documentation in :meth:`+replab.FiniteGroup.isTrivial`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Monoid.lambda`
%
%    .. method:: leftConjugate
%
%       Documentation in :meth:`+replab.Group.leftConjugate`
%
%    .. method:: leftRegularRep
%
%       Documentation in :meth:`+replab.FiniteGroup.leftRegularRep`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: nGenerators
%
%       Documentation in :meth:`+replab.FiniteGroup.nGenerators`
%
%    .. method:: order
%
%       Documentation in :meth:`+replab.FiniteGroup.order`
%
%    .. attribute:: order_
%
%       Documentation in :attr:`+replab.FiniteGroup.order_`
%
%    .. method:: randomBag
%
%       Documentation in :meth:`+replab.FiniteGroup.randomBag`
%
%    .. attribute:: randomBag_
%
%       Documentation in :attr:`+replab.FiniteGroup.randomBag_`
%
%    .. method:: sampleUniformly
%
%       Documentation in :meth:`+replab.CompactGroup.sampleUniformly`
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

    methods
        
        function self = TrivialGroup
            self.identity = [];
            self.generators = {};
        end
        
        % Domain
        
        function b = eqv(self, x, y)
            b = true;
        end
        
        function g = sample(self)
            g = [];
        end
        
        % Monoid
        
        function z = compose(self, x, y)
            z = [];
        end
        
        % Group
        
        function xInv = inverse(self, x)
            xInv = [];
        end
        
        % FiniteGroup
        
    end
    
    methods (Access = protected)
        
        function o = computeOrder(self)
            o = vpi(1);
        end
        
        function e = computeElements(self)
            e = replab.IndexedFamily.lambda(1, @(i) [], @(x) 1);
        end
        
        function d = computeDecomposition(self)
            d = replab.FiniteGroupDecomposition.trivial(group, {[]});
        end
        
    end
    
end
