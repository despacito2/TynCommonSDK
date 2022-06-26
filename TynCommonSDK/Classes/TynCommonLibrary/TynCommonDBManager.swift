//
//  TYN_DBManager.swift
//  worldCycling
//
//  Created by 田宴宁 on 2022/5/29.
//

import WCDBSwift
@_exported import WCDBSwift

struct WcdbDataPath {
   static let basePath =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/TYN_DB/wcdb.db"
}

enum DBTableName : String {
    case userTable = "TYN_User"
    case plazaTable = "TYN_Plaza"
    case exerciseTable = "TYN_Exercise"
    case exerciseRecordTable = "TYN_ExerciseRecord"
}

class TYN_DBmanager: NSObject {

    static let share = TYN_DBmanager.init()
    var db: Database?
    
    override init() {
        super.init()
        db = createDB()
        createUserTable()
        createPlazaTable()
        createExerciseTable()
        createExerciseRecordTable()
    }
    
    private func createDB() -> Database {
       return Database(withPath: WcdbDataPath.basePath)
    }
    
    /// 用户数据库
    private func createUserTable() {
        do {
           try db?.run(transaction: {
               createTable(table: DBTableName.userTable, modelType: TYN_MineModel.self)
            })
            
        } catch let error {
            print("初始化数据库及ORM对应关系建立失败\(error.localizedDescription)")
        }
    }
    
    
    /// 用户发布活动数据库
    private func createPlazaTable() {
        do {
           try db?.run(transaction: {
               createTable(table: DBTableName.plazaTable, modelType: TYN_PlazaModel.self)
            })
            
        } catch let error {
            print("初始化数据库及ORM对应关系建立失败\(error.localizedDescription)")
        }
    }
    
    /// 用户锻炼最新时间数据库
    private func createExerciseTable() {
        do {
           try db?.run(transaction: {
               createTable(table: DBTableName.exerciseTable, modelType: TYN_ExerciseModel.self)
            })
            
        } catch let error {
            print("初始化数据库及ORM对应关系建立失败\(error.localizedDescription)")
        }
    }
    
    /// 用户锻炼数据库
    private func createExerciseRecordTable() {
        do {
           try db?.run(transaction: {
               createTable(table: DBTableName.exerciseRecordTable, modelType: TYN_ExerciseRecordModel.self)
            })
            
        } catch let error {
            print("初始化数据库及ORM对应关系建立失败\(error.localizedDescription)")
        }
    }
    
    
    ///创建表
    private func createTable<T: TableDecodable>(table: DBTableName, modelType: T.Type) {
        do {
            try db?.create(table: table.rawValue, of: modelType)
        }catch let error {
            debugPrint(error.localizedDescription)
        }
    }
    
    ///插入数据
    public func inser<T: TableEncodable>(objects:[T], intoTable table: DBTableName, successCallBack:(() -> Void)? = nil){
        do {
            try db?.insert(objects: objects, intoTable: table.rawValue)
            successCallBack?()
        }catch let error {
            debugPrint(error.localizedDescription)
        }
    }

    ///修改
    public func update<T: TableEncodable>(fromTable table: DBTableName, on propertys:[PropertyConvertible], itemModel object:T,where condition: Condition? = nil, successCallBack:(() -> Void)? = nil, errorCallBack:(() -> Void)? = nil){
        do {
            try db?.update(table: table.rawValue, on: propertys, with: object, where: condition)
            successCallBack?()
        } catch let error {
            errorCallBack?()
            debugPrint(" update obj error \(error.localizedDescription)")
        }
    }

    ///删除
    public func deleteFromDb(fromTable table: DBTableName, where condition: Condition? = nil){
        do {
            try db?.delete(fromTable: table.rawValue, where:condition)
        } catch let error {
            debugPrint("delete error \(error.localizedDescription)")
        }
    }

    ///查询数组
    public func qurey<T: TableDecodable>(fromTable table: DBTableName, where condition: Condition? = nil, orderBy orderList:[OrderBy]? = nil) -> [T]? {
        do {
            let allObjects: [T] = try (db?.getObjects(fromTable: table.rawValue, where:condition, orderBy:orderList))!
            debugPrint("\(allObjects)");
            return allObjects
        } catch let error {
            debugPrint("no data find \(error.localizedDescription)")
        }
        return nil
    }
    
    ///查询是否存在
    public func qureyExist<T: TableDecodable>(fromTable table: DBTableName, where condition: Condition? = nil, orderBy orderList:[OrderBy]? = nil, successCallBack:(() -> Void)? = nil, errorCallBack:(() -> Void)? = nil) -> T? {
        do {
            var queryObject:T? = nil
            if let allObject:T = try db!.getObject(fromTable: table.rawValue, where: condition) {
                queryObject = allObject
                successCallBack?()
            }else {
                errorCallBack?()
            }

            return queryObject
        } catch let error {
            
            debugPrint("no data find \(error.localizedDescription)")
        }
        return nil
    }
    
    ///删除数据表
    func dropTable(table: DBTableName) -> Void {
        do {
            try db?.drop(table: table.rawValue)
        } catch let error {
            debugPrint("drop table error \(error)")
        }
    }
    
    /// 删除所有与该数据库相关的文件
    func removeDbFile() -> Void {
        do {
            try db?.close(onClosed: {
                try db?.removeFiles()
            })
        } catch let error {
            debugPrint("not close db \(error)")
        }
        
    }
   
}
