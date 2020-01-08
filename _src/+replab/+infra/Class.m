classdef Class < replab.infra.SourceElement
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.Class.Class` -- 
%    - `~+replab.+infra.Class.Element` -- 
%    - `~+replab.+infra.Class.SourceElement` -- 
%    - `~+replab.+infra.Class.absoluteFilename` -- Returns the full path to the file containing the source code of this object
%    - `~+replab.+infra.Class.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.Class.allElements` -- 
%    - `~+replab.+infra.Class.allElementsStruct` -- Returns a struct whose fields contain all elements
%    - `~+replab.+infra.Class.allMethods` -- Returns a row cell vector containing all methods, inc. inherited, sorted by name
%    - `~+replab.+infra.Class.allProperties` -- Returns a row cell vector containing all properties, inc. inherited, sorted by name
%    - `~+replab.+infra.Class.allSubclasses` -- Returns all subclasses of this class, not including itself
%    - `~+replab.+infra.Class.allSuperclasses` -- Returns all superclasses of this class, not including itself
%    - `~+replab.+infra.Class.children` -- Returns a cell vector of the children of this element
%    - `~+replab.+infra.Class.childrenNames` -- Returns a cell vector of the children names of this element
%    - `~+replab.+infra.Class.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.Class.disp` -- 
%    - `~+replab.+infra.Class.doc` -- `.Doc`: Documentation comment
%    - `~+replab.+infra.Class.elementPath` -- Returns the path of the element relative to its package
%    - `~+replab.+infra.Class.eq` -- Equality test
%    - `~+replab.+infra.Class.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.Class.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.Class.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.Class.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.Class.inheritedElements` -- 
%    - `~+replab.+infra.Class.inheritedElementsStruct` -- 
%    - `~+replab.+infra.Class.inheritedElementsStruct_` -- 
%    - `~+replab.+infra.Class.inheritedMethods` -- 
%    - `~+replab.+infra.Class.inheritedProperties` -- 
%    - `~+replab.+infra.Class.linkOpen` -- 
%    - `~+replab.+infra.Class.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.Class.lookup` -- Returns a package element if present
%    - `~+replab.+infra.Class.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.Class.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.Class.ownElements` -- 
%    - `~+replab.+infra.Class.ownElementsStruct` -- struct
%    - `~+replab.+infra.Class.ownMethods` -- 
%    - `~+replab.+infra.Class.ownProperties` -- 
%    - `~+replab.+infra.Class.ownSubclasses` -- 
%    - `~+replab.+infra.Class.ownSuperclasses` -- 
%    - `~+replab.+infra.Class.package` -- `replab.infra.Package`: Package this element is part of
%    - `~+replab.+infra.Class.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.Class.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.Class.relativeFilenameParts` -- Returns the relative path to the source code of this object
%    - `~+replab.+infra.Class.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.Class.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.Class.sourceIdentifier` -- charstring: Name of the ``.m`` file without extension
%    - `~+replab.+infra.Class.splitPath` -- Returns the package path and the element relative path
%    - `~+replab.+infra.Class.startLineNumber` -- integer: Line number at which this object starts in the source file
%    - `~+replab.+infra.Class.superclassIdentifiers` -- 
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
        superclassIdentifiers
        ownElementsStruct % struct
    end

    properties (Access = protected)
        inheritedElementsStruct_
    end

    methods

        function self = Class(codeBase, package, classData)
            startLineNumber = 1;
            self = self@replab.infra.SourceElement(codeBase, package, classData.name, startLineNumber, classData.name, ...
                                                   classData.docLines, classData.docLineNumbers);
            sci = {};
            for i = 1:length(classData.superclassIdentifiers)
                id = classData.superclassIdentifiers{i};
                if ~isequal(id, 'handle')
                    sci{1,end+1} = id;
                end
            end
            self.superclassIdentifiers = sci;
            oe = struct;
            for i = 1:length(classData.ownMethods)
                md = classData.ownMethods{i};
                kind = 'method';
                m = replab.infra.ConcreteClassElement(codeBase, package, self, md.name, md.declarationLineNumber, ...
                                                      kind, md.declaration, md.attributes, ...
                                                      md.docLines, md.docLineNumbers);
                oe.(m.name) = m;
            end
            for i = 1:length(classData.ownProperties)
                pd = classData.ownProperties{i};
                kind = 'property';
                p = replab.infra.ConcreteClassElement(codeBase, package, self, pd.name, pd.declarationLineNumber, ...
                                                      kind, [], pd.attributes, ...
                                                      pd.docLines, pd.docLineNumbers);
                oe.(p.name) = p;
            end
            self.ownElementsStruct = oe;
        end

        % replab.infra.Element

        function c = childrenNames(self)
            c = vertcat(fieldnames(self.ownElementsStruct), fieldnames(self.inheritedElementsStruct));
            c = c(:).';
        end

        function e = lookup(self, id)
            if isfield(self.ownElementsStruct, id)
                e = self.ownElementsStruct.(id);
                return
            end
            ie = self.inheritedElementsStruct;
            if isfield(ie, id)
                e = ie.(id);
                return
            end
            e = [];
        end

        % replab.infra.SourceElement

        function str = name(self)
            str = self.sourceIdentifier;
        end

        function p = elementPath(self)
            p = {self.name};
        end

        % Own methods

        function ae = allElements(self)
            ae = struct2cell(orderfields(self.allElementsStruct));
            ae = ae(:).';
        end

        function ae = allElementsStruct(self)
        % Returns a struct whose fields contain all elements
            ae = replab.infra.shm.merge2(self.ownElementsStruct, self.inheritedElementsStruct);
        end

        function am = allMethods(self)
        % Returns a row cell vector containing all methods, inc. inherited, sorted by name
            am = horzcat(self.ownMethods, self.inheritedMethods);
            names = cellfun(@(el) el.name, am, 'uniform', 0);
            [~, ind] = sort(names);
            am = am(ind);
        end

        function ap = allProperties(self)
        % Returns a row cell vector containing all properties, inc. inherited, sorted by name
            ap = horzcat(self.ownProperties, self.inheritedProperties);
            names = cellfun(@(el) el.name, ap, 'uniform', 0);
            [~, ind] = sort(names);
            ap = ap(ind);
        end

        function oe = ownElements(self)
            oe = struct2cell(orderfields(self.ownElementsStruct));
            oe = oe(:).';
        end

        function om = ownMethods(self)
            oe = self.ownElements;
            om = oe(cellfun(@(x) isequal(x.kind, 'method'), oe));
        end

        function op = ownProperties(self)
            oe = self.ownElements;
            op = oe(cellfun(@(x) isequal(x.kind, 'property'), oe));
        end

        function im = inheritedMethods(self)
            ie = self.inheritedElements;
            im = ie(cellfun(@(x) isequal(x.kind, 'method'), ie));
        end

        function ip = inheritedProperties(self)
            ie = self.inheritedElements;
            ip = ie(cellfun(@(x) isequal(x.kind, 'property'), ie));
        end

        function ie = inheritedElements(self)
            ie = struct2cell(orderfields(self.inheritedElementsStruct));
            ie = ie(:).';
        end

        function ie = inheritedElementsStruct(self)
            if isempty(self.inheritedElementsStruct_)
                ie = struct;
                already = struct;
                names = fieldnames(self.ownElementsStruct);
                for i = 1:length(names)
                    name = names{i};
                    already.(name) = true;
                end
                asc = self.allSuperclasses;
                for i = 1:length(asc)
                    sup = asc{i};
                    names = fieldnames(sup.ownElementsStruct);
                    mask = cellfun(@(n) ~isfield(already, n), names);
                    names = names(mask);
                    for j = 1:length(names)
                        name = names{j};
                        already.(name) = true;
                        se = sup.ownElementsStruct.(name);
                        iel = replab.infra.InheritedClassElement(self.codeBase, self, name, se.kind, se.attributes);
                        ie.(name) = iel;
                    end
                end
                self.inheritedElementsStruct_ = ie;
            end
            ie = self.inheritedElementsStruct_;
        end

        function asc = allSuperclasses(self)
        % Returns all superclasses of this class, not including itself
            asc = {};
            visitedClassIds = struct;
            queue = self.ownSuperclasses;
            while ~isempty(queue)
                c = queue{1};
                queue = queue(2:end);
                id = c.shmIdentifier;
                if ~isfield(visitedClassIds, id)
                    visitedClassIds.(id) = true;
                    asc{1,end+1} = c;
                    queue = horzcat(queue, c.ownSuperclasses);
                end
            end
        end

        function asc = allSubclasses(self)
        % Returns all subclasses of this class, not including itself
            asc = {};
            visitedClassIds = struct;
            queue = self.ownSubclasses;
            while ~isempty(queue)
                c = queue{1};
                queue = queue(2:end);
                id = c.shmIdentifier;
                if ~isfield(visitedClassIds, id)
                    visitedClassIds.(id) = true;
                    asc{1,end+1} = c;
                    queue = horzcat(queue, c.ownSubclasses);
                end
            end
        end

        function c = ownSubclasses(self)
            c = self.codeBase.subclasses(self);
        end

        function c = ownSuperclasses(self)
            c = cellfun(@(id) self.codeBase.getIdentifier(id), self.superclassIdentifiers, 'uniform', 0);
        end

    end

end
