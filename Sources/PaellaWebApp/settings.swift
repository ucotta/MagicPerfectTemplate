//
//  settings.swift
//  TestingPerfectTemplate
//
//  Created by Ubaldo Cotta on 25/10/16.
//
//

public class Settings {
	public static let mysql = (
		host: "127.0.0.1",
		port: 3306,
		user: "root",
		pass: "",
		scheme: "pruebas"
	)

	public static let pool = (
		initialSize: 2,
		maxActive: 3,
		maxIdle: 2,
		getTimeout: 50
	)

	public static let session = (
		cookieID: "PerfectSessionCookie",
		tableName: mysql.scheme + ".session"
	)
	
	public static let server = (
		port: 8080,
		webroot: "/Users/ukamata/Fuentes/PaellaPerfectTemplate/webroot"
	)
}


