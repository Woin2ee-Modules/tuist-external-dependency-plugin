import ProjectDescription

extension TargetDependency {
    
    /// Dependency on an external dependency imported through `Package.swift`.
    /// - Parameters:
    ///   - name: Name of the external dependency.
    ///   - condition: condition under which to use this dependency, nil if this should always be used.
    public static func external(name: ExternalDependencyName, condition: PlatformCondition? = nil) -> TargetDependency {
        return .external(name: name.rawValue, condition: condition)
    }
}
