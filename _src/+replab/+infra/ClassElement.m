classdef ClassElement < replab.infra.Element
% Describes a class element, which can be either a property or a method, concrete or inherited
%
% Although it is not immediately evident, the class `.ClassElement` is abstract.
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.ClassElement.ClassElement` -- 
%    - `~+replab.+infra.ClassElement.Element` -- 
%    - `~+replab.+infra.ClassElement.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.ClassElement.attributes` -- struct: Attributes from the ``methods``/``properties`` block
%    - `~+replab.+infra.ClassElement.children` -- Returns a cell vector of the children of this element
%    - `~+replab.+infra.ClassElement.childrenNames` -- Returns a cell vector of the children names of this element
%    - `~+replab.+infra.ClassElement.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.ClassElement.declaration` -- charstring: Declaration line for method, if available / ``[]`` for property
%    - `~+replab.+infra.ClassElement.declarations` -- 
%    - `~+replab.+infra.ClassElement.disp` -- 
%    - `~+replab.+infra.ClassElement.eq` -- Equality test
%    - `~+replab.+infra.ClassElement.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.ClassElement.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.ClassElement.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.ClassElement.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.ClassElement.isAccessible` -- 
%    - `~+replab.+infra.ClassElement.kind` -- {'method', 'property'}: Kind of the class member
%    - `~+replab.+infra.ClassElement.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.ClassElement.lookup` -- Returns a package element if present
%    - `~+replab.+infra.ClassElement.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.ClassElement.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.ClassElement.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.ClassElement.parentClass` -- `.Class`: Parent class
%    - `~+replab.+infra.ClassElement.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.ClassElement.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.ClassElement.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.ClassElement.splitPath` -- Returns the package path and the element relative path
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: Element
%
%       No documentation
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: children
%
%       Documentation in :meth:`+replab.+infra.Element.children`
%
%    .. attribute:: codeBase
%
%       Documentation in :attr:`+replab.+infra.Element.codeBase`
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
% .. raw:: html
%
%    <h3>Own members</h3>


    properties
        parentClass % `.Class`: Parent class
        kind % {'method', 'property'}: Kind of the class member
        declaration % charstring: Declaration line for method, if available / ``[]`` for property
        attributes % struct: Attributes from the ``methods``/``properties`` block
    end

    methods

        function self = ClassElement(codeBase, parentClass, name, kind, declaration, attributes)
            self = self@replab.infra.Element(codeBase, name);
            self.parentClass = parentClass;
            self.kind = kind;
            self.declaration = declaration;
            self.attributes = attributes;
        end

        function [packagePath elementPath] = splitPath(self)
            packagePath = self.parentClass.package.packagePath;
            elementPath = {self.parentClass.name self.name};
        end

        function c = childrenNames(self)
            c = {};
        end

        function d = declarations(self)
            d = replab.infra.Declarations(self.codeBase, self);
        end

        function b = isAccessible(self)
            b = ~isfield(self.attributes, 'Access') || isequal(self.attributes.Access, 'public');
        end

    end

end
