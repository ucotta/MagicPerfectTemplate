//
//  index.swift
//  JuanaLaLoca
//
//  Created by Ubaldo Cotta on 17/10/16.
//
//
import Foundation
import PerfectHTTPServer
import PerfectHTTP
import PerfectLib
import SessionMySQL

var p = 1

private func errorFile(_ response: HTTPResponse) {
	response.appendBody(string: "<html><title>Hello, world!</title><body>Error cargando... <a href='use'></a></body></html>")
	response.completed()
}




public func Indice(_ request: HTTPRequest, response: HTTPResponse) {
	response.setHeader(.contentType, value: "text/html")


	//var sesion:Session = sessionManager.start(request, response: response, expiration: .relativeSeconds(15*60))



	//sesion.save(response: response)

	let f = File(getResourcesPath() + "/indice.tmpl")
	defer {
		f.close()
	}

	print("peticion: \(p) IP: \(request.uri) \(request.urlVariables)")
	p += 1
	do {

		let sesion:Session = try sessionManager.start(request, response: response, expiration: .relativeSeconds(15*60))
		sesion.set("name", value: "perico")
		try sesion.save(response: response)
		//var a = Dictionary<String, Any>()
		//a["hola"] = "adios"
		//a.removeAll()
		//a = nil
		
		


		try f.open(.read)



		var contents = try f.readString()
		//var contents = "<html lang=\"es\"><body><h2>Opciones</h2><ul><li><a href=\"use\">Test mysql</a></li><li><a href=\"addCookie\">Pon cookie</a></li></ul><code>COOKIES</code><hr><code>id sesion: SESION</code><body></html>"
		contents = contents.replacingOccurrences(of: "COOKIES", with: request.cookies.map { "\($0.0): \($0.1)" }.joined(separator: "<br>"))

		//contents = contents.replacingOccurrences(of: "SESION", with: request.cookie(key:"perfect") ?? "no hay sesion")
		response.appendBody(string: contents)
		response.completed()

	} catch {
		print("algo fue mal...")
		errorFile(response)
	}
}








public func Indice2(_ request: HTTPRequest, response: HTTPResponse) {
	response.setHeader(.contentType, value: "text/html")
	print("peticion: \(p) IP: \(request.uri) \(request.urlVariables)")
	p += 1

	//response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
	//response.completed()

	var contents = "<html lang=\"es\"><body><h2>Opciones</h2><ul><li><a href=\"use\">Test mysql</a></li><li><a href=\"addCookie\">Pon cookie</a></li></ul><code>COOKIES"
	contents += "</code><hr><code>id sesion: SESION</code><body></html>"

	let data = request.cookies.map { "\($0.0): \($0.1)" }.joined(separator: "<br>")


	contents = contents.replacingOccurrences(of: "COOKIES", with: data)
	//contents = contents.replacingOccurrences(of: "SESION", with: request.cookie(key:"perfect") ?? "no hay sesion")
	//response.appendBody(string: contents + data + contents2)
	response.completed()



}

public func PonCookie(_ request: HTTPRequest, response: HTTPResponse) {
	response.setHeader(.contentType, value: "text/html")

	//setSessionCookie(response, cookieID: "asdads")
	//setJSSafeCookie(response, domain: "localhost")

	let f = File(getResourcesPath() + "/indice.tmpl")
	defer {
		f.close()
	}

	do {

		let sesion:Session = try sessionManager.start(request, response: response, expiration: .relativeSeconds(15*60))
		sesion.set("name", value: "perico")
		try sesion.save(response: response)
		
		try f.open(.read)



		var contents = try f.readString()
		contents = contents.replacingOccurrences(of: "COOKIES", with: request.cookies.map { "\($0.0): \($0.1)" }.joined(separator: "<br>"))
		response.appendBody(string: contents)
		response.completed()

	} catch {
		print("algo fue mal...")
		errorFile(response)
	}
}
