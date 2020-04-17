//
//  AppDelegate.swift
//  taskQuest
//
//  Created by 福田 桃太 on 2020/04/13.
//
// 一部の処理にはStackoverflowのコードを改変して使用しています
// https://ja.stackoverflow.com/questions/23306/realm%E3%81%A7%E5%88%9D%E6%9C%9F%E3%83%87%E3%83%BC%E3%82%BF%E3%82%92%E4%BD%9C%E6%88%90%E3%82%92%E3%81%97%E3%81%9F%E3%81%84%E3%81%AE%E3%81%A7%E3%81%99%E3%81%8C-%E3%82%84%E3%82%8A%E6%96%B9%E3%81%8C%E3%82%8F%E3%81%8B%E3%82%8A%E3%81%BE%E3%81%9B%E3%82%93
// aurhers
// https://ja.stackoverflow.com/users/14872/atsupooon
// https://ja.stackoverflow.com/users/303/nashirox
//

import Foundation
import RealmSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let defaults = UserDefaults()

    func initialSetUp() {
        // 初回マイグレーション
        self.realmMigration()
        // シードデータ投入
        self.insertSeedData()
        // 初回起動済みのフラグを立てる
        self.defaults.set(false, forKey: "initialLaunch")
        self.defaults.synchronize()
    }

    func realmMigration() {
        let config = Realm.Configuration(
            // 新しいスキーマバージョンを設定します。以前のバージョンより大きくなければなりません。
            // （スキーマバージョンを設定したことがなければ、最初は0が設定されています）
            schemaVersion: Definition.realmSchemaVersion,

            // マイグレーション処理を記述します。古いスキーマバージョンのRealmを開こうとすると
            // 自動的にマイグレーションが実行されます。
            migrationBlock: { _, oldSchemaVersion in
                if oldSchemaVersion < Definition.realmSchemaVersion {
                    // 何もする必要はありません！
                    // Realmは自動的に新しく追加されたプロパティと、削除されたプロパティを認識します。
                    // そしてディスク上のスキーマを自動的にアップデートします。
                }
           })

        // デフォルトRealmに新しい設定を適用します
        Realm.Configuration.defaultConfiguration = config

        // Realmファイルを開こうとしたときスキーマバージョンが異なれば、
        // 自動的にマイグレーションが実行されます
        let realm = try! Realm()
    }

    func insertSeedData() {
        // realm
        let realm = try! Realm()

        // 書き込み処理
        try! realm.write {}
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 初回起動処理
        let dic = ["initialLaunch": true]
        defaults.register(defaults: dic)
        self.defaults.synchronize()

        if self.defaults.bool(forKey: "initialLaunch") == true {
            print("initial setup start")
            self.initialSetUp()
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
