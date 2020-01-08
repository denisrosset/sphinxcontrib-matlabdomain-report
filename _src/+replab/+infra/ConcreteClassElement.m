classdef ConcreteClassElement < replab.infra.SourceElement & replab.infra.ClassElement
% An element of a class that has a declaration in its class
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.ConcreteClassElement.ClassElement` -- 
%    - `~+replab.+infra.ConcreteClassElement.ConcreteClassElement` -- 
%    - `~+replab.+infra.ConcreteClassElement.Element` -- 
%    - `~+replab.+infra.ConcreteClassElement.SourceElement` -- 
%    - `~+replab.+infra.ConcreteClassElement.absoluteFilename` -- Returns the full path to the file containing the source code of this object
%    - `~+replab.+infra.ConcreteClassElement.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.ConcreteClassElement.attributes` -- struct: Attributes from the ``methods``/``properties`` block
%    - `~+replab.+infra.ConcreteClassElement.children` -- Returns a cell vector of the children of this element
%    - `~+replab.+infra.ConcreteClassElement.childrenNames` -- Returns a cell vector of the children names of this element
%    - `~+replab.+infra.ConcreteClassElement.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.ConcreteClassElement.declaration` -- charstring: Declaration line for method, if available / ``[]`` for property
%    - `~+replab.+infra.ConcreteClassElement.declarations` -- 
%    - `~+replab.+infra.ConcreteClassElement.disp` -- 
%    - `~+replab.+infra.ConcreteClassElement.doc` -- `.Doc`: Documentation comment
%    - `~+replab.+infra.ConcreteClassElement.elementPath` -- Returns the path of the element relative to its package
%    - `~+replab.+infra.ConcreteClassElement.eq` -- Equality test
%    - `~+replab.+infra.ConcreteClassElement.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.ConcreteClassElement.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.ConcreteClassElement.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.ConcreteClassElement.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.ConcreteClassElement.isAccessible` -- 
%    - `~+replab.+infra.ConcreteClassElement.kind` -- {'method', 'property'}: Kind of the class member
%    - `~+replab.+infra.ConcreteClassElement.linkOpen` -- 
%    - `~+replab.+infra.ConcreteClassElement.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.ConcreteClassElement.lookup` -- Returns a package element if present
%    - `~+replab.+infra.ConcreteClassElement.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.ConcreteClassElement.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.ConcreteClassElement.package` -- `replab.infra.Package`: Package this element is part of
%    - `~+replab.+infra.ConcreteClassElement.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.ConcreteClassElement.parentClass` -- `.Class`: Parent class
%    - `~+replab.+infra.ConcreteClassElement.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.ConcreteClassElement.relativeFilenameParts` -- Returns the relative path to the source code of this object
%    - `~+replab.+infra.ConcreteClassElement.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.ConcreteClassElement.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.ConcreteClassElement.sourceIdentifier` -- charstring: Name of the ``.m`` file without extension
%    - `~+replab.+infra.ConcreteClassElement.splitPath` -- Returns the package path and the element relative path
%    - `~+replab.+infra.ConcreteClassElement.startLineNumber` -- integer: Line number at which this object starts in the source file
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
%    .. method:: SourceElement
%
%       No documentation
%
%    .. method:: absoluteFilename
%
%       Documentation in :meth:`+replab.+infra.SourceElement.absoluteFilename`
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
%    .. attribute:: doc
%
%       Documentation in :attr:`+replab.+infra.SourceElement.doc`
%
%    .. method:: elementPath
%
%       Documentation in :meth:`+replab.+infra.SourceElement.elementPath`
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
%    .. method:: linkOpen
%
%       No documentation
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
%    .. attribute:: package
%
%       Documentation in :attr:`+replab.+infra.SourceElement.package`
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
%    .. method:: relativeFilenameParts
%
%       Documentation in :meth:`+replab.+infra.SourceElement.relativeFilenameParts`
%
%    .. method:: shmIdentifier
%
%       Documentation in :meth:`+replab.+infra.Element.shmIdentifier`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. attribute:: sourceIdentifier
%
%       Documentation in :attr:`+replab.+infra.SourceElement.sourceIdentifier`
%
%    .. attribute:: startLineNumber
%
%       Documentation in :attr:`+replab.+infra.SourceElement.startLineNumber`
%
% .. raw:: html
%
%    <h3>Own members</h3>


    methods

        function self = ConcreteClassElement(codeBase, package, parentClass, name, startLineNumber, kind, declaration, ...
                                             attributes, docLines, docLineNumbers)
            sourceIdentifier = parentClass.name;
            self = self@replab.infra.SourceElement(codeBase, package, sourceIdentifier, startLineNumber, ...
                                                   name, docLines, docLineNumbers);
            self = self@replab.infra.ClassElement(codeBase, parentClass, name, kind, declaration, attributes);
        end

        function [packagePath elementPath] = splitPath(self)
            packagePath = self.parentClass.package.packagePath;
            elementPath = {self.parentClass.name self.name};
        end

    end

end
