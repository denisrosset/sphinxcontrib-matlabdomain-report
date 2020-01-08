classdef GeneralizedPauli < replab.FiniteGroup
% Returns a definition of the generalized Pauli group
%
% See for example https://arxiv.org/pdf/quant-ph/0408190.pdf
% 
% An element of the Pauli group of dimension d is represented by
% three integers a, b, c = 0,...,d-1 in a row vector [a b c]
% such that for g = [a b c], the represented group element is
%    w^a x^b z^c
%
% w is a common phase
% x is a cyclic shift of levels
% z is a level-dependent phase 
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+quantum.GeneralizedPauli.GeneralizedPauli` -- 
%    - `~+replab.+quantum.GeneralizedPauli.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+quantum.GeneralizedPauli.assertEqv` -- Compares two elements for equality
%    - `~+replab.+quantum.GeneralizedPauli.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+quantum.GeneralizedPauli.compose` -- Composes two monoid/group elements
%    - `~+replab.+quantum.GeneralizedPauli.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+quantum.GeneralizedPauli.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+quantum.GeneralizedPauli.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+quantum.GeneralizedPauli.computeDecomposition` -- Computes the result cached by self.decomposition
%    - `~+replab.+quantum.GeneralizedPauli.computeElements` -- Computes the result cached by self.elements
%    - `~+replab.+quantum.GeneralizedPauli.computeOrder` -- Computes the result cached by self.order
%    - `~+replab.+quantum.GeneralizedPauli.d` -- Dimension of the qudit
%    - `~+replab.+quantum.GeneralizedPauli.decomposition` -- Returns a decomposition of this group as a product of sets
%    - `~+replab.+quantum.GeneralizedPauli.decomposition_` -- `.FiniteGroupDecomposition`: Cached decomposition of this group
%    - `~+replab.+quantum.GeneralizedPauli.definingRep` -- 
%    - `~+replab.+quantum.GeneralizedPauli.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+quantum.GeneralizedPauli.directProduct` -- Returns the direct product of groups
%    - `~+replab.+quantum.GeneralizedPauli.disp` -- 
%    - `~+replab.+quantum.GeneralizedPauli.elementAt` -- 
%    - `~+replab.+quantum.GeneralizedPauli.elementFind` -- 
%    - `~+replab.+quantum.GeneralizedPauli.elements` -- Returns an indexed family of the group elements
%    - `~+replab.+quantum.GeneralizedPauli.elements_` -- `.IndexedFamily`: Cached indexed family of group elements
%    - `~+replab.+quantum.GeneralizedPauli.eq` -- Equality test
%    - `~+replab.+quantum.GeneralizedPauli.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+quantum.GeneralizedPauli.generator` -- Returns the i-th group generator
%    - `~+replab.+quantum.GeneralizedPauli.generatorInverse` -- Returns the inverse of the i-th group generator
%    - `~+replab.+quantum.GeneralizedPauli.generators` -- row cell array of group elements: Group generators
%    - `~+replab.+quantum.GeneralizedPauli.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+quantum.GeneralizedPauli.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+quantum.GeneralizedPauli.identity` -- Monoid identity element
%    - `~+replab.+quantum.GeneralizedPauli.inverse` -- Computes the inverse of an element
%    - `~+replab.+quantum.GeneralizedPauli.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+quantum.GeneralizedPauli.isTrivial` -- Tests whether this group is trivial
%    - `~+replab.+quantum.GeneralizedPauli.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+quantum.GeneralizedPauli.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+quantum.GeneralizedPauli.leftRegularRep` -- Returns the left regular representation of this group
%    - `~+replab.+quantum.GeneralizedPauli.longStr` -- Multi-line description of the current object
%    - `~+replab.+quantum.GeneralizedPauli.nGenerators` -- Returns the number of group generators
%    - `~+replab.+quantum.GeneralizedPauli.order` -- Returns the group order
%    - `~+replab.+quantum.GeneralizedPauli.order_` -- vpi: Cached group order
%    - `~+replab.+quantum.GeneralizedPauli.randomBag` -- Returns an instance of the product-replacement algorithm data structure
%    - `~+replab.+quantum.GeneralizedPauli.randomBag_` -- `.RandomBag`: Bag of elements used for random sampling
%    - `~+replab.+quantum.GeneralizedPauli.rootsOfUnity` -- Returns E(d)^0 E(d)^1 ... E(d)^(d-1) where E(d) = exp(2i*pi/d)
%    - `~+replab.+quantum.GeneralizedPauli.sample` -- Samples an element from this domain
%    - `~+replab.+quantum.GeneralizedPauli.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+quantum.GeneralizedPauli.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+quantum.GeneralizedPauli.shortStr` -- Single line text description of the current object
%    - `~+replab.+quantum.GeneralizedPauli.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
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
%    .. method:: computeDecomposition
%
%       Documentation in :meth:`+replab.FiniteGroup.computeDecomposition`
%
%    .. method:: computeElements
%
%       Documentation in :meth:`+replab.FiniteGroup.computeElements`
%
%    .. method:: computeOrder
%
%       Documentation in :meth:`+replab.FiniteGroup.computeOrder`
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


    properties
        d % Dimension of the qudit
    end
        
    methods
        
        function self = GeneralizedPauli(d)
            self.d = d;
            self.identity = [0 0 0];
            % group generators
            w = [1 0 0];
            x = [0 1 0];
            z = [0 0 1];
            self.generators = {w x z};
        end
        
        function o = order(self)
            o = vpi(self.d)^3;
        end
        
        function E = elements(self)
            E = replab.IndexedFamily.lambda(self.order, ...
                                            @(ind) self.elementAt(ind), ...
                                            @(el) self.elementFind(el));
        end
        
        function x3 = compose(self, x1, x2)
            d = self.d;
            a1 = x1(1);
            b1 = x1(2);
            c1 = x1(3);
            a2 = x2(1);
            b2 = x2(2);
            c2 = x2(3);
            a3 = mod(a1 + a2 + c1*b2, d);
            b3 = mod(b1 + b2, d);
            c3 = mod(c1 + c2, d);
            x3 = [a3 b3 c3];
        end
        
        function b = eqv(self, x1, x2)
            b = isequal(x1, x2);
        end
        
        function x = sample(self)
            x = randi([0 self.d-1], 1, 3);
        end
        
        function x2 = inverse(self, x1)
            d = self.d;
            a1 = x1(1);
            b1 = x1(2);
            c1 = x1(3);
            a2 = mod(d - a1 + b1*c1, d);
            b2 = mod(d - b1, d);
            c2 = mod(d - c1, d);
            x2 = [a2 b2 c2];
        end
        
        function D = decomposition(self)
            d = self.d;
            i1 = arrayfun(@(i) [i 0 0], 0:d-1, 'UniformOutput', false);
            i2 = arrayfun(@(i) [0 i 0], 0:d-1, 'UniformOutput', false);
            i3 = arrayfun(@(i) [0 0 i], 0:d-1, 'UniformOutput', false);
            D = replab.FiniteGroupDecomposition(self, {i1 i2 i3});
        end
        
        function omega = rootsOfUnity(self)
        % Returns E(d)^0 E(d)^1 ... E(d)^(d-1) where E(d) = exp(2i*pi/d)
            d = self.d;
            switch d
              case 1
                omega = 1;
              case 2
                omega = [1 -1];
              case 4
                omega = [1 1i -1 -1i];
              otherwise
                omega = exp(2i*pi*(0:d-1)/d);
            end
        end
        
        function rep = definingRep(self)
            omega = self.rootsOfUnity;
            d = self.d;
            W = diag(omega(2)*ones(1, d));
            X = full(sparse([2:d 1], 1:d, ones(1, d)));
            Z = diag(omega);
            rep = replab.Rep.lambda(self, 'C', d, true, @(g) W^g(1)*X^g(2)*Z^g(3));
        end

    end

    methods (Access = protected) % Implementation of element enumeration
        
        function el = elementAt(self, index)
            d = self.d;
            ind = index - 1;
            c = double(mod(ind, d));
            ind = (ind - c)/d;
            b = double(mod(ind, d));
            ind = (ind - b)/d;
            a = double(ind);
            el = [a b c];
        end
        
        function index = elementFind(self, x);
            d = self.d;
            a = x(1);
            b = x(2);
            c = x(3);
            index = vpi(a)*d*d + vpi(b)*d + vpi(c + 1);
        end
        
    end

end
