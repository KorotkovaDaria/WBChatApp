//
//  Server.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.08.2024.
//

import Foundation

struct DataTask {
    let id: Int
    let contentData: String
}

actor Client {
    let id: Int
    var results: [String] = []

    init(id: Int) {
        self.id = id
    }

    func process(data: DataTask) async throws -> String {
        if data.id % 3 == 0 {
            throw NSError(domain: "ERROR", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error data \(data.id) by client \(id)"])
        }

        try await Task.sleep(nanoseconds: 2_000_000_000)
        let result = "Processed \(data.contentData) by client \(id)"
        results.append(result)

        return result
    }

    func getResults() -> [String] {
        return results
    }
}

actor Server {
    var clients: [Client] = []
    private var results: [String] = []
    private var errors: [Error] = []

    func addClient(_ client: Client) {
        clients.append(client)
    }

    func distributeTasks(dataTasks: [DataTask]) async {
        let localClients = clients
        await withTaskGroup(of: (Int, Result<String, Error>).self) { group in
            for (index, dataTask) in dataTasks.enumerated() {
                let client = localClients[index % localClients.count]
                group.addTask {
                    do {
                        let result = try await client.process(data: dataTask)
                        return (index, .success(result))
                    } catch {
                        return (index, .failure(error))
                    }
                }
            }

            for await (index, result) in group {
                switch result {
                case .success(let output):
                    results.append("Client \(clients[index % clients.count].id) processed \(index): \(output)")
                case .failure(let error):
                    errors.append(error)
                }
            }
        }
    }

    func getResults() -> [String] {
        return results
    }

    func getErrors() -> [Error] {
        return errors
    }
}

func runSystem() async {
    let server = Server()
    
    let clients = [
    Client(id: 1),
    Client(id: 2),
    Client(id: 3)
    ]
    
    for client in clients {
        await server.addClient(client)
    }
    
    let tasks = [
            DataTask(id: 1, contentData: "Data1"),
            DataTask(id: 2, contentData: "Data2"),
            DataTask(id: 3, contentData: "Data3"),
            DataTask(id: 4, contentData: "Data4"),
            DataTask(id: 5, contentData: "Data5")
        ]
    
    await server.distributeTasks(dataTasks: tasks)
    
    let results = await server.getResults()
    let errors = await server.getErrors()
    
    print("Results:")
    results.forEach { print($0) }

    print("\nErrors:")
    errors.forEach { print($0) }
}
