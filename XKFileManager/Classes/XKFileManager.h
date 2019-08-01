//
//  XKFileManager.h
//  XKFileManager
//
//  Created by ALLen、 LAS on 2019/8/1.
//  Copyright © 2019 ALLen、 LAS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKFileManager : NSObject

/**
 *  获取沙盒主目录路径(NSHomeDirectory)
 *
 *  @return path
 */
+ (NSString*)homeDirectory;

/**
 *  获取Library目录(NSLibraryDirectory)
 *
 *  @return path
 */
+ (NSString*)libraryDirectory;

/**
 *  获取Caches目录路径(NSCachesDirectory)
 *
 *  @return path
 */
+ (NSString*)cachesDirectory;

/**
 获取Document目录路径(NSDocumentDirectory)
 
 @return path
 */
+ (NSString*)documentDirectory;

/**
 获取Temporary目录路径(NSTemporaryDirectory)
 
 @return path
 */
+ (NSString*)temporaryDirectory;

/**
 获取NSBundle资源路径
 
 @param name 资源名称
 @param ext  资源类型
 @return path
 */
+ (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext;

/**
 获取沙盒主目录路径NSHomeDirectory()下 某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)homeDirectoryByAppendingPathComponent:(NSString*)fileName;

/**
 获取Library目录路径 NSLibraryDirectory[0]，某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)libraryDirectoryByAppendingPathComponent:(NSString*)fileName;

/**
 获取Caches目录路径 NSCachesDirectory[0]，某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)cachesDirectoryByAppendingPathComponent:(NSString*)fileName;

/**
 获取Document目录路径 NSDocumentDirectory[0]，某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)documentDirectoryByAppendingPathComponent:(NSString*)fileName;

/**
 获取temp 目录路径  NSTemporaryDirectory(),某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)temporaryDirectoryByAppendingPathComponent:(NSString*)fileName;

#pragma mark - fm操作

/**
 判断文件路径是否存在
 
 @param path 文件路径
 @return yes/no
 */
+ (BOOL)fileExistsAtPath:(NSString*)path;

/**
 获取某路径下的所有子路径名
 
 @param path  文件路径
 @return array
 */
+ (nullable NSArray<NSString *> *)subpathsAtPath:(NSString*)path;

/**
 获取文件路径下的二进制数据
 
 @param path 文件路径
 @return data
 */
+ (nullable NSData*)contentsAtPath:(NSString*)path;

/**
 创建文件目录
 
 @param path 文件路径
 @return yes/no
 */
+ (BOOL)createDirectoryAtPath:(NSString*)path;

/**
 重命名或者移动一个文件（to不能是已存在的）
 
 @param srcPath 旧路径
 @param dstPath  新路径
 @return yes/no
 */
+ (BOOL)moveItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath;

/**
 重命名或者复制一个文件（to不能是已存在的）
 
 @param srcPath 旧路径
 @param dstPath  新路径
 @return yes/no
 */
+ (BOOL)copyItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath;

/**
 删除文件
 
 @param path 文件路径
 @return yes/no
 */
+ (BOOL)removeItemAtPath:(NSString*)path;

#pragma mark - NSUserDefaults操作

/**
 取值 NSUserDefaults
 
 @param key defaultName
 @return id
 */
+ (id)handleUserDefaultsObjectForKey:(NSString*)key;

/**
 存值 NSUserDefaults
 
 @param Object id
 @param key defaultName
 */
+ (void)handleUserDefaultsSetObject:(id)Object forKey:(NSString *)key;

/**
 删值 NSUserDefaults
 
 @param key defaultName
 */
+ (void)handleUserDefaultsRemoveObjectForKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
