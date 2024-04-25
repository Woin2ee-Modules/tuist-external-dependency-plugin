public struct ExternalDependencyName: RawRepresentable {
    
    /// Raw name of the external dependency.
    public var rawValue: String
    
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
