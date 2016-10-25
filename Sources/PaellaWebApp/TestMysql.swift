//
//  testMySQL.swift
//  JuanaLaLoca
//
//  Created by Ubaldo Cotta on 17/10/16.
//
//

import PerfectLib
import MySQL
import PerfectHTTP
import PerfectThread
import Foundation
import MySQLConnectionPool
import SessionMySQL

public func useMysql(_ request: HTTPRequest, response: HTTPResponse) {


	//let row = try helper.queryRow("SELECT * FROM session WHERE cookie = ?", args: "d34daA4cdbc44de8774a7")
	//print(row[0])




	do {
		let conn = try ConnectionPool.sharedInstance.getConnection()
		defer {
			conn.returnToPool()
		}
		var resultArray = [[Optional<Any>]]()

		try conn.queryAll("SELECT * FROM session WHERE cookie = ?", args: "pepe") {
			row in
			resultArray.append(row)

		}


		//if let data = try helper.queryAll("SELECT * FROM session WHERE key = ?", "test") {
		//	for item in data {
		//		print(item[0])
		//	}
		//	print(data)
		//}

		//while let row = results?.next() {
		//    resultArray.append(row)
		//
		//}
		response.appendBody(string: "<html><title>Mysql Test</title><body>\(resultArray.debugDescription)</body></html>")
		response.completed()

	} catch {
		response.appendBody(string: "<html><title>Mysql Test</title><body>Error</body></html>")
		response.completed()
	}

	//setup an array to store results


	//return array to http response


}
