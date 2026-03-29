//
//  ShelfPlayerMigrationPlan.swift
//  ShelfPlayerKit
//
//  Created by Rasmus Krämer on 29.03.25.
//

import Foundation
import SwiftData

enum ShelfPlayerMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [SchemaV2.self, SchemaV3.self]
    }

    static var stages: [MigrationStage] {
        [migrateV2toV3]
    }

    static let migrateV2toV3 = MigrationStage.lightweight(
        fromVersion: SchemaV2.self,
        toVersion: SchemaV3.self
    )
}
