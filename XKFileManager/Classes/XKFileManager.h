//
//  XKFileManager.h
//  XKKit
//
//  Created by RyanMans on 2017/12/11.
//  Copyright © 2017年 chonglou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 文件管理(常见的文件管理方法)
 */
@interface XKFileManager : NSObject

/**
 *  获取沙盒主目录路径(NSHomeDirectory)
 *
 *  @return path
 */
+ (NSString*)xk_HomeDirectory;

/**
 *  获取Library目录(NSLibraryDirectory)
 *
 *  @return path
 */
+ (NSString*)xk_LibraryDirectory;

/**
 *  获取Caches目录路径(NSCachesDirectory)
 *
 *  @return path
 */

+ (NSString*)xk_CachesDirectory;

/**
 获取Document目录路径(NSDocumentDirectory)

 @return path
 */
+ (NSString*)xk_DocumentDirectory;


/**
 获取Temporary目录路径(NSTemporaryDirectory)
 
 @return path
 */
+ (NSString*)xk_TemporaryDirectory;

/**
 获取NSBundle资源路径

 @param resource 资源名称
 @param type 资源类型
 @return path
 */
+ (NSString*)xk_MainBundleWithResource:(NSString *)resource ofType:(NSString *)type;

/**
 获取沙盒主目录路径NSHomeDirectory()下 某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)xk_AppendingHomeDirectory:(NSString*)fileName;

/**
 获取Library目录路径 NSLibraryDirectory[0]，某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)xk_AppendingLibraryDirectory:(NSString*)fileName;

/**
 获取Caches目录路径 NSCachesDirectory[0]，某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)xk_AppendingCachesDirectory:(NSString*)fileName;

/**
 获取Document目录路径 NSDocumentDirectory[0]，某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)xk_AppendingDocumentDirectory:(NSString*)fileName;

/**
 获取temp 目录路径  NSTemporaryDirectory(),某文件目录路径
 
 @param fileName 文件名称
 @return path
 */
+ (NSString*)xk_AppendingTemporaryDirectory:(NSString*)fileName;

#pragma mark - fm

/**
 获取某路径下的所有子路径名

 @param path  文件路径
 @return array
 */
+ (nullable NSArray<NSString *> *)xk_SubpathsAtPath:(NSString*)path;

/**
 获取文件路径下的二进制数据

 @param path 文件路径
 @return data
 */
+ (nullable NSData*)xk_ContentsAtPath:(NSString*)path;

/**
 判断文件路径是否存在

 @param path 文件路径
 @return yes/no
 */
+ (BOOL)xk_FileExistsAtPath:(NSString*)path;

/**
 创建文件目录

 @param path 文件路径
 @return yes/no
 */
+ (BOOL)xk_CreateDirectoryAtPath:(NSString*)path;

/**
 重命名或者移动一个文件（to不能是已存在的）

 @param srcPath 旧路径
 @param dstPath  新路径
 @return yes/no
 */
+ (BOOL)xk_MoveItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath;

/**
 重命名或者复制一个文件（to不能是已存在的）
 
 @param srcPath 旧路径
 @param dstPath  新路径
 @return yes/no
 */
+ (BOOL)xk_CopyItemAtPath:(NSString*)srcPath toPath:(NSString *)dstPath;

/**
 删除文件

 @param path 文件路径
 @return yes/no
 */
+ (BOOL)xk_RemoveItemAtPath:(NSString*)path;

#pragma mark - NSUserDefaults -

/**
 取值 NSUserDefaults

 @param key defaultName
 @return id
 */
+ (id)xk_UserDefaultsObjectForKey:(NSString*)key;

/**
 存值 NSUserDefaults

 @param Object id
 @param key defaultName
 */
+ (void)xk_UserDefaultsSetObject:(id)Object forKey:(NSString *)key;

/**
 删值 NSUserDefaults

 @param key defaultName
 */
+ (void)xk_UserDefaultsRemoveObjectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
