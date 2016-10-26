//
//  redirecciones.swift
//  JuanaLaLoca
//
//  Created by Ubaldo Cotta on 17/10/16.
//
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

public func getUris() -> Routes {
	var uris = Routes()
	uris.add(method: .get, uri: "/mysql", handler: useMysql)
	uris.add(method: .get, uri: "/", handler: Indice)
	uris.add(method: .get, uri: "/addCookie", handler: PonCookie)

	/* Static contents, must be server by apache o ngnix directly, this is only for an example */
	uris.add(method: .get, uri: "/css/*", handler: statics)
	uris.add(method: .get, uri: "/img/*", handler: statics)
	uris.add(method: .get, uri: "/fonts/*", handler: statics)
	uris.add(method: .get, uri: "/js/*", handler: statics)

	return uris;
}

func statics(request: HTTPRequest, response: HTTPResponse) {
	StaticFileHandler(documentRoot: request.documentRoot).handleRequest(request: request, response: response)
}






