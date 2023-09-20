import Combine
import FirebaseAuth
import Firebase

public class Workonisator: ObservableObject {
    
    let service = UserService()
    
    @Published var userSession: FirebaseAuth.User?
    @Published public var didAuthenticatedUser = false
    /// Der zurzeit eingeloggte User mit all seinen Infos
    @Published public var user: User?
    
    public init(){
        self.userSession = Auth.auth().currentUser
        fetchUser()
        self.didAuthenticatedUser = self.user == nil ? false : true
    }
    
    
}


public final class Initialisierung{
    public static func setup(){
        FirebaseApp.configure()
    }
}
