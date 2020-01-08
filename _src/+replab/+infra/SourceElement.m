classdef SourceElement < replab.infra.Element
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.SourceElement.Element` -- 
%    - `~+replab.+infra.SourceElement.SourceElement` -- 
%    - `~+replab.+infra.SourceElement.absoluteFilename` -- Returns the full path to the file containing the source code of this object
%    - `~+replab.+infra.SourceElement.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.SourceElement.children` -- Returns a cell vector of the children of this element
%    - `~+replab.+infra.SourceElement.childrenNames` -- Returns a cell vector of the children names of this element
%    - `~+replab.+infra.SourceElement.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.SourceElement.disp` -- 
%    - `~+replab.+infra.SourceElement.doc` -- `.Doc`: Documentation comment
%    - `~+replab.+infra.SourceElement.elementPath` -- Returns the path of the element relative to its package
%    - `~+replab.+infra.SourceElement.eq` -- Equality test
%    - `~+replab.+infra.SourceElement.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.SourceElement.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.SourceElement.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.SourceElement.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.SourceElement.linkOpen` -- 
%    - `~+replab.+infra.SourceElement.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.SourceElement.lookup` -- Returns a package element if present
%    - `~+replab.+infra.SourceElement.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.SourceElement.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.SourceElement.package` -- `replab.infra.Package`: Package this element is part of
%    - `~+replab.+infra.SourceElement.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.SourceElement.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.SourceElement.relativeFilenameParts` -- Returns the relative path to the source code of this object
%    - `~+replab.+infra.SourceElement.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.SourceElement.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.SourceElement.sourceIdentifier` -- charstring: Name of the ``.m`` file without extension
%    - `~+replab.+infra.SourceElement.splitPath` -- Returns the package path and the element relative path
%    - `~+replab.+infra.SourceElement.startLineNumber` -- integer: Line number at which this object starts in the source file
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
%    .. method:: childrenNames
%
%       Documentation in :meth:`+replab.+infra.Element.childrenNames`
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
        package % `replab.infra.Package`: Package this element is part of
        sourceIdentifier % charstring: Name of the ``.m`` file without extension
        startLineNumber % integer: Line number at which this object starts in the source file
        doc % `.Doc`: Documentation comment
    end

    methods % Abstract

        function p = elementPath(self)
        % Returns the path of the element relative to its package
            error('Abstract');
        end

    end

    methods

        function self = SourceElement(codeBase, package, sourceIdentifier, startLineNumber, name, docLines, docLineNumbers)
            self = self@replab.infra.Element(codeBase, name);
            self.package = package;
            self.sourceIdentifier = sourceIdentifier;
            self.startLineNumber = startLineNumber;
            self.doc = replab.infra.Doc(self, docLines, docLineNumbers);
        end

        % replab.infra.Element

        function [packagePath elementPath] = splitPath(self)
            packagePath = self.package.packagePath;
            elementPath = self.elementPath;
        end

        % Own methods

        function fn = absoluteFilename(self)
        % Returns the full path to the file containing the source code of this object
            parts = self.relativeFilenameParts;
            fn = fullfile(self.codeBase.rootFolder, parts{:});
        end

        function str = linkOpen(self)
            str = replab.infra.linkOpen('%s:%d', '%s:%d', self.absoluteFilename, self.startLineNumber);
        end

        function parts = relativeFilenameParts(self)
        % Returns the relative path to the source code of this object
        %
        % For example, this could return ``{'+replab' 'Group.m'}``
            parts = horzcat(cellfun(@(x) ['+' x], self.package.packagePath, 'uniform', 0), {[self.sourceIdentifier '.m']});
        end

    end

end
