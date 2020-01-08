classdef InheritedClassElement < replab.infra.ClassElement
% Describes an inherited class element, present by the virtue of a superclass
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.InheritedClassElement.ClassElement` -- 
%    - `~+replab.+infra.InheritedClassElement.Element` -- 
%    - `~+replab.+infra.InheritedClassElement.InheritedClassElement` -- 
%    - `~+replab.+infra.InheritedClassElement.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.InheritedClassElement.attributes` -- struct: Attributes from the ``methods``/``properties`` block
%    - `~+replab.+infra.InheritedClassElement.children` -- Returns a cell vector of the children of this element
%    - `~+replab.+infra.InheritedClassElement.childrenNames` -- Returns a cell vector of the children names of this element
%    - `~+replab.+infra.InheritedClassElement.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.InheritedClassElement.declaration` -- charstring: Declaration line for method, if available / ``[]`` for property
%    - `~+replab.+infra.InheritedClassElement.declarations` -- 
%    - `~+replab.+infra.InheritedClassElement.disp` -- 
%    - `~+replab.+infra.InheritedClassElement.eq` -- Equality test
%    - `~+replab.+infra.InheritedClassElement.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.InheritedClassElement.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.InheritedClassElement.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.InheritedClassElement.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.InheritedClassElement.isAccessible` -- 
%    - `~+replab.+infra.InheritedClassElement.kind` -- {'method', 'property'}: Kind of the class member
%    - `~+replab.+infra.InheritedClassElement.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.InheritedClassElement.lookup` -- Returns a package element if present
%    - `~+replab.+infra.InheritedClassElement.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.InheritedClassElement.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.InheritedClassElement.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.InheritedClassElement.parentClass` -- `.Class`: Parent class
%    - `~+replab.+infra.InheritedClassElement.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.InheritedClassElement.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.InheritedClassElement.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.InheritedClassElement.splitPath` -- Returns the package path and the element relative path
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: ClassElement
%
%       No documentation
%
%    .. method:: Element
%
%       No documentation
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. attribute:: attributes
%
%       Documentation in :attr:`+replab.+infra.ClassElement.attributes`
%
%    .. method:: children
%
%       Documentation in :meth:`+replab.+infra.Element.children`
%
%    .. method:: childrenNames
%
%       Documentation in :meth:`+replab.+infra.Element.childrenNames`
%
%    .. attribute:: codeBase
%
%       Documentation in :attr:`+replab.+infra.Element.codeBase`
%
%    .. attribute:: declaration
%
%       Documentation in :attr:`+replab.+infra.ClassElement.declaration`
%
%    .. method:: declarations
%
%       No documentation
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: fullIdentifier
%
%       Documentation in :meth:`+replab.+infra.Element.fullIdentifier`
%
%    .. method:: get
%
%       Documentation in :meth:`+replab.+infra.Element.get`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: isAccessible
%
%       No documentation
%
%    .. attribute:: kind
%
%       Documentation in :attr:`+replab.+infra.ClassElement.kind`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: lookup
%
%       Documentation in :meth:`+replab.+infra.Element.lookup`
%
%    .. method:: matlabDomainIdentifier
%
%       Documentation in :meth:`+replab.+infra.Element.matlabDomainIdentifier`
%
%    .. attribute:: name
%
%       Documentation in :attr:`+replab.+infra.Element.name`
%
%    .. method:: parent
%
%       Documentation in :meth:`+replab.+infra.Element.parent`
%
%    .. attribute:: parentClass
%
%       Documentation in :attr:`+replab.+infra.ClassElement.parentClass`
%
%    .. method:: path
%
%       Documentation in :meth:`+replab.+infra.Element.path`
%
%    .. method:: shmIdentifier
%
%       Documentation in :meth:`+replab.+infra.Element.shmIdentifier`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. method:: splitPath
%
%       Documentation in :meth:`+replab.+infra.Element.splitPath`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    methods

        function self = InheritedClassElement(codeBase, parentClass, name, kind, attributes)
            declaration = ''; % No declaration as it is inherited
            self = self@replab.infra.ClassElement(codeBase, parentClass, name, kind, declaration, attributes);
        end

    end

end
