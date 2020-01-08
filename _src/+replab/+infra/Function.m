classdef Function < replab.infra.SourceElement
% Describes a MATLAB function
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.Function.Element` -- 
%    - `~+replab.+infra.Function.Function` -- 
%    - `~+replab.+infra.Function.SourceElement` -- 
%    - `~+replab.+infra.Function.absoluteFilename` -- Returns the full path to the file containing the source code of this object
%    - `~+replab.+infra.Function.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.Function.children` -- Returns a cell vector of the children of this element
%    - `~+replab.+infra.Function.childrenNames` -- Returns a cell vector of the children names of this element
%    - `~+replab.+infra.Function.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.Function.declaration` -- charstring: Function declaration line
%    - `~+replab.+infra.Function.disp` -- 
%    - `~+replab.+infra.Function.doc` -- `.Doc`: Documentation comment
%    - `~+replab.+infra.Function.elementPath` -- Returns the path of the element relative to its package
%    - `~+replab.+infra.Function.eq` -- Equality test
%    - `~+replab.+infra.Function.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.Function.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.Function.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.Function.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.Function.linkOpen` -- 
%    - `~+replab.+infra.Function.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.Function.lookup` -- Returns a package element if present
%    - `~+replab.+infra.Function.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.Function.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.Function.package` -- `replab.infra.Package`: Package this element is part of
%    - `~+replab.+infra.Function.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.Function.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.Function.relativeFilenameParts` -- Returns the relative path to the source code of this object
%    - `~+replab.+infra.Function.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.Function.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.Function.sourceIdentifier` -- charstring: Name of the ``.m`` file without extension
%    - `~+replab.+infra.Function.splitPath` -- Returns the package path and the element relative path
%    - `~+replab.+infra.Function.startLineNumber` -- integer: Line number at which this object starts in the source file
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
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
%    .. attribute:: doc
%
%       Documentation in :attr:`+replab.+infra.SourceElement.doc`
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
%    .. attribute:: package
%
%       Documentation in :attr:`+replab.+infra.SourceElement.package`
%
%    .. method:: parent
%
%       Documentation in :meth:`+replab.+infra.Element.parent`
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
%    .. method:: splitPath
%
%       Documentation in :meth:`+replab.+infra.Element.splitPath`
%
%    .. attribute:: startLineNumber
%
%       Documentation in :attr:`+replab.+infra.SourceElement.startLineNumber`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        declaration % charstring: Function declaration line
    end
    
    methods
        
        function self = Function(codeBase, package, functionData)
            self = self@replab.infra.SourceElement(codeBase, package, functionData.name, functionData.declarationLineNumber, ...
                                                   functionData.name, functionData.docLines, functionData.docLineNumbers);
            self.declaration = functionData.declaration;
        end
        
        function str = name(self)
            str = self.sourceIdentifier;
        end
        
        function p = elementPath(self)
            p = {self.name};
        end
               
        function c = childrenNames(self)
            c = {};
        end

    end
    
end
