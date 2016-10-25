
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import MySQLConnectionPool
import SessionMySQL

let sessionManager:MySQLSession


do {

	// Configure MySQL Connetion Pool
	var cpool:ConnectionPool = ConnectionPool.sharedInstance
	cpool.configureConnection(host: Settings.mysql.host, port: Settings.mysql.port, user: Settings.mysql.user, pass: Settings.mysql.pass, scheme: Settings.mysql.scheme)
	cpool.configurePool(initialSize: Settings.pool.initialSize, maxActive: Settings.pool.maxActive, maxIdle: Settings.pool.maxIdle, getTimeout: Settings.pool.getTimeout)
	
	// Configure MySQL Session
	sessionManager = MySQLSession(cookieName: Settings.session.cookieID, tableName: Settings.session.tableName)
	//sessionManager.setCookieSecureAttributes(secure: false)
	sessionManager.secure = false
	//sessionManager.set
	//sessionManager.setCookieS
	
	// Configure HTTP Server

	let server = HTTPServer()
	server.addRoutes(getUris())
	server.serverPort = UInt16(Settings.server.port)
	configureServer(server)
	
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
