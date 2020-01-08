classdef CompactGroup < replab.Group
% A group equipped with a Haar measure
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.CompactGroup.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.CompactGroup.assertEqv` -- Compares two elements for equality
%    - `~+replab.CompactGroup.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.CompactGroup.compose` -- Composes two monoid/group elements
%    - `~+replab.CompactGroup.composeAll` -- Composes a sequence of monoid elements
%    - `~+replab.CompactGroup.composeN` -- Computes ``y = x^n`` by repeated squaring
%    - `~+replab.CompactGroup.composeWithInverse` -- Returns the composition of an element with the inverse of another element
%    - `~+replab.CompactGroup.directPower` -- Returns the direct product of this group with itself a number of times
%    - `~+replab.CompactGroup.directProduct` -- Returns the direct product of groups
%    - `~+replab.CompactGroup.disp` -- 
%    - `~+replab.CompactGroup.eq` -- Equality test
%    - `~+replab.CompactGroup.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.CompactGroup.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.CompactGroup.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.CompactGroup.identity` -- Monoid identity element
%    - `~+replab.CompactGroup.inverse` -- Computes the inverse of an element
%    - `~+replab.CompactGroup.isIdentity` -- Returns true if x is the identity, false otherwise
%    - `~+replab.CompactGroup.lambda` -- Constructs a monoid from function handles
%    - `~+replab.CompactGroup.leftConjugate` -- Returns the left conjugate of a group element
%    - `~+replab.CompactGroup.longStr` -- Multi-line description of the current object
%    - `~+replab.CompactGroup.sample` -- Samples an element from this domain
%    - `~+replab.CompactGroup.sampleUniformly` -- Samples from the Haar measure
%    - `~+replab.CompactGroup.semidirectProduct` -- Describes an external semidirect product of groups
%    - `~+replab.CompactGroup.shortStr` -- Single line text description of the current object
%    - `~+replab.CompactGroup.trivialRep` -- Returns the trivial representation of this group on a finite dimensional vector space
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
%    .. method:: compose
%
%       Documentation in :meth:`+replab.Monoid.compose`
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
%    .. method:: inverse
%
%       Documentation in :meth:`+replab.Group.inverse`
%
%    .. method:: isIdentity
%
%       Documentation in :meth:`+replab.Monoid.isIdentity`
%
%    .. method:: leftConjugate
%
%       Documentation in :meth:`+replab.Group.leftConjugate`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Domain.sample`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>


    methods
        
        %% Abstract
        
        function g = sampleUniformly(self)
        % Samples from the Haar measure
        %
        % Returns:
        %   element: Group element sampled from the Haar measure
            error('Abstract');
        end
        
        %% Group construction
        
        function prd = directProduct(varargin)
        % Returns the direct product of groups
        %
        % Args:
        %   varargin: Variable number of arguments of type `replab.CompactGroup`
        %
        % Returns:
        %   replab.CompactGroup: The direct product group
        %                        If all groups are of type `replab.NiceFiniteGroup`, the return type
        %                        is `replab.NiceFiniteGroup` as well.
        %                        If all groups are of type `replab.FiniteGroup`, the return type
        %                        is `replab.FiniteGroup` as well.
            prd = replab.directproduct.of(varargin);
        end
        
        function prd = directPower(self, n)
        % Returns the direct product of this group with itself a number of times
        %
        % Args:
        %   n (integer): Number of copies
        %
        % Returns:
        %   replab.CompactGroup: The direct product self x ...(n times)... x self
        %                        The return type is specialized as in `replab.CompactGroup.directProduct`.
            factors = arrayfun(@(x) self, 1:n, 'uniform', 0);
            prd = replab.directproduct.of(factors);
        end
        
        function sd = semidirectProduct(self, N, phi)
        % Describes an external semidirect product of groups
        %
        % See the construction in https://en.wikipedia.org/wiki/Semidirect_product
        %
        %    
        % Let ``H = self`` be a group, `N` a group.
        %
        % The semidirect product is defined using a homomorphism 
        %
        % `` phi: H -> Aut(N) ``
        %
        % which we write here
        % 
        % `` phi: H x N -> N ``, ``n1 = phi(h, n)``
        %
        % Here, we describe this homomorphism by a function handle with parameters of type
        % ``H x N``.
        %
        % We write each semidirect group element {h n}.
        %
        % The type of the return value depends on the most refined type at the intersection
        % of the type of `self` and `N`, with possible types CompactGroup/FiniteGroup/NiceFiniteGroup.
        %
        % Args:
        %   N (replab.CompactGroup): Group acted upon
        %   phi (function_handle): Function describing a homomorphism as described above
        %
        % Returns:
        %   replab.CompactGroup: Semidirect product group
            action = replab.Action.lambda('Semidirect homomorphism', self, N, phi);
            sd = replab.semidirectproduct.of(action);
        end
        
        %% Representations
        
        function rep = trivialRep(self, field, dimension)
        % Returns the trivial representation of this group on a finite dimensional vector space
        %
        % For convenience, either the representation can act on a real or complex vector space,
        % and multiple copies of the 1-dimensional trivial representation can be included, when
        % dimension > 1.
        % 
        % Args:
        %   field ({'R', 'C'}): Whether the representation is real (R) or complex (C)
        %   dimension (integer, optional): Representation dimension
        %                                  Default value 1
        %
        % Returns:
        %   replab.Rep: An instance of the trivial representation
            if nargin < 2
                dimension = 1;
            end
            rep = replab.rep.TrivialRep(self, field, dimension);
        end
        
    end

    methods (Static)
        
        function group = lambda(header, eqvFun, sampleFun, ...
                                composeFun, identity, inverseFun, ...
                                sampleUniformlyFun)
        % Constructs a compact group from function handles
        %
        % Args:
        %   header (char): Header display string
        %   eqvFun (function_handle): Handle implementing the `eqv` method
        %   sampleFun (function_handle): Handle implementing the `sample` method
        %   composeFun (function_handle): Handle implementing the `compose` method
        %   identity (element): Identity element of this monoid
        %   inverseFun (function_handle): Handle implementing the `inverse` method
        %   sampleUniformlyFun (function_handle): Handle implementing the `sampleUniformly` method
        %
        % Returns:
        %   replab.CompactGroup: The constructed compact group
            
            group = replab.lambda.CompactGroup(header, eqvFun, sampleFun, ...
                                               composeFun, identity, inverseFun, ...
                                               sampleUniformlyFun);
        end
        
    end
    
end
