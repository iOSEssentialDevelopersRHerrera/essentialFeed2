//
//  CoreDataFeedStore.swift
//  EssentialFeed2
//
//  Created by Ricardo Herrera Petit on 1/12/21.
//

import CoreData

public final class CoreDataFeedStore {
    
    private let container:NSPersistentContainer
    private let context:NSManagedObjectContext
    
    public init(storeURL:URL, bundle: Bundle = .main) throws {
        container = try NSPersistentContainer.load(modelName: "FeedStore", url: storeURL, in: bundle)
        context = container.newBackgroundContext()
    }
    
    func perform(_ action: @escaping (NSManagedObjectContext) -> Void) {
        let context = self.context
        context.perform {action(context)}
    }
}


