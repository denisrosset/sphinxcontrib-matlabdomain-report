classdef OfCompactGroup < replab.semidirectproduct.OfCompactGroups & replab.wreathproduct.Common
% Wreath product of a permutation group acting on a compact group
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+wreathproduct.OfCompactGroup.A` -- replab.CompactGroup: factor of base group
%    - `~+replab.+wreathproduct.OfCompactGroup.H` -- replab.CompactGroup: Group acting
%    - `~+replab.+wreathproduct.OfCompactGroup.N` -- replab.CompactGroup: Group acted upon
%    - `~+replab.+wreathproduct.OfCompactGroup.OfCompactGroup` -- 
%    - `~+replab.+wreathproduct.OfCompactGroup.OfCompactGroups` -- 
%    - `~+replab.+wreathproduct.OfCompactGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+wreathproduct.OfCompactGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.+wreathproduct.OfCompactGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+wreathproduct.OfCompactGroup.compose` -- Composition
%    - `~+replab.+wreathproduct.OfCompactGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.+wreathproduct.OfCompactGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.+wreathproduct.OfCompactGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.+wreathproduct.OfCompactGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.+wreathproduct.OfCompactGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.+wreathproduct.OfCompactGroup.disp` -- 
%    - `~+replab.+wreathproduct.OfCompactGroup.eq` -- Equality test
%    - `~+replab.+wreathproduct.OfCompactGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+wreathproduct.OfCompactGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+wreathproduct.OfCompactGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+wreathproduct.OfCompactGroup.identity` -- Monoid identity element
%    - `~+replab.+wreathproduct.OfCompactGroup.imprimitivePermutation` -- Returns the permutation corresponding to the canonical imprimitive action
%    - `~+replab.+wreathproduct.OfCompactGroup.imprimitiveRep` -- Returns an imprimitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfCompactGroup.imprimitiveRepFun` -- Returns an imprimitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfCompactGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.+wreathproduct.OfCompactGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.+wreathproduct.OfCompactGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.+wreathproduct.OfCompactGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.+wreathproduct.OfCompactGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.+wreathproduct.OfCompactGroup.n` -- integer: Number of copies of the base group
%    - `~+replab.+wreathproduct.OfCompactGroup.phi` -- replab.Action: Action of H on N
%    - `~+replab.+wreathproduct.OfCompactGroup.primitivePermutation` -- Returns the permutation corresponding to the canonical primitive action
%    - `~+replab.+wreathproduct.OfCompactGroup.primitiveRep` -- Returns a primitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfCompactGroup.primitiveRepFun` -- Returns an primitive representation of this wreath product
%    - `~+replab.+wreathproduct.OfCompactGroup.requiredType` -- 
%    - `~+replab.+wreathproduct.OfCompactGroup.sample` -- Samples an element from this domain
%    - `~+replab.+wreathproduct.OfCompactGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.+wreathproduct.OfCompactGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.+wreathproduct.OfCompactGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.+wreathproduct.OfCompactGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. attribute:: A
%
%       Documentation in :attr:`+replab.+wreathproduct.Common.A`
%
%    .. attribute:: H
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.H`
%
%    .. attribute:: N
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.N`
%
%    .. method:: OfCompactGroups
%
%       No documentation
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
%    .. method:: compose
%
%       Documentation in :meth:`+replab.+semidirectproduct.OfCompactGroups.compose`
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
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
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
%    .. method:: imprimitivePermutation
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.imprimitivePermutation`
%
%    .. method:: imprimitiveRep
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.imprimitiveRep`
%
%    .. method:: imprimitiveRepFun
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.imprimitiveRepFun`
%
%    .. method:: inverse
%
%       Documentation in :meth:`+replab.Group.inverse`
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
%    .. attribute:: n
%
%       Documentation in :attr:`+replab.+wreathproduct.Common.n`
%
%    .. attribute:: phi
%
%       Documentation in :attr:`+replab.+semidirectproduct.OfCompactGroups.phi`
%
%    .. method:: primitivePermutation
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.primitivePermutation`
%
%    .. method:: primitiveRep
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.primitiveRep`
%
%    .. method:: primitiveRepFun
%
%       Documentation in :meth:`+replab.+wreathproduct.Common.primitiveRepFun`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Domain.sample`
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
        
        function self = OfCompactGroup(H, A)
            assert(isa(H, 'replab.PermutationGroup'));
            n = H.domainSize;
            base = A.directPower(n);
            phi = replab.perm.PermutationCellAction(H, base);
            self@replab.semidirectproduct.OfCompactGroups(phi);
            assert(isa(A, self.requiredType));
            self.n = n;
            self.A = A;
        end

        function t = requiredType(self)
            t = 'replab.CompactGroup';
        end
        
    end
    
end
