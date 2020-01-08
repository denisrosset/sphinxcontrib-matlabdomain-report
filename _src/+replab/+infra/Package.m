classdef Package < replab.infra.Element
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.Package.Element` -- 
%    - `~+replab.+infra.Package.Package` -- Constructs a package instance
%    - `~+replab.+infra.Package.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.Package.children` -- Returns all the direct children of this package
%    - `~+replab.+infra.Package.childrenNames` -- Returns the names of all direct children of this package
%    - `~+replab.+infra.Package.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.Package.disp` -- 
%    - `~+replab.+infra.Package.eq` -- Equality test
%    - `~+replab.+infra.Package.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.Package.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.Package.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.Package.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.Package.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.Package.lookup` -- Returns a package element if present
%    - `~+replab.+infra.Package.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.Package.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.Package.nspElements` -- struct-based hash map: Package elements that are not subpackages
%    - `~+replab.+infra.Package.ownClasses` -- 
%    - `~+replab.+infra.Package.ownFunctions` -- 
%    - `~+replab.+infra.Package.ownSubpackages` -- Returns all direct subpackages of this package
%    - `~+replab.+infra.Package.packagePath` -- row cell vector of charstring: Package path
%    - `~+replab.+infra.Package.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.Package.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.Package.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.Package.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.Package.splitPath` -- Returns the package path and the element relative path
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
        packagePath % row cell vector of charstring: Package path
        nspElements % struct-based hash map: Package elements that are not subpackages
        ownFunctions
        ownClasses
    end

    methods

        function self = Package(codeBase, packageData)
        % Constructs a package instance
        %
        % Args:
        %   codeBase (`.CodeBase`): Code base this object is part of
        %   packageData (`.PackageData`): Data corresponding to this package
            if isempty(packageData.path)
                name = [];
            else
                name = packageData.path{end};
            end
            self = self@replab.infra.Element(codeBase, name);
            self.packagePath = packageData.path;
            nspElements = struct;
            ownFunctions = {};
            ownClasses = {};
            for i = 1:length(packageData.ownFunctions)
                fd = packageData.ownFunctions{i};
                fun = replab.infra.Function(codeBase, self, fd);
                ownFunctions{1,end+1} = fun;
                nspElements.(fd.name) = fun;
            end
            for i = 1:length(packageData.ownClasses)
                cd = packageData.ownClasses{i};
                cls = replab.infra.Class(codeBase, self, cd);
                ownClasses{1,end+1} = cls;
                nspElements.(cls.name) = cls;
            end
            self.nspElements = nspElements;
            self.ownFunctions = ownFunctions;
            self.ownClasses = ownClasses;
        end

        function [packagePath elementPath] = splitPath(self)
            packagePath = self.packagePath;
            elementPath = cell(1, 0);
        end

        function e = lookup(self, id)
            if isfield(self.nspElements, id)
                pkgel = self.nspElements.(id);
            else
                pkgel = [];
            end
            p = horzcat(self.path, {id});
            subpkg = self.codeBase.package(p{:});
            if ~isempty(pkgel) && ~isempty(subpkg)
                error('Package %s has both an element and a subpackage named %s', self.fullIdentifier, id);
            end
            e = [];
            if ~isempty(pkgel)
                e = pkgel;
            end
            if ~isempty(subpkg)
                e = subpkg;
            end
        end

        function c = childrenNames(self)
        % Returns the names of all direct children of this package
        %
        % This includes its subpackages, the classes and functions it contains.
            spn = cellfun(@(x) x.name, self.codeBase.subpackages(self), 'uniform', 0);
            fn = fieldnames(self.nspElements);
            fn = fn(:).';
            c = horzcat(spn, fn);
        end

        function c = children(self)
        % Returns all the direct children of this package
        %
        % Children includes its subpackages, the classes and functions it contains.
            c = horzcat(self.ownSubpackages, self.ownFunctions, self.ownClasses);
        end

        function c = ownSubpackages(self)
        % Returns all direct subpackages of this package
            c = self.codeBase.subpackages(self);
        end

    end

end
