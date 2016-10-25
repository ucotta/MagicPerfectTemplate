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

	return uris;
}







